return {
  {
    "leoluz/nvim-dap-go",
    opts = {
      -- Fix DWARF 5 debug_info issue
      delve = {
        -- Build with DWARF 4 and uncompressed debug info
        build_flags = "-gcflags='all=-N -l' -ldflags='-compressdwarf=false'",
      },
    },
  },
}
