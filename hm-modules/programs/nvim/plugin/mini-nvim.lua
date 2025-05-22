require("mini.ai").setup()          -- better "around" motions
require("mini.surround").setup()    -- surround edits
require("mini.icons").setup()       -- more icons
require("mini.trailspace").setup()  -- highlights trailing whitespace
require("mini.comment").setup()     -- comment/uncomment code
require("mini.operators").setup()   -- text edit operators (sort, evalute, replace, more...)
require("mini.completion").setup()  -- autocompletion (C-n/p to navigate popup)

local indentscope = require("mini.indentscope") -- adds a fancy scope indicator
indentscope.setup {
    symbol = ".",
    draw = { -- defines animation for the scope indicator
        animation = indentscope.gen_animation.quadratic({
            easing = 'in-out',
            duration = 300,
            unit = 'total'
        })
    },
}
