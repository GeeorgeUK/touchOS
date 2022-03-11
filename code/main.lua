local icons = require("icons")
local scenes = require("scenes")

if not icons then
    error("You must download the icons api to continue!")
end
if not scenes then
    error("You must download the scenes api to continue!")
end

-- We need to move all monitors into a global monitors table
local peripherals = peripheral.getNames()
Monitors, Reactors, Relays, Windows = {}, {}, {}, {}

for p = 1, #peripherals do
    if peripheral.getType(p) == "monitor" then
        table.insert(Monitors, {scene = "", handle = peripheral.wrap(p)})
    elseif peripheral.getType(p) == "BigReactors-reactor" then
        table.insert(Reactors, {name = "Untitled Reactor", handle = peripheral.wrap(p)})
    end
end

local function new_monitor( where )
    where.setTextScale(0.5)
    where.clear()
    where.setCursorPos(1,1)
    print("Found monitor at", where)
end

for index, monitor in pairs(Monitors) do
    -- Show splash welcome screen on every connected monitor for 1.5 seconds
    new_monitor( monitor.handle )
    monitor.handle.write("Welcome to CuddlesOS")
end

sleep(1.5)
for index, monitor in pairs(Monitors) do
    monitor.handle.setCursorPos(1,1)
    monitor.handle.clearLine()
    monitor.scene = "menu"
    scenes.display( monitor.handle, monitor.scene )
end
