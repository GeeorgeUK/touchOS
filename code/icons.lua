
local hex_colours = {}
hex_colours["F"] = colours.white
hex_colours["E"] = colours.orange
hex_colours["D"] = colours.magenta
hex_colours["C"] = colours.lightBlue
hex_colours["B"] = colours.yellow
hex_colours["A"] = colours.lime
hex_colours["9"] = colours.pink
hex_colours["8"] = colours.grey
hex_colours["7"] = colours.lightGrey
hex_colours["6"] = colours.cyan
hex_colours["5"] = colours.purple
hex_colours["4"] = colours.blue
hex_colours["3"] = colours.brown
hex_colours["2"] = colours.green
hex_colours["1"] = colours.red
hex_colours["0"] = colours.black

local function colour_to_hex( colour )
    --[[
        Converts a colour to its single hex code
    ]]
    for key, value in pairs( hex_colours ) do
        if value == colour then
            return tonumber( key )
        end
    end
    return "0"
end

local function hex_to_colour( hex )
    --[[
        Converts a single hex code to its colour number
    ]]
    return hex_colours[ tostring( hex ) ] or colours.black
end

local function save( path, data )
    --[[
        Saves an icon to a file
    ]]
    local filehandler = fs.open( path, "w" )
    for key, value in data do
        filehandler.write(value)
    end
    filehandler.close()
end

local function load( path )
    --[[
        Loads an image from a file
    ]]
    local data = {}
    local filehandler = fs.open( path, "r" )
    while true do
        local this_line = filehandler.readLine()
        if this_line == nil then break end
        table.insert( data, this_line )
    end
    filehandler.close()
    return data
end

local function plop( data, where, xpos, ypos )
    if not where then where = term end
    if not xpos or not ypos then xpos, ypos = 1, 1 end
    where.setCursorPos(xpos, ypos)
    for y = 1, #data do
        for x = 1, #data[y] do
            local c = string.sub( data[y], x, x )
            local s = hex_to_colour(c)
            where.setCursorPos(x, y)
            where.setBackgroundColour(c)
            where.write(" ")
        end
    end
end

return { plop = plop, load = load, save = save }
