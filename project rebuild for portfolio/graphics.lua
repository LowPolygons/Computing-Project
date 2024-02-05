graphics = {
	
	screenDimensions = {}, --empty by default
	data = {
		default = { --pane name
			backgroundColour = {100,100,100},
			buttons = {
				testSquare = {
					["type"] = "rectangle",
					dimensions = {.5,.5},
					position = {0.5,0.5},
					idle_colour = {255,0,0,255},
					hover_colour = {0,255,0,255},
					pressed_colour = {0,0,255,255},
					zLayer = 1,
					label = "Change pane",
					labelPos = {0, 0.5},
					labelColour = {0,0,0,255},
					newX = 0.5,
					newY = 0.5,
					textAlign = "center",
					positionMode = "center", --center or default
					func = function()
						graphics.currentPane = "other"
					end,
				}
			},
			textBoxs = {
				testBox = {
					outline = {
						colour = {230, 51, 51, 255},
						dimensions = {0.25, 0.1},
						position = {0.25, 0.25},
						zLayer = 1,
						positionMode = "center",
						label = "Test:",
					},
					box = {
						colour = {255, 100, 200, 255},
						pressedColour = {200, 50, 150, 255},
						hoverColour = {255, 150, 250, 255},
						colour = {255, 100, 200, 255},
						dimensions = {0.7, 0.8},
						position = {0.2, 0.1},
						storedData = "Click here to type!",
						labelColour = {0,0,0,255},
					},
				},
			},
			screenDecoration = {
				testCircle = {
					["type"] = "circle", --type is a keyword in lua so you can do this to get around the issue
					radius = 0.15, 	    --% of screen
					position = {0.2,0.5},
					colour = {200,255,200,255},
					zLayer = 1,
					label = "Test Circle!",
					labelPos = {0, 0},
					labelColour = {0,0,0,255},
					textAlign = "left",
				},
				testRectangle = {
					["type"] = "rectangle",
					dimensions = {0.5, 0.1},
					position = {0.5,0.5},
					colour = {255,200,200,255},
					zLayer = 2,
					label = "Is this centered",
					labelPos = {0, 0.5},
					labelColour = {0,0,0,255},
					textAlign = "center",
					positionMode = "center", --center or default
				},
				testSquare = {
					["type"] = "square",
					length = 0.25,
					position = {0.5,0.5},
					colour = {200,200,255,255},
					zLayer = 1,
					label = "{0.5,0.5}, PositionMode Center, text Center",
					labelPos = {0, 0.5},
					labelColour = {0,0,0,255},
					textAlign = "center",
					positionMode = "center", --center or default
				},
			},
		},
		other = {
			backgroundColour = {0,255,255},
			buttons = {
				testSquare = {
					["type"] = "rectangle",
					dimensions = {.1,.1},
					position = {0.5,0.5},
					idle_colour = {255,0,0,255},
					hover_colour = {0,255,0,255},
					pressed_colour = {0,0,255,255},
					zLayer = 1,
					label = "Change pane: default",
					labelPos = {0, 0.5},
					labelColour = {0,0,0,255},
					newX = 0.5,
					newY = 0.5,
					textAlign = "center",
					positionMode = "center", --center or default
					func = function()
						graphics.currentPane = "default"
					end,
				}
			},
			textBoxs = {
				testBox = {
					outline = {
						colour = {230, 51, 51, 255},
						dimensions = {0.25, 0.1},
						position = {0.75, 0.75},
						zLayer = 1,
						positionMode = "center",
						label = "Test:",
					},
					box = {
						colour = {255, 100, 200, 255},
						pressedColour = {200, 50, 150, 255},
						hoverColour = {255, 150, 250, 255},
						colour = {255, 100, 200, 255},
						dimensions = {0.7, 0.8},
						position = {0.2, 0.1},
						storedData = "Click here to type!",
						labelColour = {0,0,0,255},
					},
				},
			},
			screenDecoration = {
				testSquare = {
					["type"] = "square",
					length = 0.25,
					position = {0.1,0.1},
					colour = {255, 0, 0, 255},
					zLayer = 1,
					label = "",
					labelPos = {0, 0.5},
					labelColour = {0,0,0,255},
					textAlign = "center",
					positionMode = "center", --center or default
				},
			},
		}
	},
	mouseEvents = {
		defaultColour = {255,255,255,255}, --new fourth parameter: opacity. How opaque the mouse is
		LMBpressedColour = {150,150,150,255},
		RMBpressedColour = {100,100,100,255},
		
		barColour = {240,240,240,240},
		
		mouseScreenPercentage = 0.0025,
	},
	font = nil,
	
	currentFocus = "",
	currentFocusType = "",
	currentPane = "default",
	textboxHasFocus = false,
	pressFailsafe = false,
}
local firstTick = true -- allows an "Init" section of each

