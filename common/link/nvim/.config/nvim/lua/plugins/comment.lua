return {
    'numToStr/Comment.nvim',
    keys = {
        {"gcc", mode = {"n"}},
        {"gbc", mode = {"n"}},
        {"gc", mode = {"v"}},
        {"gb", mode = {"v"}},
        {"gcO", mode = {"n"}},
        {"gco", mode = {"n"}},
        {"gcA", mode = {"n"}}
    },
    config = function()
        require('Comment').setup({
        })
    end
}
