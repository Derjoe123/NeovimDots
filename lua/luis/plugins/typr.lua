return { {
    "nvzone/typr",
    enabled = false,
    dependencies = { "nvzone/volt" },
    config = function()
        local typr = require("typr")
        typr.setup()
    end,
},
}