function graphics:init()
	love.mouse.setVisible(false) --hide the default system cursor
	self.screenDimensions[1], self.screenDimensions[2] = love.graphics.getDimensions()
	
	self.font = love.graphics.getFont()
end

function graphics:createBounds()
	for k,v in pairs(self.data[self.currentPane].buttons) do
		if v.type ~= "circle" then --circles already have all needed information for intersection detection
			local outerCoordinate = nil
			if v.type == "rectangle" then --the final position for the top left corner plus the dimensions
				outerCoordinate = {
					self.screenDimensions[1]*v.dimensions[1] + v.newX,
					self.screenDimensions[2]*v.dimensions[2] + v.newY
				} --position in pixels of bottom right corner
			else
				outerCoordinate = {
					self.screenDimensions[1]* v.length + v.newX, 
					self.screenDimensions[2]* v.length + v.newY
				} --position in pixels of bottom right corner				
			end
			
			v["outerCoordinate"] = outerCoordinate --adding the new value to the structure per button
		end
	end
end

function graphics:checkFocus()
	--buttons and text boxes simulatenously
	local x,y = love.mouse.getPosition()
	self.currentFocus = ""
	for k,v in pairs(self.data[self.currentPane].buttons) do
		if v.type == "rectangle" or v.type == "square" then
			if x > v.newX
				and x < v.outerCoordinate[1]
				and y > v.newY
				and y < v.outerCoordinate[2] then
				self.currentFocus = k
				self.currentFocusType = "button"
			end		
		elseif v.type == "circle" then
			local position = {v.position[1]*self.screenDimensions[1], v.position[2]*self.screenDimensions[2]}
			local dist = {position[1]-x, position[2]-y}--GET BACK TO THIS
			local mod = math.sqrt(dist[1]^2 + dist[2]^2)
			if mod < v.radius then
				self.currentFocus = k
				self.currentFocusType = "button"
			end
		end
	end
	for k,v in pairs(self.data[self.currentPane].textBoxs) do
		if x > v.box.textboxData[1]
			and x < (v.box.textboxData[1]+v.box.textboxData[3])
			and y > v.box.textboxData[2]
			and y < (v.box.textboxData[2]+v.box.textboxData[4]) then
			self.currentFocus = k
			self.currentFocusType = "textbox"
		end
	end
	
	if self.currentFocus == "" and love.mouse.isDown(1) or love.mouse.isDown(2) and self.textboxHasFocus then
		self.textboxHasFocus = false
	end
end

function graphics:render()
	local colour = self.data[self.currentPane].backgroundColour
	love.graphics.setBackgroundColor(colour[1]/255, colour[2]/255, colour[3]/255)
	--made a local reference to prevent a long-line cluster
	--divided by 255 as this expects inputs between 0 and 1
	--if not firstTick then --only happens AFTER the first tick
	self:createBounds() --boundaries for buttons/text boxes
	
	self:screenDecorationRender()

	self:buttonsRender() --rendered after screen Decoration so as to always  get priority
	
	self:textBoxRender()
	
	self:mouseRender()

	self:checkFocus()
end

function graphics:executeFunction()
	if self.currentFocus ~= "" then
		for k,v in pairs(self.data[self.currentPane].buttons) do
			if self.currentFocus == k and self.currentFocusType == "button" and love.mouse.isDown(1) and not pressFailsafe then
				pressFailsafe = true
				v["func"]()
			end
		end
		for k,v in pairs(self.data[self.currentPane].textBoxs) do
			if self.currentFocus == k and self.currentFocusType == "textbox" and love.mouse.isDown(1) and not pressFailsafe then
				pressFailsafe = true
				self.textboxHasFocus = self.currentFocus
			end			
		end
	end
	if not love.mouse.isDown(1) and not love.mouse.isDown(2) then
		pressFailsafe = false
	end
