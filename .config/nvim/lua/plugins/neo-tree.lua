-- Fix contrast for neo-tree confirmation/input popups
local function fix_neotree_highlights()
  vim.api.nvim_set_hl(0, "NeoTreeMessage", { link = "Normal" })
  vim.api.nvim_set_hl(0, "NeoTreeDimText", { link = "Normal" })
  vim.api.nvim_set_hl(0, "NeoTreeFloatNormal", { link = "Normal" })
  vim.api.nvim_set_hl(0, "NeoTreeFloatTitle", { link = "Title" })
  vim.api.nvim_set_hl(0, "NeoTreeTitleBar", { link = "Title" })
end
vim.api.nvim_create_autocmd("ColorScheme", { callback = fix_neotree_highlights })
fix_neotree_highlights()

-- Cache for git repo info (avoids repeated shell calls)
local git_cache = {}

-- Get git info with caching (single shell call for all data)
local function get_git_info(filepath)
  local dir = vim.fn.fnamemodify(filepath, ":h")

  -- Check cache first
  if git_cache[dir] and (vim.loop.now() - git_cache[dir].time) < 5000 then
    return git_cache[dir].data
  end

  -- Single shell call to get all git info at once
  local cmd = string.format(
    "git -C %s rev-parse --show-toplevel 2>/dev/null && git -C %s remote get-url origin 2>/dev/null && git -C %s rev-parse --abbrev-ref HEAD 2>/dev/null",
    vim.fn.shellescape(dir),
    vim.fn.shellescape(dir),
    vim.fn.shellescape(dir)
  )

  local result = vim.fn.systemlist(cmd)
  if vim.v.shell_error ~= 0 or #result < 3 then
    git_cache[dir] = { time = vim.loop.now(), data = nil }
    return nil
  end

  local data = {
    root = result[1],
    remote = result[2],
    branch = result[3],
  }

  git_cache[dir] = { time = vim.loop.now(), data = data }
  return data
end

-- Build VCS link from cached git info
local function get_vcs_link(filepath)
  local git = get_git_info(filepath)
  if not git then
    return nil
  end

  local relative_path = filepath:sub(#git.root + 2)

  local base_url = git.remote
    :gsub("%.git$", "")
    :gsub("git@github.com:", "https://github.com/")
    :gsub("git@gitlab.com:", "https://gitlab.com/")
    :gsub("git@bitbucket.org:", "https://bitbucket.org/")
    :gsub("ssh://git@([^/]+)/", "https://%1/") -- Generic SSH URLs

  local link_pattern = base_url:match("gitlab") and "/-/blob/" or "/blob/"

  return base_url .. link_pattern .. git.branch .. "/" .. relative_path
end

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      close_if_last_window = true,
      hijack_netrw_behavior = "open_current", -- explicitly handle netrw
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

            local filepath = node:get_id()
            local filename = node.name
            local modify = vim.fn.fnamemodify

            local choices = {
              "Absolute path: " .. filepath,
              "Relative to CWD: " .. modify(filepath, ":."),
              "Relative to HOME: " .. modify(filepath, ":~"),
              "Filename: " .. filename,
              "Filename (no ext): " .. modify(filename, ":r"),
              "Extension: " .. modify(filename, ":e"),
            }

            local vcs_link = get_vcs_link(filepath)
            if vcs_link then
              table.insert(choices, "VCS Link: " .. vcs_link)
            end

            vim.ui.select(choices, { prompt = "Copy to clipboard:" }, function(choice)
              if not choice then
                return
              end
              -- Extract value after ": "
              local value = choice:match(": (.+)$")
              if value then
                vim.fn.setreg("+", value)
                vim.notify("Copied: " .. value)
              end
            end)
          end,
        },
      },
    },
  },
}
