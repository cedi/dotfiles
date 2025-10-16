return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      close_if_last_window = true,
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false,
          hide_by_name = {
            ".git",
            ".DS_Store",
          },
        },
      },
      window = {
        mappings = {
          ["Y"] = function(state)
            local node = state.tree:get_node()
            if not node or not node.id then
              vim.notify("No node selected.", vim.log.levels.WARN)
              return
            end

            if vim.fn.has("clipboard") == 0 then
              vim.notify("System clipboard is not available.", vim.log.levels.ERROR)
              return
            end

            local filepath = node:get_id()
            local filename = node.name
            local modify = vim.fn.fnamemodify

            -- Helper function to generate the VCS link
            local function get_vcs_link()
              -- 1. Get the root directory of the git repository
              local git_root_list = vim.fn.systemlist(
                "git -C " .. vim.fn.shellescape(modify(filepath, ":h")) .. " rev-parse --show-toplevel"
              )
              if vim.v.shell_error ~= 0 or #git_root_list == 0 then
                return nil -- Not a git repository
              end
              local git_root = git_root_list[1]

              -- 2. Get the remote URL (we assume 'origin')
              local remote_list =
                vim.fn.systemlist("git -C " .. vim.fn.shellescape(git_root) .. " remote get-url origin")
              if vim.v.shell_error ~= 0 or #remote_list == 0 then
                return nil -- No remote named 'origin'
              end
              local remote_url = remote_list[1]

              -- 3. Get the current branch name
              local branch_list =
                vim.fn.systemlist("git -C " .. vim.fn.shellescape(git_root) .. " rev-parse --abbrev-ref HEAD")
              if vim.v.shell_error ~= 0 or #branch_list == 0 then
                return nil -- Could not determine branch
              end
              local branch = branch_list[1]

              -- 4. Get the file path relative to the git root
              local relative_path = filepath:sub(#git_root + 2)

              -- 5. Parse the remote URL to get a base HTTPS URL
              local base_url = remote_url
                :gsub("%.git$", "") -- Remove .git suffix
                :gsub("git@github.com:", "https://github.com/") -- Convert SSH to HTTPS
                :gsub("git@gitlab.com:", "https://gitlab.com/") -- Support for GitLab
                :gsub("git@bitbucket.org:", "https://bitbucket.org/") -- Support for Bitbucket

              -- 6. Construct the final link
              -- Note: GitLab and others use `/-/blob/` instead of `/blob/`
              local link_pattern = "/blob/"
              if base_url:match("gitlab.com") then
                link_pattern = "/-/blob/"
              end

              return base_url .. link_pattern .. branch .. "/" .. relative_path
            end

            local choices = {
              { label = "Absolute path", value = filepath },
              { label = "Path relative to CWD", value = modify(filepath, ":.") },
              { label = "Path relative to HOME", value = modify(filepath, ":~") },
              { label = "Filename", value = filename },
              { label = "Filename without extension", value = modify(filename, ":r") },
              { label = "Extension of the filename", value = modify(filename, ":e") },
            }

            -- Conditionally add the VCS link option
            local vcs_link = get_vcs_link()
            if vcs_link then
              table.insert(choices, { label = "VCS Link", value = vcs_link })
            end

            require("snacks").picker.select(choices, {
              prompt = "Choose to copy to clipboard:",
              format_item = function(item)
                return string.format("%-30s %s", item.label, item.value)
              end,
            }, function(choice)
              if not choice then
                vim.notify("Copy cancelled.", vim.log.levels.INFO)
                return
              end

              local value_to_copy = choice.value

              vim.fn.setreg("+", value_to_copy)
              vim.notify("Copied to clipboard: " .. value_to_copy)
            end)
          end,
        },
      },
    },
  },
}
