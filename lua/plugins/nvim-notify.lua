return {
	"rcarriga/nvim-notify",
	config = function()
		require("notify").setup({
			background_colour = "#000000", -- Set the background color for notifications
			stages = "fade_in_slide_out", -- Define the animation style for notifications
			timeout = 5000, -- Notification timeout in milliseconds (5 seconds)
			max_height = 10, -- Max number of notification lines before scrolling
			max_width = 50, -- Max width of the notification
			render = "minimal", -- Use a simple render style (you can also use "default")
			icons = {
				ERROR = "",
				WARN = "",
				INFO = "",
				DEBUG = "",
				TRACE = "✎",
			}, -- Customize icons for different notification types
		})

		-- You can use it with a simple example like this:
		vim.notify = require("notify")
	end,
}
