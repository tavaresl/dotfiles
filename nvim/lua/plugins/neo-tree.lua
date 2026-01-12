require('neo-tree').setup({
	filesystem = {
		filtered_items ={
			hide_dotfiles = false,
			hide_ignored = false,
			always_show_by_pattern = { -- uses glob style patterns
				".env*",
			},
		    never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
				".DS_Store",
				"thumbs.db"
		    },
		},
		follow_current_file = {
			enabled = true
		}
	},
	close_if_last_window = true,
	window = {
		position = "right",
	},
})
