graphics = {
	panes = { --these are the differnet states the game should have, eg homescreen, game modifications menu and the actual game itself
		homescreen = { --whatever is stored in each of these should have the same variable names
			backgroundColour = {150,150,150,255},--{30, 200, 50, 255},
			backgroundActiveColour = {150,150,150,255},
			screenDecoration = {
				testBox = {
					colour = {220, 220, 200, 255},
					position = {0.5, 0.5},
					width = 0.4,
					height = 0.4,
				},
			},
			inputBoxes = {
				testInputBox = {
					outline = { --dimensions are % of the window
						colour = {100, 100, 234, 255},
						position = {0.3, 0.3},
						width = 0.075,
						height = 0.025,
					},
					inputField = { --dimensions are % of the outline box
						colour = {200, 100, 234, 255},
						position = {0.35, 0.1},
						width = 0.6,
						height = 0.8,
					},
				},
			},
			buttons = {
				["createNew"] = { --remember as percentages
					width = 0.05,
					b_type = "rectangle",
					height = 0.03,
					position = {0.4, 0.1},--vec2 as percentage. TOP LEFT CORNER
					colour = {50, 50, 255, 255},
					hovercolour = {150, 150, 255, 255},
					pressedcolour = {50, 50, 100, 255},
					displayedText = "Copy To Clipboard",
					textColour = {1,1,1,1},
					textVertAlignPercentage = 0, --what % of the button the text is based vertically, it is always aligned to the middle horizontally
					func = function()
						graphics:copyToClipboard()
					end
				},
				["toggleChange1"] = { --remember as percentages
					width = 0.05,
					b_type = "rectangle",
					height = 0.025,
					position = {0.4, 0.15},--vec2 as percentage. TOP LEFT CORNER
					colour = {50, 50, 255, 255},
					hovercolour = {150, 150, 255, 255},
					pressedcolour = {50, 50, 100, 255},
					displayedText = "Width",
					textColour = {1,1,1,1},
					textVertAlignPercentage = 0.3,
					func = function()
						graphics:updateParam("width")
					end
				},
				["toggleChange2"] = { --remember as percentages
					width = 0.05,
					b_type = "rectangle",
					height = 0.025,
					position = {0.4, 0.2},--vec2 as percentage. TOP LEFT CORNER
					colour = {50, 50, 255, 255},
					hovercolour = {150, 150, 255, 255},
					pressedcolour = {50, 50, 100, 255},
					displayedText = "Height",
					textColour = {1,1,1,1},
					textVertAlignPercentage = 0.3,
					func = function()
						graphics:updateParam("height")
					end
				},
				["new"] = {
					width = 0.065831355455521,
					b_type = "rectangle",
					height = 0.069135597941855,
					position = {0.5, 0.5},--vec2 as percentage. TOP LEFT CORNER
					colour = {200, 200, 200, 255},
					hovercolour = {150, 150, 150, 255},
					pressedcolour = {50, 50, 50, 255},
					displayedText = "New",
					textColour = {1,1,1,1},
					textVertAlignPercentage = 0.425,
					func = function()
					end
				},
			},
		},
	},
	
	mouseEvents = {
		defaultColour = {255/255, 255/255, 255/255, 255/255},
		LMBpressedColour = {150/255, 150/255, 150/255, 255/255},
		RMBpressedColour = {100/255, 100/255, 100/255, 255/255},
		
		activeColour = {1,1,1,1},
		
		mouseScreenPercentage = 0.0025, --size of the mouse relative to the screen. this is to be multiplied by the resolution of the window
	},
	windowDimensionsX, windowDimensionsY = 0, 0,
	currentPane = "homescreen", --only ever what is available in panes
	buttonFailsafe = false,
	currentPressed = "",
	
	
	--exclusively debugging tool variables
	mover_firstTick = true,
	mover_offset = {0,0},
	
	originalOffset = {0,0},
	changingParameter = "width", --default
}

function graphics:init()
	self.windowDimensionsX, self.windowDimensionsY = love.graphics.getDimensions()
	
	love.mouse.setVisible(false)
	self.mouseEvents.activeColour = self.mouseEvents.defaultColour
	
	for k,v in pairs(self.panes) do --colours are between 0 and 1 not 0 and 255
		v.backgroundColour = {v.backgroundColour[1]/255, v.backgroundColour[2]/255, v.backgroundColour[3]/255, v.backgroundColour[4]/255}
		v.backgroundActiveColour = {v.backgroundActiveColour[1]/255, v.backgroundActiveColour[2]/255, v.backgroundActiveColour[3]/255, v.backgroundActiveColour[4]/255}
	end

	local info = self.panes[self.currentPane]	
	
	love.graphics.setBackgroundColor(info.backgroundActiveColour[1], info.backgroundActiveColour[2], info.backgroundActiveColour[3], info.backgroundActiveColour[4])
	
	self:updateButtonbounds()
end

