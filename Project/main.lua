main = {
	files = { --order will matter
		"filehandling",
		"screensettings",
		"graphics",
	}
}
for k,v in ipairs(main.files) do
	require(v)
end

function love.load() main:init() end
function love.update(dt) main:update(dt) end
function love.quit() main:uninit() end
function love.draw() main:render() end

-- i prefer these function names 

function main:init()
	screensettings:init()
	graphics:init()
end

function main:update(dt)
	screensettings:update(dt)
	graphics:update(dt)
end

function main:render()
	screensettings:render()
	graphics:render()
end

function main:uninit()
	screensettings:uninit()
	graphics:uninit()
end

