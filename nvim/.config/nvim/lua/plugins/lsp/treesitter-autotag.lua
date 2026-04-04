return {
    "windwp/nvim-ts-autotag",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    opts = {
        -- I have to do this to get rid of an annoying warning
        opts = {
            -- Defaults
            enable_close = true, -- Auto close tags
            enable_rename = true, -- Auto rename pairs of tags
            enable_close_on_slash = false -- Auto close on trailing </
        }
    },
}