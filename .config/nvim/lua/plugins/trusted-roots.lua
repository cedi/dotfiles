-- Skip the :trust prompt for project-local .nvim.lua files under the roots in
-- trusted-roots.json (shared) and trusted-roots.local.json (this machine,
-- gitignored), both next to init.lua. Turns on 'exrc' too.
return {
  "SpechtLabs/nvim-trusted-roots",
  lazy = false,
  opts = {},
}
