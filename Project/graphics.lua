graphics = {
	panes = { --these are the differnet states the game should have, eg homescreen, game modifications menu and the actual game itself
		homescreen = { --whatever is stored in each of these should have the same variable names
			backgroundActiveColour = {150,150,150,255},
			screenDecoration = { --purely for visual pleasure
				testBox = {
					zLayer = 0,
					shape = "rectangle",
					colour = {220, 220, 200, 255},
					position = {0.05, 0.1},
					width = 0.4,
					height = 0.8,
					displayedText = "",
					textColour = {1,1,1,1},
					textVertAlignPercentage = 0.3,
					textHozAlignPercentage = 0.025, 
				},
				testBox2 = {
					zLayer = 1,
					shape = "rectangle",
					colour = {220, 220, 200, 255},
					position = {0.65, 0.1},
					width = 0.4,
					height = 0.8,
					displayedText = "",
					textColour = {0.8,0.75,0.5,1},
					textVertAlignPercentage = 0.3,
					textHozAlignPercentage = 0.025,
				},
				testCircle = {
					zLayer = 2,
					shape = "circle",
					colour = {220, 220, 200, 255},
					position = {0.45, 0.1},
					width = 0.2,
					height = 0,
				},
				testCircle2 = {
					zLayer = -1,
					shape = "circle",
					colour = {20, 220, 30, 255},
					position = {0.65, 0.5},
					width = 0.2,
					height = 0,
				},
			},
			textBoxes = {
				testTextBox = {
					outline = { --dimensions are % of the window
						colour = {255, 100, 100, 255},
						labelColour = {100, 255, 100, 255},
						position = {0.055729166666667,0.17386478304743},
						width = 0.075,
						height = 0.025,
						displayedText = "Test:",
						textHozAlignPercentage = 0.05,
						textVertAlignPercentage = 0.2,
					},
					inputField = { --dimensions are % of the outline box
						colour = {200, 100, 234, 255},
						hovercolour = {250,200,255,255},
						pressedcolour = {100,50,150,255},
						position = {0.35, 0.1},
						width = 0.6,
						height = 0.8,
						storedData = "",
						textHozAlignPercentage = 0.05,
						textVertAlignPercentage = 0.2,
						textWrap = 0, --filled in later
					},
				},
				testTextBox2 = {
					outline = { --dimensions are % of the window
						colour = {100, 255, 100, 255},
						labelColour = {100, 100, 255, 255},
						position = {0.05625,0.10948536831483},
						width = 0.1,
						height = 0.05,
						displayedText = "Test Two:",
						textHozAlignPercentage = 0.05,
						textVertAlignPercentage = 0.2,
					},
					inputField = { --dimensions are % of the outline box
						colour = {200, 100, 234, 255},
						hovercolour = {250,200,255,255},
						pressedcolour = {100,50,150,255},
						position = {0.35, 0.1},
						width = 0.6,
						height = 0.8,
						storedData = "",
						textHozAlignPercentage = 0.05,
						textVertAlignPercentage = 0.2,
						textWrap = 0,
					},
				},
			},
			buttons = {
				["close"] = { --remember as percentages
					width = 0.005,
					b_type = "circle",
					height = 0.01,
					position = {0.99229166666667, 0.014518163471241},--vec2 as percentage. TOP LEFT CORNER
					colour = {255, 50, 50, 255},
					hovercolour = {255, 150, 150, 255},
					pressedcolour = {100, 50, 50, 255},
					displayedText = "",
					textColour = {1,1,1,1},
					textVertAlignPercentage = 0.3,
					textHozAlignPercentage = 0.3,
					func = function()
						love.window.close()
					--	graphics:buttonMovingHandler("close")
					end
				},
				["fullscreenToggle"] = { --remember as percentages
					width = 0.005,
					b_type = "circle",
					height = 0.01,
					position = {0.97958333333333, 0.014518163471241},--vec2 as percentage. TOP LEFT CORNER
					colour = {50, 50, 255, 255},
					hovercolour = {150, 150, 255, 255},
					pressedcolour = {50, 50, 100, 255},
					displayedText = "",
					textColour = {1,1,1,1},
					textVertAlignPercentage = 0.3,
					textHozAlignPercentage = 0.3,
					func = function()
						love.window.setFullscreen(not love.window.getFullscreen())
					--	graphics:buttonMovingHandler("fullscreenToggle")
					end
				},
				["paneChange"] = { --remember as percentages
					width = 0.05,
					b_type = "rectangle",
					height = 0.1,
					position = {0.4, 0.1},--vec2 as percentage. TOP LEFT CORNER
					colour = {50, 50, 255, 255},
					hovercolour = {150, 150, 255, 255},
					pressedcolour = {50, 50, 100, 255},
					displayedText = "Change Pane",
					textColour = {1,1,1,1},
					textVertAlignPercentage = 0.3,
					textHozAlignPercentage = 0.1,
					func = function()
						graphics:changePane("pane2")
					end
				},
				["random"] = { --remember as percentages
					width = 0.1625, 
					b_type = "rectangle",
					height = 0.099899091826438,
					position = {0.2375,0.49455095862765},--vec2 as percentage. TOP LEFT CORNER
					colour = {25, 46, 102, 255},
					hovercolour = {100, 150, 205, 255},
					pressedcolour = {12, 23, 50, 255},
					displayedText = "Hi Ben",
					textColour = {1,0,0.75,1},
					textVertAlignPercentage = 0.3,
					textHozAlignPercentage = 0.1,
					func = function()
						testFunction()
						--love.system.openURL("https://www.youtube.com/watch?v=dQw4w9WgXcQ")
					end
				},
			},
		},
		pane2 = {
			backgroundActiveColour = {0,0,0,255},
			screenDecoration = { --purely for visual pleasure
				testBox = {
					zLayer = 0,
					shape = "rectangle",
					colour = {220, 220, 200, 255},
					position = {0.05, 0.1},
					width = 0.4,
					height = 0.8,
					displayedText = "",
					textColour = {1,1,1,1},
					textVertAlignPercentage = 0.3,
					textHozAlignPercentage = 0.3,
				},
				testCircle = {
					zLayer = -1,
					shape = "circle",
					colour = {220, 220, 200, 255},
					position = {0.45, 0.1},
					width = 0.2,
					height = 0,
				},
			},
			textBoxes = {
				testTextBox = {
					outline = { --dimensions are % of the window
						colour = {255, 100, 100, 255},
						labelColour = {100, 255, 100, 255},
						position = {0.05625,0.23945509586276},
						width = 0.075,
						height = 0.025,
						displayedText = "Test",
						textVertAlignPercentage = 0.3,
						textHozAlignPercentage = 0.3,
					},
					inputField = { --dimensions are % of the outline box
						colour = {200, 100, 234, 255},
						hovercolour = {250,200,255,255},
						pressedcolour = {100,50,150,255},
						position = {0.35, 0.1},
						width = 0.6,
						height = 0.8,
						storedData = "",
						textHozAlignPercentage = 0.05,
						textVertAlignPercentage = 0.2,
						textWrap = 0,
					},
				},
			},
			buttons = {
				["close"] = { --remember as percentages
					width = 0.005,
					b_type = "circle",
					height = 0.01,
					position = {0.99229166666667, 0.014518163471241},--vec2 as percentage. TOP LEFT CORNER
					colour = {255, 50, 50, 255},
					hovercolour = {255, 150, 150, 255},
					pressedcolour = {100, 50, 50, 255},
					displayedText = "",
					textColour = {1,1,1,1},
					textVertAlignPercentage = 0.3,
					textHozAlignPercentage = 0.3,
					func = function()
						love.window.close()
					--	graphics:buttonMovingHandler("close")
					end
				},
				["fullscreenToggle"] = { --remember as percentages
					width = 0.005,
					b_type = "circle",
					height = 0.01,
					position = {0.97958333333333, 0.014518163471241},--vec2 as percentage. TOP LEFT CORNER
					colour = {50, 50, 255, 255},
					hovercolour = {150, 150, 255, 255},
					pressedcolour = {50, 50, 100, 255},
					displayedText = "",
					textColour = {1,1,1,1},
					textVertAlignPercentage = 0.3,
					textHozAlignPercentage = 0.3,
					func = function()
						love.window.setFullscreen(not love.window.getFullscreen())
					--	graphics:buttonMovingHandler("fullscreenToggle")
					end
				},
				["paneChange"] = { --remember as percentages
					width = 0.1,
					b_type = "rectangle",
					height = 0.1,
					position = {0.05625,0.11210898082744},--vec2 as percentage. TOP LEFT CORNER
					colour = {50, 50, 255, 255},
					hovercolour = {150, 150, 255, 255},
					pressedcolour = {50, 50, 100, 255},
					displayedText = "Homescreen",
					textColour = {1,1,1,1},
					textVertAlignPercentage = 0.3,
					textHozAlignPercentage = 0.3,
					func = function()
						graphics:changePane("homescreen")
						--graphics:buttonMovingHandler("paneChange")
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
	currentPressed = "",    --buttonName
	currentPressedType = "" , --type (text box field or buttonO)
	buttonMovementBool = false,--only ever changed in code as is a debugging tool
	
	--textbox stuff
	textBox_hasFocus = "",
	textBoxFailsafe = false,
	textfont = nil,
	textboxMovementBool = false, --only ever changed in code as is a debugging tool
	
	--moving button variables
	mover_firstTick = true,
	mover_offset = {0,0},
	
	fps = 0,
	
}

function graphics:init()
	--some global funcs
	square = function(v)
		love.graphics.rectangle("fill", self.windowDimensionsX*v.position[1], self.windowDimensionsY*v.position[2], self.windowDimensionsX*v.width, self.windowDimensionsX*v.width)
		
		love.graphics.setColor(v.textColour[1],v.textColour[2],v.textColour[3],v.textColour[4])
		
		love.graphics.printf(v.displayedText, (self.windowDimensionsX*v.position[1]), (self.windowDimensionsY*v.position[2]), self.windowDimensionsX*v.width, "center")
	end
	
	rectangle = function(v, writeText)
		writeText = writeText or true
		love.graphics.rectangle("fill", self.windowDimensionsX*v.position[1], self.windowDimensionsY*v.position[2], self.windowDimensionsX*v.width, self.windowDimensionsY*v.height)
		
		if writeText then
			love.graphics.setColor(v.textColour[1],v.textColour[2],v.textColour[3],v.textColour[4])
				
			love.graphics.printf(v.displayedText, (self.windowDimensionsX*(v.width*v.textHozAlignPercentage + v.position[1])), (self.windowDimensionsY*(v.height*v.textVertAlignPercentage + v.position[2])), self.windowDimensionsX*v.width, "center")
		end
	end
	
	circle = function(v)
		love.graphics.circle("fill", self.windowDimensionsX*v.position[1], self.windowDimensionsY*v.position[2], v.width*self.windowDimensionsX)
	end
	
	self.windowDimensionsX, self.windowDimensionsY = love.graphics.getDimensions()
	
	love.mouse.setVisible(false)
	self.mouseEvents.activeColour = self.mouseEvents.defaultColour
	
	for k,v in pairs(self.panes) do --colours are between 0 and 1 not 0 and 255
		v.backgroundActiveColour = {v.backgroundActiveColour[1]/255, v.backgroundActiveColour[2]/255, v.backgroundActiveColour[3]/255, v.backgroundActiveColour[4]/255}
	end

	local info = self.panes[self.currentPane]	
	
	--this is going to add the vec2 corners of each button to use for detection
	self:updateButtonbounds()
end

function graphics:update(dt)
	if math.abs((1/dt) - self.fps) >= 1 then
		self.fps = 1/dt --current fps
	end
	self.windowDimensionsX, self.windowDimensionsY = love.graphics.getDimensions()	
	
	self:updateButtonbounds()
	self:intersectionDetection()
end

function graphics:uninit()
	love.window.close()
end

function graphics:fpsDisplay()
	local fps = tostring(self.fps)
	
	love.graphics.setColor(0,0,0,1)
	love.graphics.print(fps:sub(1, 3), 20, 20)
end

function graphics:render()
	--self:fpsDisplay()
	self:updateBackground() --background colour
	self:paneUpdate()  --everything relating to the panes will be rendered here
	self:mouseRender() --handles the mouse rendering
end

function graphics:screenDecorationRendering(square, rectangle, circle)
	--to render zlayers, loop through and determine the lowest and highest zLayer, then just use a counter and iterative loop pair to render each item in increasing zLayer
	--COULD MAYBE OPTIMISE IN THE FUTURE
	local lowestZLayer = math.huge --absurd figures so they always get over written on first instance
	local highestZLayer = -math.huge

	local _renderFunc = function(v)
		love.graphics.setColor(v.colour[1]/255,v.colour[2]/255,v.colour[3]/255,v.colour[4]/255)
		if v.shape == "circle" then
			circle(v)
		else
			rectangle(v)
		end
	end
	
	for k,v in pairs(self.panes[self.currentPane].screenDecoration) do
		local currZ = v.zLayer
		if currZ < lowestZLayer then 
			lowestZLayer = currZ
		end
		if currZ > highestZLayer then
			highestZLayer = currZ
		end
	end
	
	for _zLayer = lowestZLayer, highestZLayer do
		for k,v in pairs(self.panes[self.currentPane].screenDecoration) do
			if v.zLayer == _zLayer then
				_renderFunc(v)
			end
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
	self.textfont = love.graphics.getFont()
	-- screen decoration
	self:screenDecorationRendering(square, rectangle, circle)
	--buttons
	self:displayButtons(square, rectangle, circle)
	--text box inputs
	self:textBoxRendering(square, rectangle, circle)
end

function graphics:textBoxRendering(square, rectangle, circle)
	--render the background for it first, then the text box field. 
	--This is to be similar to a button where clicking on it activates its focus, and then keyboard inputs are detected
	--buttonBounds is to be updated to contain this type of button too
	--outline and inputField
	
	local textbox_rectangle = function(v) --the actual field has coors relative to the size of this box therefore i need to gather a bit of data first
		love.graphics.rectangle("fill", self.windowDimensionsX*v.position[1], self.windowDimensionsY*v.position[2], self.windowDimensionsX*v.width, self.windowDimensionsY*v.height)
		local topCorner = {self.windowDimensionsX * (v.position[1] + v.width),self.windowDimensionsY * (v.position[2] + v.height)}
		local bottomCorner = {self.windowDimensionsX * (v.position[1]), self.windowDimensionsY * (v.position[2])}
		local diff = {topCorner[1]-bottomCorner[1],topCorner[2]-bottomCorner[2]}
		return bottomCorner, diff
	end
	
	for k,v in pairs(self.panes[self.currentPane].textBoxes) do
		--outline first
		local outline = v.outline
		local box = v.inputField
		love.graphics.setColor(outline.colour[1]/255,outline.colour[2]/255,outline.colour[3]/255,outline.colour[4]/255)
		
		local corner, spanningRegion = textbox_rectangle(outline)

		if self.currentPressed == k then
			if love.mouse.isDown(1) then
				if self.textboxMovementBool then self:textboxMovingHandler(k) end
				love.graphics.setColor(v.inputField.pressedcolour[1]/255, v.inputField.pressedcolour[2]/255, v.inputField.pressedcolour[3]/255, v.inputField.pressedcolour[4]/255)
				
				self.textBox_hasFocus = k
			else
				love.graphics.setColor(v.inputField.hovercolour[1]/255, v.inputField.hovercolour[2]/255, v.inputField.hovercolour[3]/255, v.inputField.hovercolour[4]/255)
			end
		else
			if self.currentPressed == "" then
				if love.mouse.isDown(1) or love.mouse.isDown(2) then
					self.textBox_hasFocus = ""
				end
			end
			love.graphics.setColor(v.inputField.colour[1]/255, v.inputField.colour[2]/255, v.inputField.colour[3]/255, v.inputField.colour[4]/255)
		end

		love.graphics.rectangle("fill", corner[1] + (spanningRegion[1]*box.position[1]), corner[2] + (spanningRegion[2]*box.position[2]), spanningRegion[1]*box.width, spanningRegion[2]*box.height)	
	
		local textboxTextData = {corner[1] + (spanningRegion[1]*box.position[1]), corner[2] + (spanningRegion[2]*box.position[2]), spanningRegion[1]*box.width, spanningRegion[2]*box.height}
	
		love.graphics.setColor(outline.labelColour[1]/255,outline.labelColour[2]/255,outline.labelColour[3]/255,outline.labelColour[4]/255)	
		
		love.graphics.printf(outline.displayedText, (self.windowDimensionsX*(outline.width*outline.textHozAlignPercentage + outline.position[1])), (self.windowDimensionsY*(outline.height*outline.textVertAlignPercentage + outline.position[2])), self.windowDimensionsX*outline.width, "left")	
		love.graphics.printf(box.storedData, 
			textboxTextData[1] + textboxTextData[3]*box.textHozAlignPercentage,
			textboxTextData[2] + textboxTextData[4]*box.textVertAlignPercentage, 
			spanningRegion[1]*(box.width-box.textHozAlignPercentage), 
		"left")	
		
		box.textWrap = spanningRegion[1]*(box.width-box.textHozAlignPercentage)
	end
	
end

function love.keypressed( key, scancode, isrepeat ) -- a built in love 2d function : self explanatory
	graphics:textboxDataAppend(key, scancode, isrepeat)
end

function graphics:textboxDataAppend(key, scancode, isrepeat) --for when a text box has focus and data needs to be inserted into it
	
	if self.textBox_hasFocus ~= "" then
		local scope = self.panes[self.currentPane].textBoxes[self.textBox_hasFocus].inputField --so i dont have to rewrite this bajillions of times excluding when actually changing data
		local data = scope.storedData
		local width = self.textfont:getWidth(data.."M") --concatenated an additional character because we need to see if ading a character will overfow the textwrap
		--i also used a wide character because id rather it under fills than over fills the box
		 
		--may be better for sustainability to have a blacklist of scancodes and loop through, potentially investigate
		if scancode == "space" then scancode = " " end
		if scancode ~= "lshift" and scancode ~= "rshift"  and scancode ~= "capslock" and scancode ~= "return" and scancode ~= "tab" then --yeh self explanatory, dont want this appended to the data
			if scancode == "backspace" then 
				self.panes[self.currentPane].textBoxes[self.textBox_hasFocus].inputField.storedData = data:sub(1,data:len()-1)
			else
				if width < scope.textWrap then
					self.panes[self.currentPane].textBoxes[self.textBox_hasFocus].inputField.storedData = data .. scancode
				end
			end
		end
	end
end

function graphics:displayButtons(square, rectangle, circle)
	
	for k,v in pairs(self.panes[self.currentPane].buttons) do
		if self.currentPressed == k then
			if love.mouse.isDown(1) then
				love.graphics.setColor(v.pressedcolour[1]/255, v.pressedcolour[2]/255, v.pressedcolour[3]/255, v.pressedcolour[4]/255)
				
				if not self.buttonFailsafe then
					if not self.buttonMovementBool then
						self.buttonFailsafe = true
						v["func"]()
					else
						self:buttonMovingHandler(k)
					end
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
	--potential optimisations: segment the screen into different uniform areas and then loop through only those present. This may be better for later on
	local m_x, m_y = love.mouse.getPosition()
	
	if self.currentPressed == "" then self.mover_offset = {0,0} self.mover_firstTick = true end
	
	self.currentPressed = ""
	for k,v in pairs(self.panes[self.currentPane].buttons) do
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
	
	for k,v in pairs(self.panes[self.currentPane].textBoxes) do
		if m_x >= v.bounds[1][1] and m_y >= v.bounds[1][2] then --if it is greater than or equal to the x coord of the top left corner
			if m_x <= v.bounds[2][1] and m_y <= v.bounds[2][2] then
				self.currentPressed = k
			end
		end
	end
	
end

function graphics:mouseRender()
	local x, y = love.mouse.getPosition()
	self.mouseEvents.mouseWidth = self.mouseEvents.mouseScreenPercentage*self.windowDimensionsX
	self.mouseEvents.activeColour = {1,1,1,0.5}
	
	local curr = self.panes[self.currentPane].backgroundActiveColour
	self.panes[self.currentPane].backgroundActiveColour = {math.max(20/255, math.min(230/255, curr[1] + math.random(-1,1)*(1/255))),math.max(20/255, math.min(230/255, curr[2] + math.random(-1,1)*(1/255))),math.max(20/255, math.min(230/255, curr[3] + math.random(-1,1)*(1/255))),1}
	
	
	self:updateColour()
	
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
	
	local textbox_rectangle = function(v)
		local box = v.outline
		local field = v.inputField
		local topCorner = {self.windowDimensionsX * (box.position[1] + box.width),self.windowDimensionsY * (box.position[2] + box.height)}
		local corner = {self.windowDimensionsX * (box.position[1]), self.windowDimensionsY * (box.position[2])}
		local spanningRegion = {topCorner[1]-corner[1],topCorner[2]-corner[2]}
		local bounds = {}
		
		table.insert(bounds, {corner[1] + (spanningRegion[1]*field.position[1]), corner[2] + (spanningRegion[2]*field.position[2])})
		table.insert(bounds, {corner[1] + (spanningRegion[1] * (field.width + field.position[1])),corner[2] + (spanningRegion[2] * (field.height + field.position[2]))})--, spanningRegion[1]*box.width, spanningRegion[2]*box.height)	
		
		v.bounds = bounds
	end

	for k,v in pairs(self.panes[self.currentPane].buttons) do
		if v.b_type == "square" then square(v)   		--in order of what is most common
		elseif v.b_type == "rectangle" then rectangle(v)
		elseif v.b_type == "circle" then circle(v)
		end
	end
	
	for k,v in pairs(self.panes[self.currentPane].textBoxes) do
		--in order of what is most common
		textbox_rectangle(v)
	end
end

function graphics:changePane(pane)
	self.currentPane = pane
end

function graphics:buttonMovingHandler(buttonName)
	local m_x, m_y = love.mouse.getPosition()
	local scope = self.panes[self.currentPane].buttons[buttonName]
	
	self:independentMovementHandler(m_x, m_y, scope)
end
function graphics:textboxMovingHandler(buttonName)
	local m_x, m_y = love.mouse.getPosition()
	local scope = self.panes[self.currentPane].textBoxes[buttonName].outline
	
	self:independentMovementHandler(m_x, m_y, scope)
end

function graphics:independentMovementHandler(m_x, m_y, scope)
	if self.mover_firstTick then 
		self.mover_firstTick = false
		self.mover_offset = { m_x - (scope.position[1]*self.windowDimensionsX), m_y - (scope.position[2]*self.windowDimensionsY) }
	end
	
	local newPos = {m_x - self.mover_offset[1], m_y - self.mover_offset[2]}
	scope.position = {newPos[1]/self.windowDimensionsX, newPos[2]/self.windowDimensionsY }
	
	love.system.setClipboardText("{"..scope.position[1]..","..scope.position[2].."}")
end

function testFunction()
	local lol = {
		poo = {
			cheese = "Helloe",
			i_hate_you = 3924.1234,
			test_vals = {255, 123, 52,12443, 234234, 23421249449},
			test_vals2 = {"all", "the", "small","things"},
			black_sabbath = {"poo", "13492", "idiot man", "ben is silly"},
		},
		eggs = {
			banana = "3io5rhg89",
			i_hate_you_too = 3924.1234,
			egronecrodefaeo = true,
			vest_tals = {255, 123, 52,12443, 234234, 23421249449},
		}
	}
	
	filehandling:storeData(lol)
	
	local contents, size = love.filesystem.read("testfile.sfl")
	_table = filehandling:reformatter(contents)
	--it flipping works
end