end

function love.keypressed( key, scancode, isrepeat ) -- a built in love 2d function : self explanatory
	graphics:textboxDataAppend(key, scancode, isrepeat)
end

function graphics:textboxDataAppend(key, scancode, isrepeat) --for when a text box has focus and data needs to be inserted into it
	
	if self.textboxHasFocus then
		local scope = self.data[self.currentPane].textBoxs[self.textboxHasFocus].box --so i dont have to rewrite this bajillions of times excluding when actually changing data
		local data = scope.storedData
		local width = self.font:getWidth(data.."M") --concatenated an additional character because we need to see if ading a character will overfow the textwrap
		--i also used a wide character because id rather it under fills than over fills the box
		 
		--may be better for sustainability to have a blacklist of scancodes and loop through, potentially investigate
		if scancode == "space" then scancode = " " end
		if scancode ~= "lshift" and scancode ~= "rshift"  and scancode ~= "capslock" and scancode ~= "return" and scancode ~= "tab" then --yeh self explanatory, dont want this appended to the data
			if scancode == "backspace" then 
				scope.storedData = data:sub(1,data:len()-1)
			else
				if width < scope.width then
					scope.storedData = data .. scancode
				end
			end
		end
	end
end

function graphics:buttonsRender()
	
	local correctColour = function(key,value)
		if self.currentFocus == key and self.currentFocusType == "button"  then
			if love.mouse.isDown(1) then --if LMB is down whilst button has focus, return the pressed colour, otherwise return hover colour
				return value.pressed_colour
			end
			return value.hover_colour
		end
		return value.idle_colour
	end

	local square = function(k,v)
		local chosenColour = correctColour(k,v)
		
		love.graphics.setColor(chosenColour[1]/255, chosenColour[2]/255, chosenColour[3]/255, chosenColour[4]/255)
		
		local newX = v.position[1] * self.screenDimensions[1]
		local newY = v.position[2] * self.screenDimensions[2]
		
		if v.positionMode == "center" then
			newX = (v.position[1] * self.screenDimensions[1]) - 0.5*(v.length * self.screenDimensions[1])
			newY = (v.position[2] * self.screenDimensions[2]) - 0.5*(v.length * self.screenDimensions[1])
		end
		
		--adding the new positions to the structure for use in intersection detection
		self.data[self.currentPane].buttons[k].newX = newX
		self.data[self.currentPane].buttons[k].newY = newY
		
		love.graphics.rectangle(  --mode, x, y, width, height
			"fill", 
			newX,
			newY,
			v.length * self.screenDimensions[1],
			v.length * self.screenDimensions[1]  --notice this is being multiplied also by the x of the screen: this makes sure the pixel size is correct
		)	
		if v.label ~= "" then --if its blank don't waste time rendering nothing
			
			love.graphics.setColor(v.labelColour[1],v.labelColour[2],v.labelColour[3],v.labelColour[4])
			love.graphics.printf(
				v.label, 
				newX+(v.labelPos[1]*(v.length * self.screenDimensions[1])),
				newY+(v.labelPos[2]*(v.length * self.screenDimensions[1])),
				(v.length * self.screenDimensions[1]), 
				v.textAlign
			)
			--text, x, y, length(how long to wrap text after), align
		end
	end
	local rectangle = function(k,v) 
		local chosenColour = correctColour(k,v)
		
		love.graphics.setColor(chosenColour[1]/255, chosenColour[2]/255, chosenColour[3]/255, chosenColour[4]/255)
		
		local newX = v.position[1] * self.screenDimensions[1]
		local newY = v.position[2] * self.screenDimensions[2]
		
		if v.positionMode == "center" then
			newX = (v.position[1] * self.screenDimensions[1]) - 0.5*(v.dimensions[1] * self.screenDimensions[1])
			newY = (v.position[2] * self.screenDimensions[2]) - 0.5*(v.dimensions[2] * self.screenDimensions[2])
		end
		self.data[self.currentPane].buttons[k].newX = newX
		self.data[self.currentPane].buttons[k].newY = newY
		
		love.graphics.rectangle(  --mode, x, y, width, height
			"fill", 
			newX,
			newY,
			v.dimensions[1] * self.screenDimensions[1],
			v.dimensions[2] * self.screenDimensions[2]
		)
		if v.label ~= "" then --if its blank don't waste time rendering nothing
		
			love.graphics.setColor(v.labelColour[1],v.labelColour[2],v.labelColour[3],v.labelColour[4])
			love.graphics.printf(
				v.label, 
				newX+(v.labelPos[1]*(v.dimensions[1] * self.screenDimensions[1])),
				newY+(v.labelPos[2]*(v.dimensions[2] * self.screenDimensions[2])),
				(v.dimensions[1] * self.screenDimensions[1]),
				v.textAlign
			)
		end
	end
	local circle = function(k,v) 
		local chosenColour = correctColour(k,v)
		
		love.graphics.setColor(chosenColour[1]/255, chosenColour[2]/255, chosenColour[3]/255, chosenColour[4]/255)
		
		love.graphics.circle(
			"fill", 
			v.position[1] * self.screenDimensions[1], 
			v.position[2] * self.screenDimensions[2],
			v.radius * self.screenDimensions[1]
		)
		if v.label ~= "" then --if its blank don't waste time rendering nothing

			love.graphics.setColor(v.labelColour[1],v.labelColour[2],v.labelColour[3],v.labelColour[4])
			love.graphics.printf(
				v.label, 
				newX+(v.labelPos[1]*(v.radius * self.screenDimensions[1])),
				newY+(v.labelPos[2]*(v.radius * self.screenDimensions[1])),
				(v.radius * self.screenDimensions[1]),
				v.textAlign
			)
		end
	end
	
	local localRender = function(k,v)
		--order of what is most common: rectangle, circle, square
		if v.type == "rectangle" then
			rectangle(k,v)
		elseif v.type == "circle" then
			circle(k,v)
		else
			square(k,v)
		end
	end
	
	local lowestZLayer = math.huge  --absurd figures so they always get over written on first instance
	local highestZLayer = -math.huge
	
	for k,v in pairs(self.data[self.currentPane].buttons) do --this loops through all items and determines the lowest an highest zLayer
		local currZ = v.zLayer 
		if currZ < lowestZLayer then 
			lowestZLayer = currZ
		end
		if currZ > highestZLayer then
			highestZLayer = currZ
		end
	end
	--inefficient loop
	for _zLayer = lowestZLayer, highestZLayer do  --for each zLayer between the lowest and highest, if any of the items have the current zLayer: render.
		for k,v in pairs(self.data[self.currentPane].buttons) do
			if v.zLayer == _zLayer then
				localRender(k,v)
			end
		end
	end
	
