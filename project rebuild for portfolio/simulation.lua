simulation = {
	clans = {}, --to be populated
	focusedClan = "", -- none by default
	paused = false,
	numOfWeeks = 0,
	numericalFigures = {},
	multipliers = {},
	affectors = {},
	biomeMultipliers = {},
}

function simulation:deleteClan()
	if self.focusedClan ~= "" then
		self.clans[self.focusedClan] = nil
		
		local scope = graphics.data.maingameScreen.textBoxs
		
		for k,v in pairs(scope) do
			v.box.storedData = ""
		end		
		
		graphics.data.maingameScreen.buttons[self.focusedClan].radius = 0
		
		self.focusedClan = ""
	end
	self:saveClans()
end

function simulation:deleteAllClans()
	for k,v in pairs(self.clans) do
		v = nil	
		
		graphics.data.maingameScreen.buttons[k].radius = 0
		
		self.focusedClan = ""
	end
	local scope = graphics.data.maingameScreen.textBoxs
	
	for k,v in pairs(scope) do
		v.box.storedData = ""
	end	
end

function simulation:updateDebugInfo()
	local things = {
		["Focused Clan"] = self.focusedClan,
		["Paused"] = tostring(self.paused),
		["Weeks Passed"] = tostring(self.numOfWeeks)
	}
	local text = ""
	
	if self.focusedClan ~= "" then
		things["Current Clan's Biome"] = tostring(self.clans[self.focusedClan]["currentBiome"])
	end
	
	for k,v in pairs(things) do
		text = text .. k .. " : " .. v .. "\n"
	end
	
	text = text .. "List of clans:\n"
	for k,v in pairs(self.clans) do
		text = text .. k .. ", "
	end
	
   graphics.data.maingameScreen.screenDecoration.debugScreen.label = text 
end

function simulation:initialiseClan()
	local scope = graphics.data.maingameScreen.textBoxs
	local tableOfValues = {}
	local name = ""
	
	for k,v in pairs(scope) do
		if k ~= "clanName" and k ~= "clanPopulation" then --handled seperately
			if v.box.storedData == "" and v.numberOnly then --if a parameter has not been filled in 
				v.box.storedData = tostring(self.numericalFigures.defaultValue)
			end
			tableOfValues[k] = tonumber(v.box.storedData) 
		end
	end
	
	if scope.clanPopulation.box.storedData == "" then
		scope.clanPopulation.box.storedData = self.numericalFigures.defaultPopulation
	end
	if scope.clanName.box.storedData == "" then
		scope.clanName.box.storedData = "Default_"..math.random(1000,9999) --random so no overwriting occurs
	end
	
	name = scope.clanName.box.storedData 
	tableOfValues["clanPopulation"] = scope.clanPopulation.box.storedData 
	
	--any further parsing or data addition needed is done here, etc population should be rounded to an integer.
	
	self.clans[name] = tableOfValues --creates the clan
	self.focusedClan = name
	
	self:clanButtonInitialisation(name)
	
	
	self:saveClans()
end

function simulation:clanButtonInitialisation(name, clan_data)
	local defaultTable = {
		["type"] = "circle",
		radius = self.numericalFigures.buttonDefaultRadius,
		idle_colour = {},
		position = {},
		hover_colour = {},
		pressed_colour = {},
		zLayer = 3,
		label = "", --these buttons will not have labels initially. this could change
		labelPos = {0.5,0.5},
		labelColour = {0,0,0,0},
		textAlign = "center",
		positionMode = "default",
		func = nil,
	}
	
	if not clan_data then
		local colour = {math.random(150,200), math.random(150,200), math.random(150,200), 255}
		--colours not the full range, so that the hover and pressed colour is consistent and taking away or adding a given number will not make the colours roll into < 0, or > 255
		defaultTable.idle_colour = colour
		defaultTable.hover_colour = {colour[1]+40, colour[2]+40, colour[3]+40, 255}
		defaultTable.pressed_colour = {colour[1]-40, colour[2]-40, colour[3]-40, 255}
		
		--for now i will just use the grass land
		selectedIsland = 1 -- an index
		
		local selectedIslandData = graphics.defaultBiomeData[selectedIsland].pixelData
		local pixelRadius = defaultTable.radius * graphics.screenDimensions[2] --the biomes use Y-axis, so these will too
		local maxRadius = selectedIslandData.radius - pixelRadius
		
		local randomAngle = math.random(0,360)
		local randomDistance = maxRadius*math.random() --IN PIXELS
		
		local offset = {randomDistance*math.cos(math.rad(randomAngle)), randomDistance*math.sin(math.rad(randomAngle))}
		
		defaultTable.position = {
			( offset[1] + selectedIslandData.position[1] ) / graphics.screenDimensions[1],
			( offset[2] + selectedIslandData.position[2] ) / graphics.screenDimensions[2]
		}
	else
		defaultTable.idle_colour = clan_data.idle_colour
		defaultTable.hover_colour = clan_data.hover_colour
		defaultTable.pressed_colour = clan_data.pressed_colour
		defaultTable.position = clan_data.position
	end

	defaultTable.func = function()
		self.focusedClan = name
	end
	
	self.clans[name].idle_colour = defaultTable.idle_colour
	self.clans[name].hover_colour = defaultTable.hover_colour
	self.clans[name].pressed_colour = defaultTable.pressed_colour
	self.clans[name].position = defaultTable.position 
	
	graphics.data.maingameScreen.buttons[name] = defaultTable
