-- Inline images (kitty graphics protocol; cmux/ghostty is auto-detected) via snacks.image.
-- Conversion needs `magick`; pdf additionally needs ghostscript (`gs`).
return {
  "folke/snacks.nvim",
  opts = {
    image = {
      enabled = true,
      -- snacks' default list lacks "svg" (magick can rasterise it), so opening .svg would stay raw XML.
      -- Replaces the default list; keep in sync with snacks.image defaults when upgrading.
      formats = {
        "png", "jpg", "jpeg", "gif", "bmp", "webp", "tiff", "heic", "avif",
        "mp4", "mov", "avi", "mkv", "webm", "pdf", "icns", "svg",
      },
    },
  },
}
