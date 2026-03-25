return {
    "leonie-theobald/regput",
    -- leader "
    config = function()
        require("regput").setup({ 
          mappings = {
            stop = "<esc>",
         },
       })
    end,
}