end

function simulation:naturalParamFluctuation()
	local stats = {"violence","medication","happiness","hungerDurability","thirstDurability","intelligence","aggressiveness","farming","religiousness","desiretobreed","coldResistance","heatResistance"}

	for clanName,currClan in pairs(self.clans) do --the current clan being updated
		--everys stat gets updated based on the last gen of values. hence, the new ones are only assigned at the end of the process
		if currClan then
			local finalStats = {}
			
			for _, val in ipairs(stats) do --the current stat that needs updating
				local prevGen = tonumber(currClan[""..val])
				local diff = math.min(prevGen, 2-prevGen)
				local omega = 0.95*diff
				local sumOfProducts = 0
				local numOfMultipliers = 1
				local randomValue = 0.025*diff*math.random(-1,1)*math.random()
				
				for x,y in ipairs(stats) do --loops through each parameter which affects the current stat
					local currStat_val = tonumber(currClan[y]) -- the current value of the given parameter
					local numOfMuls = #self.multipliers[""..y][""..val]
					local numOfAffs = #self.affectors[""..y][""..val]
					local mulIndex = 1
					local affIndex = 1 --the index of the item to use
					
					for counter = 1, numOfMuls do
						if currStat_val > (2 / (numOfMuls+1))*counter then
							mulIndex = counter
						else break end
					end	
					for counter = 1, numOfAffs do
						if currStat_val > (2 / (numOfAffs+1))*counter then
							affIndex = counter
						else break end
					end
				
					local curr_mul = self.multipliers[""..y][""..val][mulIndex] 
					local curr_aff =   self.affectors[""..y][""..val][affIndex]
					
					numOfMultipliers = numOfMultipliers + curr_mul
					sumOfProducts = sumOfProducts + (omega * curr_mul * curr_aff)
				end
				
				local finalValue = prevGen + (sumOfProducts + randomValue) / numOfMultipliers
				finalStats[val] = finalValue --adds it to the structure that will replace the clan's
			end
			
			for k,v in pairs(finalStats) do
				currClan[k] = tostring(v)
			end 
		end
	end
	self.numOfWeeks = self.numOfWeeks + 1
end

function simulation:saveClans()
	local clansToSave = {
		clans = {""}
	}
	for k,v in pairs(self.clans) do
		if v then
			table.insert(clansToSave.clans, k) --order not needed
			
			filehandling:storeData(v, k .. ".sfl") -- saves the current clan
		end
	end
	
	filehandling:storeData(clansToSave, "activeClans.sfl")
end

function simulation:updateTextBoxs()
	if self.focusedClan ~= "" then
		if not self.paused then
			local scope = graphics.data.maingameScreen.textBoxs
			local currentClan = self.clans[self.focusedClan]

			for k,v in pairs(scope) do
				v.box.storedData = currentClan[k]
			end
			scope.clanName.box.storedData = self.focusedClan
		end
	end
end

function simulation:updateClanData()
	if self.focusedClan ~= "" then
		local scope = graphics.data.maingameScreen.textBoxs
		local tableOfValues = {}
		
		for k,v in pairs(scope) do
			if k ~= "clanName" then --handled seperately
				if v.box.storedData == "" and v.numberOnly then --if a parameter has not been filled in 
					v.box.storedData = tostring(self.defaultValue)
				end
				tableOfValues[k] = tonumber(v.box.storedData) 
			end
		end
		
		tableOfValues.idle_colour = self.clans[self.focusedClan].idle_colour
		tableOfValues.hover_colour = self.clans[self.focusedClan].hover_colour
		tableOfValues.pressed_colour = self.clans[self.focusedClan].pressed_colour
		tableOfValues.position = self.clans[self.focusedClan].position 
		
		self.clans[self.focusedClan] = tableOfValues
	end
end

