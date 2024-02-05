screensettings = {
	windowTitle = "Primordial Survival",
	iconFileName = "icon.png",
	
	displaySettings = { --flags to change, name must match the acual flag key else they will not overwrite
		fullscreen = false,
		centered = false,
		resizable = true,
		vsync = 0,
		minwidth = 1440,
		minheight = 900,
	},
	
	ingameSettings = {
		x = 1440,
		y = 900,
	},
	
	screenFlags = nil, --empty variable 
}

function screensettings:init()
	love.window.setTitle(self.windowTitle) --self explanatory
	
	self.displaySettings.x, self.displaySettings.y, self.screenFlags = love.window.getMode() --gets the parameters

	for k,v in pairs(self.displaySettings) do --note about pairs loops: THESE DO NOT HAVE A SET ORDER
		self.screenFlags[k] = v --update the variable in screenflags with name "k" to the value "v"
	end
	
	love.window.setMode(self.ingameSettings.x, self.ingameSettings.y, self.screenFlags) --updates the screen to have the new parameters
	
	local imageData = love.image.newImageData(self.iconFileName)
	local success = love.window.setIcon(imageData)
end

function screensettings:update(dt)
	self.displaySettings.x, self.displaySettings.y, self.screenFlags = love.window.getMode()
end

function screensettings:render()
end

function screensettings:uninit()
	love.window.close()
end