function graphics:update(dt)
	self.windowDimensionsX, self.windowDimensionsY = love.graphics.getDimensions()	
	
	--run before any rendering related tingz
	self:updateButtonbounds()
	self:intersectionDetection()
	self:scalingStuff()
	
end

function graphics:render()
	self:paneUpdate()
	self:mouseTesting()
end

function graphics:uninit()
	love.window.close()
end


function graphics:scalingStuff()
	local x, y = love.mouse.getPosition()
	
	if self.currentPressed == "" then
		if love.mouse.isDown(1) then
			if not self.buttonFailsafe then
				self.originalOffset = {x,y}
				--self.panes[self.currentPane].buttons["new"].position = {x,y}--self.originalOffset
			end
			self.buttonFailsafe = true
			local diff = {self.originalOffset[1] - x, self.originalOffset[2] - y}
			local distance = math.sqrt( diff[1]^2 + diff[2]^2 )
			local relativeDist = distance / self.windowDimensionsX
			
			self.panes[self.currentPane].buttons["new"].width = math.abs(diff[1]) / self.windowDimensionsX
			self.panes[self.currentPane].buttons["new"].height = math.abs(diff[2]) / self.windowDimensionsY
		else
			self.buttonFailsafe = false
		end
	end
end

function graphics:updateButtonbounds()
	local square = function(v)
		local bounds = {} --screen coords, TL/TR/BR/BL
		table.insert(bounds, {self.windowDimensionsX*v.position[1],self.windowDimensionsX*v.position[2]})
		table.insert(bounds, {self.windowDimensionsX*(v.position[1]+v.width),self.windowDimensionsX*(v.position[2]+v.width)})
		
		v.bounds = bounds	
	end
	
	local rectangle = function(v)
		local bounds = {} --screen coords, TL/TR/BR/BL
		table.insert(bounds, {self.windowDimensionsX*v.position[1],self.windowDimensionsY*v.position[2]})
		table.insert(bounds, {self.windowDimensionsX*(v.position[1]+v.width),self.windowDimensionsY*(v.position[2]+v.height)})
		
		v.bounds = bounds	
	end
	
	local circle = function(v)
		v.bounds = v.width*self.windowDimensionsX
	end

	for k,v in pairs(self.panes[self.currentPane].buttons) do
		if v.b_type == "square" then square(v)   		--in order of what is most common
		elseif v.b_type == "rectangle" then rectangle(v)
		elseif v.b_type == "circle" then circle(v)
		end
	end
end

function graphics:updateColour()
	love.graphics.setColor(self.mouseEvents.activeColour[1],self.mouseEvents.activeColour[2],self.mouseEvents.activeColour[3],self.mouseEvents.activeColour[4])
end

function graphics:updateBackground()
	local info = self.panes[self.currentPane]
	
	love.graphics.setBackgroundColor(info.backgroundActiveColour[1], info.backgroundActiveColour[2], info.backgroundActiveColour[3], info.backgroundActiveColour[4])
end

function graphics:paneUpdate()
	square = function(v)
		love.graphics.rectangle("fill", self.windowDimensionsX*v.position[1], self.windowDimensionsY*v.position[2], self.windowDimensionsX*v.width, self.windowDimensionsX*v.width)
		
		love.graphics.setColor(v.textColour[1],v.textColour[2],v.textColour[3],v.textColour[4])
		
		love.graphics.printf(v.displayedText, (self.windowDimensionsX*v.position[1]), (self.windowDimensionsY*v.position[2]), self.windowDimensionsX*v.width, "center")
	end
	
	rectangle = function(v)
		love.graphics.rectangle("fill", self.windowDimensionsX*v.position[1], self.windowDimensionsY*v.position[2], self.windowDimensionsX*v.width, self.windowDimensionsY*v.height)
		
		love.graphics.setColor(v.textColour[1],v.textColour[2],v.textColour[3],v.textColour[4])
				
		love.graphics.printf(v.displayedText, (self.windowDimensionsX*v.position[1]), (self.windowDimensionsY*(v.height*v.textVertAlignPercentage + v.position[2])), self.windowDimensionsX*v.width, "center")
	end
	
	circle = function(v)
		love.graphics.circle("fill", self.windowDimensionsX*v.position[1], self.windowDimensionsY*v.position[2], v.width*self.windowDimensionsX)
		
		--love.graphics.setColor(v.textColour[1],v.textColour[2],v.textColour[3],v.textColour[4])
		
		--love.graphics.printf(v.displayedText,(self.windowDimensionsX*v.position[1]), (self.windowDimensionsY*v.position[2]), self.windowDimensionsX*v.width, "center")
	end
	
	for k,v in pairs(self.panes[self.currentPane].buttons) do
		if self.currentPressed == k then
			if love.mouse.isDown(1) then
				love.graphics.setColor(v.pressedcolour[1]/255, v.pressedcolour[2]/255, v.pressedcolour[3]/255, v.pressedcolour[4]/255)
				
				if not self.buttonFailsafe then
					--self.buttonFailsafe = true
					v["func"]()
				end
			else
				self.buttonFailsafe = false
				love.graphics.setColor(v.hovercolour[1]/255, v.hovercolour[2]/255, v.hovercolour[3]/255, v.hovercolour[4]/255)
			end
		else
			love.graphics.setColor(v.colour[1]/255, v.colour[2]/255, v.colour[3]/255, v.colour[4]/255)
		end
		
		if v.b_type == "square" then square(v)   		--in order of what is most common
		elseif v.b_type == "rectangle" then rectangle(v)
		elseif v.b_type == "circle" then circle(v)
		end
	end
