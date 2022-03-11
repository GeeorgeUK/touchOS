local icons = require("icons")

local function show_menu( where, items, index )
    local xSize, ySize = where.getSize()
    local mode
    if xSize >= 36 and ySize >= 24 then
        mode = "large"
    else
        mode = "small"
    end
    where.clear()
    where.setCursorPos(1,(ySize/2)-4)
    icons.plop("arrow_left")
    where.setCursorPos(xSize-8,(ySize/2)-4)

    --if mode == "small" then
        where.setCursorPos(xSize/2-4, (ySize/2)-4)
        icons.plop(items[index])
    --end
end

local function show_scene( where, scene )
end

return {show_menu, show_scene}