end

function graphics:textBoxRender()
		
		--self.textBoxs[k].newX = topLeft[1]
		--self.textBoxs[k].newY = topLeft[2]
	
	local correctColour = function(name,v)
		if self.currentFocus == name and self.currentFocusType == "textbox" then
			if love.mouse.isDown(1) then
				return v.pressedColour
			else
				return v.hoverColour
			end
		else
			return v.colour
		end
	end
	
	local render_textbox = function(v)
		love.graphics.setColor(v.colour[1]/255, v.colour[2]/255, v.colour[3]/255, v.colour[4]/255)
		
		local topLeft = {self.screenDimensions[1] * v.position[1], self.screenDimensions[2]*v.position[2]}
		
		if v.positionMode == "center" then
			topLeft[1] = topLeft[1] - 0.5*(v.dimensions[1]*self.screenDimensions[1])
			topLeft[2] = topLeft[2] - 0.5*(v.dimensions[2]*self.screenDimensions[2])
		end	
		
		local botRight = {topLeft[1]+(v.dimensions[1]*self.screenDimensions[1]), topLeft[2]+(v.dimensions[2]*self.screenDimensions[2])}		
		local difference = {(botRight[1]-topLeft[1]),(botRight[2]-topLeft[2])}
		
		love.graphics.rectangle(  --mode, x, y, width, height
			"fill", 
			topLeft[1],
			topLeft[2],
			v.dimensions[1] * self.screenDimensions[1],
			v.dimensions[2] * self.screenDimensions[2]
		)
		return topLeft, difference
	end --returns the topleft corner of the box in pixels as well as the width and height it spans in pixels
	
	for k,v in pairs(self.data[self.currentPane].textBoxs) do
		local outline = v.outline
		local box = v.box		--redefined so i do not have to refer to 'v' constantly	
		local corner, spanningRegion = render_textbox(outline)
		local colour = correctColour(k, box) --returns the correct colour based on the current focus level
		local textboxTextData = { --reduces clutter in the rectangle function, also useful for later on
			corner[1] + (spanningRegion[1]*box.position[1]), --x1
			corner[2] + (spanningRegion[2]*box.position[2]), --y1
			spanningRegion[1]*box.dimensions[1], --width x2
			spanningRegion[2]*box.dimensions[2]	--height y2
		}
		love.graphics.setColor(colour[1]/255,colour[2]/255,colour[3]/255,colour[4]/255)
		love.graphics.rectangle("fill",
			textboxTextData[1],
			textboxTextData[2],
			textboxTextData[3],
			textboxTextData[4]
		)
		self.data[self.currentPane].textBoxs[k].box.textboxData = textboxTextData
		love.graphics.setColor(box.labelColour[1]/255,box.labelColour[2]/255,box.labelColour[3]/255,box.labelColour[4]/255)
		--love.graphics.printf( text, x, y, limit, align,
		love.graphics.printf(
			outline.label,
			corner[1] + 0.025*spanningRegion[1],
			corner[2] + 0.5*spanningRegion[2],
			(spanningRegion[1]*box.dimensions[1])-corner[1],
			"left"
		)
		love.graphics.printf(
			box.storedData,
			textboxTextData[1] + 0.025*textboxTextData[3],
			textboxTextData[2] + 0.5*textboxTextData[4],
			0.975*textboxTextData[3],
			"left"
		)
		self.data[self.currentPane].textBoxs[k].box.width = 0.975*textboxTextData[3]
	end
end

function graphics:screenDecorationRender()
	local square = function(v)
		love.graphics.setColor(v.colour[1]/255, v.colour[2]/255, v.colour[3]/255, v.colour[4]/255)
		
		local newX = v.position[1] * self.screenDimensions[1]
		local newY = v.position[2] * self.screenDimensions[2]
		
		if v.positionMode == "center" then
			newX = (v.position[1] * self.screenDimensions[1]) - 0.5*(v.length * self.screenDimensions[1])
			newY = (v.position[2] * self.screenDimensions[2]) - 0.5*(v.length * self.screenDimensions[1])
		end
		love.graphics.rectangle(  --mode, x, y, width, height
			"fill", 
			newX,
			newY,
			v.length * self.screenDimensions[1],
			v.length * self.screenDimensions[1]  --notice this is being multiplied also by the x of the screen: this makes sure the pixel size is correct
		)	
		if v.label ~= "" then --if its blank don't waste time rendering nothing
			
			love.graphics.setColor(v.labelColour[1],v.labelColour[2],v.labelColour[3],v.labelColour[4])
			love.graphics.printf(
				v.label, 
				newX+(v.labelPos[1]*(v.length * self.screenDimensions[1])),
				newY+(v.labelPos[2]*(v.length * self.screenDimensions[1])),
				(v.length * self.screenDimensions[1]), 
				v.textAlign
			)
			--text, x, y, length(how long to wrap text after), align
		end
	end
	local rectangle = function(v) 
		love.graphics.setColor(v.colour[1]/255, v.colour[2]/255, v.colour[3]/255, v.colour[4]/255)
		
		local newX = v.position[1] * self.screenDimensions[1]
		local newY = v.position[2] * self.screenDimensions[2]
		--
		if v.positionMode == "center" then
			newX = (v.position[1] * self.screenDimensions[1]) - 0.5*(v.dimensions[1] * self.screenDimensions[1])
			newY = (v.position[2] * self.screenDimensions[2]) - 0.5*(v.dimensions[2] * self.screenDimensions[2])
		end
		
		love.graphics.rectangle(  --mode, x, y, width, height
			"fill", 
			newX,
			newY,
			v.dimensions[1] * self.screenDimensions[1],
			v.dimensions[2] * self.screenDimensions[2]
		)
		if v.label ~= "" then --if its blank don't waste time rendering nothing
		
			love.graphics.setColor(v.labelColour[1],v.labelColour[2],v.labelColour[3],v.labelColour[4])
			love.graphics.printf(
				v.label, 
				newX+(v.labelPos[1]*(v.dimensions[1] * self.screenDimensions[1])),
				newY+(v.labelPos[2]*(v.dimensions[2] * self.screenDimensions[2])),
				(v.dimensions[1] * self.screenDimensions[1]),
				v.textAlign
			)
		end
	end
	local circle = function(v) 
		love.graphics.setColor(v.colour[1]/255, v.colour[2]/255, v.colour[3]/255, v.colour[4]/255)
		love.graphics.circle(
			"fill", 
			v.position[1] * self.screenDimensions[1], 
			v.position[2] * self.screenDimensions[2],
			v.radius * self.screenDimensions[1]
		)
		if v.label ~= "" then --if its blank don't waste time rendering nothing

			love.graphics.setColor(v.labelColour[1],v.labelColour[2],v.labelColour[3],v.labelColour[4])
			love.graphics.printf(
				v.label, 
				v.position[1] * self.screenDimensions[1], 
				v.position[2] * self.screenDimensions[2],
				(v.radius * self.screenDimensions[1]),
				v.textAlign
			)
		end
	end
	
	local localRender = function(v)
		--order of what is most common: rectangle, circle, square
		if v.type == "rectangle" then
			rectangle(v)
		elseif v.type == "circle" then
			circle(v)
		else
			square(v)
		end
	end
	
	local lowestZLayer = math.huge  --absurd figures so they always get over written on first instance
	local highestZLayer = -math.huge
	
	for k,v in pairs(self.data[self.currentPane].screenDecoration) do --this loops through all items and determines the lowest an highest zLayer
		local currZ = v.zLayer 
		if currZ < lowestZLayer then 
			lowestZLayer = currZ
		end
		if currZ > highestZLayer then
			highestZLayer = currZ
		end
	end
	--inefficient loop
	for _zLayer = lowestZLayer, highestZLayer do  --for each zLayer between the lowest and highest, if any of the items have the current zLayer: render.
		for k,v in pairs(self.data[self.currentPane].screenDecoration) do
			if v.zLayer == _zLayer then
				localRender(v)
			end
		end
	end
	
end

function graphics:mouseRender()
	local x, y = love.mouse.getPosition() --Coordinates are relative to the top left corner of the screen being 0x0 and the bottom right being 1920x1080
	local mouseData = self.mouseEvents --preventing line clustering later on
	local mouseWidth = mouseData.mouseScreenPercentage * self.screenDimensions[1]
	
	
	love.graphics.setColor(mouseData.barColour[1]/255,mouseData.barColour[2]/255,mouseData.barColour[3]/255,mouseData.barColour[4]/255)
	
	love.graphics.rectangle( "line", 0, y-(0.25*mouseWidth), self.screenDimensions[1], mouseWidth/2)  --fillmode, x pos, y pos, width, height -- HORIZONTAL ONE
	love.graphics.rectangle( "line", x-(0.25*mouseWidth), 0, mouseWidth/2, self.screenDimensions[2]) -- VERTICAL ONE
	
	love.graphics.setColor(mouseData.defaultColour[1]/255, mouseData.defaultColour[2]/255, mouseData.defaultColour[3]/255, mouseData.defaultColour[4]/255)
	
	if love.mouse.isDown(2) then
		love.graphics.setColor(mouseData.RMBpressedColour[1]/255, mouseData.RMBpressedColour[2]/255, mouseData.RMBpressedColour[3]/255, mouseData.RMBpressedColour[4]/255)
	end
	--1 has priority therefore 2 is done first
	if love.mouse.isDown(1) then
		love.graphics.setColor(mouseData.LMBpressedColour[1]/255, mouseData.LMBpressedColour[2]/255, mouseData.LMBpressedColour[3]/255, mouseData.LMBpressedColour[4]/255)
	end
	
	love.graphics.circle("fill", x, y, mouseWidth) --mode, x, y, radius
end

function graphics:update(dt)
	self.screenDimensions[1], self.screenDimensions[2] = love.graphics.getDimensions()
	self:executeFunction()
end

function graphics:uninit()

end