end

function graphics:intersectionDetection()
	--perhaps optimise later, for now loop through each button which isnt too detrimental as there are few buttons
	local m_x, m_y = love.mouse.getPosition()
	
	if self.currentPressed == "" then self.mover_offset = {0,0} self.mover_firstTick = true end
	
	self.currentPressed = ""
	for k,v in pairs(self.panes[self.currentPane].buttons) do
		-- just a massive if statement really
		if v.b_type ~= "circle" then
			if m_x >= v.bounds[1][1] and m_y >= v.bounds[1][2] then --if it is greater than or equal to the x coord of the top left corner
				if m_x <= v.bounds[2][1] and m_y <= v.bounds[2][2] then
					self.currentPressed = k
				end
			end
		else
			local dist = math.sqrt(
				(v.position[1]*self.windowDimensionsX - m_x)^2 +
				(v.position[2]*self.windowDimensionsY - m_y)^2
			)
			if dist <= v.bounds then
				self.currentPressed = k
			end
		end
	end
end

function graphics:mouseTesting()
	local x, y = love.mouse.getPosition()
	self.mouseEvents.mouseWidth = self.mouseEvents.mouseScreenPercentage*self.windowDimensionsX
	self.mouseEvents.activeColour = {1,1,1,0.5}
	
	local curr = self.panes[self.currentPane].backgroundActiveColour
	self.panes[self.currentPane].backgroundActiveColour = {math.max(20/255, math.min(230/255, curr[1] + math.random(-1,1)*(1/255))),math.max(20/255, math.min(230/255, curr[2] + math.random(-1,1)*(1/255))),math.max(20/255, math.min(230/255, curr[3] + math.random(-1,1)*(1/255))),1}
	
	
	self:updateColour()
	self:updateBackground()
	
	--cool bars
	love.graphics.rectangle( "line", 0, y-(0.25*self.mouseEvents.mouseWidth), self.windowDimensionsX, self.mouseEvents.mouseWidth/2) --horizontal one
	love.graphics.rectangle( "line", x-(0.25*self.mouseEvents.mouseWidth), 0, self.mouseEvents.mouseWidth/2 , self.windowDimensionsY) --horizontal one
		
	self.mouseEvents.activeColour = self.mouseEvents.defaultColour
		
	if love.mouse.isDown(2) then
		self:rmb()
	end
	--1 has priority therefore 2 is done first
	if love.mouse.isDown(1) then
		self:lmb()
	end
	
	self:updateColour()
	
	--cursor
	love.graphics.circle("fill", x, y, self.mouseEvents.mouseWidth)
end

function graphics:lmb()
	self.mouseEvents.activeColour = self.mouseEvents.LMBpressedColour
end

function graphics:rmb()
	self.mouseEvents.activeColour = self.mouseEvents.RMBpressedColour
end

function graphics:updateParam(v)
	self.changingParameter = v
end

function graphics:copyToClipboard()
	local scope = self.panes[self.currentPane].buttons["new"]
	love.system.setClipboardText("{".. scope.width .. ", ".. scope.height .. "}")
end


function graphics:changePane(pane)
	self.currentPane = pane
end

function graphics:buttonMovingHandler(buttonName)
	local m_x, m_y = love.mouse.getPosition()
	local scope = self.panes[self.currentPane].buttons[buttonName]
	
	if self.mover_firstTick then 
		self.mover_firstTick = false
		self.mover_offset = { m_x - (scope.position[1]*self.windowDimensionsX), m_y - (scope.position[2]*self.windowDimensionsY) }
	end
	
	local newPos = {m_x - self.mover_offset[1], m_y - self.mover_offset[2]}
	scope.position = {newPos[1]/self.windowDimensionsX, newPos[2]/self.windowDimensionsY }
end

	--[[local str = "Mouse: ["..x..","..y.."], ["..x/self.windowDimensionsX..","..y/self.windowDimensionsY.."]"
	
	love.graphics.print(str, 100, 80)
	
	local counter = 1
	for k,v in pairs(self.panes[self.currentPane].buttons) do
		local curr = k.. ": ["..v.position[1]..","..v.position[2].."], ["..v.position[1]*self.windowDimensionsX..","..v.position[2]*self.windowDimensionsY.."]"
		str = str .. "     ,      " .. curr
		love.graphics.print(curr, 100, 100+20*counter)
		counter = counter+1
	end
	love.system.setClipboardText(str)]]--