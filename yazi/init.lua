require("git"):setup {
  order = 1500,
}

require("yaziline"):setup()

require("full-border"):setup {
	-- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
	type = ui.Border.ROUNDED,
}
