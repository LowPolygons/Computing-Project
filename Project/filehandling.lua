filehandling = {
	--reading from a file
		--formatting read file data
		
	--writing to a file
		--formatting data into a storable format
			--CSV for named items
			--custom formatting for numerical data
				-- [ ] to note the start and end of a file
				-- ( ) to note the start and end of a section
				-- { } to note an array if necessary
				-- ; to note the end of a line
				-- : to seperate datatype to variablename
				-- each line should take on following format:
				-- datatype : name = value;
					-- datatypes are `number`  `string`  `bool   `array_string`  `array_number`
					--eg => number : clanPopulation = 121;
					--eg => boolean : fightCooldown = true;
					--eg => string : clanName = No Quotes Necessary;
					--eg => array_string : parameterTypes = {strength, speed, intelligence};
					--eg => array_number : previousAnnualPopulation = {100, 123, 242, 238, 388};
				--arrays should have the data between the { } seperated and then treated as CSV

--example file
--[[ is as follows:
[
	clan1 = (
		string : clanName = Vikings;
		number : clanAge = 3;
		array_number : populationHistory = {100, 150, 178};
	)
	clan2 = (
		string : clanName = Saxons;
		number : clanAge = 5;
		array_number : populationHistory = {100, 150, 178}, 278, 300};
	)
]

--above is exampled

--naturally due to the nature of this formatting concept, the data before being converted to a storable format must be in a similar table style format
]]--
	reformat_number = function(v)
		return tonumber(v)
	end,
	reformat_string = function(v)
		return tostring(v)
	end,
	reformat_bool = function(v)
		local _true = v:find("t", 1, true)
		if _true then return true end
		return false
	end,
	reformat_array_string = function(v)
		local data = {}
		local parsed = false
		local currentIndex = 0
		local newIndex = nil
		v = v:sub(2, v:len()-1)--cutting off the {}
		while not parsed do
			newIndex = v:find(",",currentIndex+1,true)
			if newIndex then
				table.insert(data, tostring( v:sub(currentIndex+1,newIndex-1) ))
				currentIndex = newIndex
			else
				table.insert(data, tostring( v:sub(currentIndex+1,v:len()) ))
				parsed = true 
			end
		end
		return data
	end,
	reformat_array_number = function(v)
		local data = {}
		local parsed = false
		local currentIndex = 0
		local newIndex = nil
		v = v:sub(2, v:len()-1)--cutting off the {}
		while not parsed do
			newIndex = v:find(",",currentIndex+1,true)
			if newIndex then
				table.insert(data, tonumber( v:sub(currentIndex+1,newIndex-1) ))
				currentIndex = newIndex
			else
				table.insert(data, tonumber( v:sub(currentIndex+1,v:len()) ))
				parsed = true 
			end
		end
		return data
	end,
	
	number = function(k,v)
		return "\t\t-number : "..k.." = "..tostring(v)..";"
	end,
	["string"] = function(k,v)
		return "\t\t-string : "..k.." = "..tostring(v)..";"
	end,
	bool = function(k,v)
		return "\t\t-bool : "..k.." = "..tostring(v)..";"
	end,
	array_string = function(k,v)
		local arrayData = "{"
		for key,val in ipairs(v) do
			arrayData = arrayData .. tostring(val) ..","
		end
		arrayData = arrayData:sub(1,arrayData:len()-1) .. "};" --gets rid of the last comma
		return "\t\t-array_string : "..k.." = "..arrayData
	end,
	array_number = function(k,v)
		local arrayData = "{"
		for key,val in ipairs(v) do
			arrayData = arrayData .. tostring(val) ..","
		end
		arrayData = arrayData:sub(1,arrayData:len()-1) .. "};" --gets rid of the last comma
		return "\t\t-array_number : "..k.." = "..arrayData
	end,
}

function filehandling:csv_parser(v)
	local data = {}
	local parsed = false
	local currentIndex = 0
	local newIndex = nil
	while not parsed do
		newIndex = v:find(",",currentIndex+1,true)
		if newIndex then
			table.insert(data, v:sub(currentIndex+1,newIndex-1))
			currentIndex = newIndex
		else
			if v:find(",", v:len()-1, true) then --incase the file has a comma at the very end
				table.insert(data, v:sub(currentIndex+1,v:len()-1) )
			else
				table.insert(data, v:sub(currentIndex+1,v:len()) )
			end
			parsed = true 
		end
	end
	return data
end

function filehandling:storeData(dataTable)
	local segmentNames = {}
	for k,v in pairs(dataTable) do table.insert(segmentNames, k) end --populating the above
	
	local writtenString = "["
	
	for k,v in ipairs(segmentNames) do
		writtenString = writtenString .. self:segmentConverter(v, dataTable[""..v])
	end
	
	writtenString = writtenString .. "\n" .. "]"
	
	success, message = love.filesystem.write( "testfile.tris", writtenString )
end

function filehandling:segmentConverter(key, data)
	local returnString = "\n\tsegment : " .. key .. " = (" --what will be appended to the file
	
	for k,v in pairs(data) do
		returnString = returnString .. "\n" .. self[""..self:typeDeterminer(v)](k,v)
	end
	
	return returnString .. "\n\t)"
end

function filehandling:typeDeterminer(var)
	if type(var) == "table" then
		if not var[1] then --empty arrays can just be string arrays
			return "array_string"
		end
		return "array_"..type(var[1])
	end
	return type(var)
end

function filehandling:segmenter(filedata)
	local returnTable = {}
	local parsed = false
	while not parsed do
		local curlyBracket, _ignore = filedata:find("(", 1, true) --returns two values hence the _ignore
		local closeCurly = nil
		
		local segmentName = nil
		local currentSegment = nil
		
		if curlyBracket then
			closeCurly, _ignore = filedata:find(")", 1, true)
			currentSegment = filedata:sub(curlyBracket+1, closeCurly-1)
			
			local start, nameStart = filedata:find("segment : ", 1, true)
			local nameEnd, _ignore = filedata:find(" = (", 1, true)
			segmentName = filedata:sub(nameStart+1, nameEnd-1)
			
			returnTable[""..segmentName] = currentSegment
			
			filedata = filedata:sub(closeCurly+1, filedata:len())
		else
			parsed = true
		end
	end
	
	return returnTable
end

function filehandling:reformatter(filedata)
	local filledTable = {}

	local segmentTable = self:segmenter(filedata) --contains a table where the key is the segment name and the value is a string 
	
	for k,currentData in pairs(segmentTable) do
		local parsed = false
		local current_Data = {}
		while not parsed do
			local startOfLine = currentData:find("-", 1, true)
			if startOfLine then
				local endOfLine = currentData:find(";", 1, true)
				--this should leave me with the indexes to leave smthn along the lines of `-type : variableName = value;`
				local typeEnd, nameStart = currentData:find(" : ", 1, true)
				local nameIsolator, valueStart = currentData:find(" = ", 1, true)
				local name = currentData:sub(nameStart+1, nameIsolator-1)
				local datatype = currentData:sub(startOfLine+1, typeEnd-1)
				local value = currentData:sub(valueStart+1, endOfLine-1)
				local returnedValue = self["reformat_"..datatype](value)
				current_Data[name] = returnedValue
				currentData = currentData:sub(endOfLine+1, currentData:len())
			else 
				parsed = true 
			end
		end
		filledTable[k] = current_Data
	end

	return filledTable
end