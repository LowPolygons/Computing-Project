main = { -- a structure to contain any potentially important data needed throughout the main.lua file
	files = {
		"screensettings", --no .lua required
		"filehandling",
		"graphics",
		"maintenance",
		"simulation",
	}
}
for k,v in ipairs(main.files) do -- like "Import" in python, initialises any other files into the project
	require(v)
end

function love.load() main:init() end		 -- This was done for two reasons: init (initialise), uninit (uninitialise)
function love.update(dt) main:update(dt) end -- and render and all more appropriate names, but it also means these functions
function love.quit() main:uninit() end		 -- can now be extensions of the "main" structure, allowing access to the "self"
function love.draw() main:render() end		 -- utility. This will appear in all files.

function main:init()
	screensettings:init()
	graphics:init()
	maintenance:init()
	simulation:init()
end

function main:update(dt)
	screensettings:update(dt)
	graphics:update(dt)
	maintenance:update(dt)
	simulation:update(dt)
end

function main:render()
	screensettings:render()
	graphics:render()
	maintenance:render()
	simulation:render()
end

function main:uninit()
	screensettings:uninit()
	graphics:uninit()
	maintenance:uninit()
	simulation:uninit()
end