function simulation:loadSavedClans()
	if love.filesystem.getInfo("activeClans.sfl") then

		local clanNames, _ = filehandling:readFileData("activeClans.sfl") --the _ is the size of the file: not needed
		clanNames = filehandling:reformatter(clanNames)
		
		for k,v in ipairs(clanNames.clans) do 
			if love.filesystem.getInfo(v..".sfl") then
				local currClan, _ = filehandling:readFileData(v..".sfl")
				currClan = filehandling:reformatter(currClan)
				
				self.clans[v] = currClan
				self:clanButtonInitialisation(v, currClan)
			end
		end
	end
end

function simulation:init()
	saveTimer = self.numericalFigures.saveDelay
	self:loadSavedClans()
	gameplayCooldown = 0
end

function simulation:populationIncrease()
	for name, clanValue in pairs(self.clans) do
		local p = tonumber(clanValue.clanPopulation)
		local b = clanValue.desiretobreed
		
		clanValue.clanPopulation = math.max(0, math.floor(p + ((p*b) / 4)))
	end
end

function simulation:environmentalEffects()
	for name, clanValue in pairs(self.clans) do
		
		local currentBiome = ""
		local clanpos = clanValue.position				
		
		for k,v in ipairs(graphics.defaultBiomeData) do --gets the biome the clan is on
			if v.name ~= "ocean" then
				local data = v.pixelData
				local radius = data.radius
				local pos = data.position			
				local offset = {(clanpos[1]*graphics.screenDimensions[1])-pos[1],(clanpos[2]*graphics.screenDimensions[2])-pos[2]}
				local distance = math.sqrt(offset[1]^2 + offset[2]^2)
				
				if distance <= radius then --it is within the biome
					currentBiome = v.name
					--love.system.setClipboardText(v.name)
				end
			end
		end
		
		for k,v in pairs(self.biomeMultipliers[""..currentBiome]) do --multiplies by biome multipliers
			clanValue[k] = math.max(0, math.min(2, clanValue[k] * v))
		end
		
		clanValue["currentBiome"] = currentBiome
	end
end

function simulation:populationDecrease()
	for name, clanValue in pairs(self.clans) do
		local p = tonumber(clanValue.clanPopulation)
		local b = clanValue.desiretobreed
		local a = clanValue.aggressiveness
		local v = clanValue.violence
		local I = clanValue.intelligence
		local f = clanValue.hungerDurability
		local w = clanValue.thirstDurability
		local m = clanValue.medication
		
		local Q = ((p * a * (0.5 + math.random()/2)) / 4)
		_Q = (Q * (2-v)/8)*(0.5 + math.random()/2)
		p = p - _Q
		Q = Q - _Q
		Q = math.ceil(Q*(2-m)*(2-I))
		p = p - Q
		local X = math.abs((-1+f/2)*p/4) + math.abs((-1+w/2)*p/3)
		p = p - X + (math.random(-1,1)*0.05*X)
		clanValue.clanPopulation = math.max(0, math.floor(p))
		
		if clanValue.clanPopulation == 0 then
			self.clans[name] = nil
			
			if self.focusedClan == name then
				local scope = graphics.data.maingameScreen.textBoxs
				
				for k,v in pairs(scope) do
					v.box.storedData = ""
				end		

				self.focusedClan = ""
			end
			
			graphics.data.maingameScreen.buttons[name].radius = 0
			
			self:saveClans()		
		end
	end
end

function simulation:update(dt)
	if love.mouse.isDown(1) and graphics.currentFocus == "" and graphics.currentFocusType == "" and not graphics.textboxHasFocus then
		self.focusedClan = ""
	end
	
	if not self.clans[self.focusedClan] then --if it is nil, aka if it has been deleted
		self.focusedClan = ""
	end

	if not self.paused then
		self:updateTextBoxs()
	end
	
	saveTimer = math.max(0, saveTimer - dt) -- a counter that counts down in seconds to zero
	gameplayCooldown = math.max(0, gameplayCooldown - dt) -- a counter that counts down in seconds to zero
	
	if graphics.currentPane == "maingameScreen" then
		if self.numOfWeeks == 1 then
			self:populationIncrease()
			self:environmentalEffects()
		end
		if saveTimer == 0 then
			saveTimer = self.numericalFigures.saveDelay
			self:saveClans()
		end
		if gameplayCooldown == 0 and not self.paused then
			self:naturalParamFluctuation()
			gameplayCooldown = 1
			
			if self.numOfWeeks % self.numericalFigures.popIncMod == 0 then
				self:populationIncrease()
			end
			if self.numOfWeeks % self.numericalFigures.popDecreaseMod == 0 then
				self:populationDecrease()
			end
			if self.numOfWeeks % self.numericalFigures.biomeMultiplierMod == 0 then
				self:environmentalEffects()
			end
		end
	end
	
	self:updateDebugInfo()
end

function simulation:render()

end

function simulation:uninit()

end
