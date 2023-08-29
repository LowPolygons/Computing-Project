screensettings = {
	fixed = {
		windowTitle = "Primordial Survival",
	},
	
	ingameSettings = { --these are alterable by the player eventually
		x = 800,
		y = 600,
	},
	displaySettings = { --flags, these are fixed, must have the same variable name as in the flags structure
		fullscreen = false,
		centered = true,
		resizable = true,
	},
	
	--these are what will be used in love functions and will be updated throughout the program
	screenFlags = nil,
	finalSettings = nil,
	debugColour = {1,1,1,1},
}

--love.graphics.setIcon


function screensettings:init()
	love.window.setTitle(self.fixed.windowTitle) --self explanatory
	
	--updates the those settings to the initial data of the screen, most relevant is the screenflags
	self.displaySettings.x, self.displaySettings.y, self.screenFlags = love.window.getMode()
	
	
	for k,v in pairs(self.displaySettings) do
		self.screenFlags[k] = v
	end
	--self.screenFlags.fullscreen = true
	love.window.setMode(self.ingameSettings.x, self.ingameSettings.y, self.screenFlags)
end

function screensettings:update(dt)
	self.displaySettings.x, self.displaySettings.y, self.screenFlags = love.window.getMode()
end

function screensettings:render()

	local counter = 1
	love.graphics.setColor(self.debugColour)
	--for k,v in pairs(self.screenFlags) do
		--counter = counter + 1
		--love.graphics.print(k..": ".. tostring(v), 30, 15*counter)
	--end
	--love.window.updateMode(self.ingameSettings.x, self.ingameSettings.y, self.displaySettings)
end

function screensettings:uninit()
	love.window.close()
end