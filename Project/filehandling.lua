filehandling = {
	--reading from a file
		--formatting read file data
	
	--Simple Formatting Language (.sfl files)
	--writing to a file
		--formatting data into a storable format
			--CSV for named items
			--custom formatting for numerical data
				-- [ ] to note the start and end of a file
				-- ( ) to note the start and end of a section
				-- { } to note an array if necessary
				-- ; to note the end of a line
				-- - to note the start of a line
				-- : to seperate datatype to variablename
				-- each line should take on following format:
				-- datatype : name = value;
					-- datatypes are `number`  `string`  `bool   `array_string`  `array_number`  and `file_reference`
					--eg => -number : clanPopulation = 121;
					--eg => -boolean : fightCooldown = true;
					--eg => -string : clanName = No Quotes Necessary;
					--eg => -array_string : parameterTypes = {strength, speed, intelligence};
					--eg => -array_number : previousAnnualPopulation = {100, 123, 242, 238, 388};
					--eg => -file_reference : historicalStats = historicalStats.sfl;
				--arrays should have the data between the { } seperated and then treated as CSV

	--naturally due to the nature of this formatting concept, the data before being converted to a storable format must be in a similar table style format
	
	reformat_number = function(v)
		return tonumber(v)
	end,
	reformat_string = function(v)
		return tostring(v)
	end,
	reformat_boolean = function(v)
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
	reformat_fileReference = function(v)
		local contents, size = filehandling:readFileData(v)
		return filehandling:reformatter(contents)
	end,
	
	number = function(k,v)
		return "\t\t-number : "..k.." = "..tostring(v)..";"
	end,
	["string"] = function(k,v)
		return "\t\t-string : "..k.." = "..tostring(v)..";"
	end,
	boolean = function(k,v)
		return "\t\t-boolean : "..k.." = "..tostring(v)..";"
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
	fileReference = function(k,v)
		filehandling:storeData(v, k..".sfl")
		return "\t\t-fileReference : "..k.." = "..k..".sfl;"
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

function filehandling:storeData(dataTable, fileName)
	fileName = fileName or "testfile.sfl"
	local segmentNames = {}
	local otherNames = {}
	--ugly code alert but it gets the point across
	for k,v in pairs(dataTable) do
		if type(v) ~= "nil" and type(v) ~= "userdata" and type(v) ~= "function" and type(v) ~= "thread" then --any of these will be immediately ignored
			if type(v) == "table" then
				local segment = true
				for x,y in pairs(v) do --pairs for the key
					if type(x) == "number" then
						segment = false
						goto breakLoop --the rest is unecessary
					end
				end
				::breakLoop::
				if not segment then
					otherNames[k] = v
				else
					table.insert(segmentNames, k) --populating the above
				end
			else
				otherNames[k] = v
			end
		end
	end
	
	local writtenString = "["
	
	for k,v in pairs(otherNames) do
		local _type = self:typeDeterminer(v)
		if _type ~= "ignore" then
			writtenString = writtenString .. "\n" .. self["".._type](k,v)
		end
	end	
	
	for k,v in ipairs(segmentNames) do
		writtenString = writtenString .. self:segmentConverter(v, dataTable[""..v])
	end
	
	writtenString = writtenString .. "\n" .. "]"
	
	success, message = filehandling:writeFileData(fileName, writtenString)
end

function filehandling:segmentConverter(key, data)
	local returnString = "\n\tsegment : " .. key .. " = (" --what will be appended to the file
	
	for k,v in pairs(data) do
		local _type = self:typeDeterminer(v)
		if _type ~= "ignore" then
			returnString = returnString .. "\n" .. self["".._type](k,v)
		end
	end 
	
	return returnString .. "\n\t)"
end

function filehandling:typeDeterminer(var)
	if type(var) ~= "nil" and type(var) ~= "userdata" and type(var) ~= "function" and type(var) ~= "thread" then --any of these will be immediately ignored
		if type(var) == "table" then
			local _type = fileReferenceOrArray(var)
			if _type == "array" then 
				if type(var[1]) == "number"  then
					return "array_number"
				end
				return "array_string"--..type(var[1])
			else
				return "fileReference"
			end
		end
		return type(var)
	else
		return "ignore"
	end
end

function fileReferenceOrArray(_table)
	for k,v in pairs(_table) do --in a basic array the key will be the index adn therefore will be a number
		if type(k) == "number" then
			return "array"
		else 
			return "fileReference"
		end
	end
end

--POTENTIAL REWORK, SCAN FOR EVERY INSTANCE OF THE DIFFERENT TYPES AND THEN DO EACH ITEM IN TURN. FIRST DO A CHECK OF EVERY LOCATION OF SEGMENT, THEN THE VARIABLES. THIS ORDER IS CRUCIAL
--AS YOU WILL NEVER HAVE A SEGMENT IN A SEGMENT THIS CAN BE DONE BY FINDING EVERY INSTANCE OF SEGMENT, THE NEXT ")" AND THEN CHECKING THINGS IN THERE. THIS IS IMPERITIVE FOR THE SHEBANG TO WORK
function filehandling:segmenter(filedata)
	local returnTable = {}
	local current_Data = {}
	local parsed = false
	if filedata then
	while not parsed do
		local curlyBracket, _ignore = filedata:find("(", 1, true) --returns two values hence the _ignore
		local segmentPresent = filedata:find("segment", 1, true)
		local closeCurly = nil
		local segmentName = nil
		local currentSegment = nil
		
		if segmentPresent then
			closeCurly, _ignore = filedata:find(")", 1, true)
			currentSegment = filedata:sub(curlyBracket+1, closeCurly-1)
			
			local start, nameStart = filedata:find("segment : ", 1, true)
			local nameEnd, _ignore = filedata:find(" = (", 1, true)
			segmentName = filedata:sub(nameStart+1, nameEnd-1)
			
			returnTable[""..segmentName] = currentSegment
			
			filedata = filedata:sub(1, start-1) .. filedata:sub(closeCurly+1, filedata:len())
		end

		local segmentPresent = filedata:find("segment", 1, true)
		
		
		local startOfLine = filedata:find("-", 1, true)

		if not segmentPresent and startOfLine then
			endOfLine = filedata:find(";", 1, true) --this should leave me with the indexes to leave smthn along the lines of `-type : variableName = value;`
			typeEnd, nameStart = filedata:find(" : ", startOfLine, true)
			nameIsolator, valueStart = filedata:find(" = ", startOfLine, true)
			name = filedata:sub(nameStart+1, nameIsolator-1)
			datatype = filedata:sub(startOfLine+1, typeEnd-1)
			value = filedata:sub(valueStart+1, endOfLine-1)
			
			returnedValue = self["reformat_"..datatype](value)
			filedata = filedata:sub(endOfLine+1, filedata:len())
			current_Data[name] = returnedValue
		end
		if not filedata:find("-", 1, true) then
			parsed = true
		end
	end
	end
	return returnTable, current_Data
end

function filehandling:reformatter(filedata)
	local segmentTable, filledTable = self:segmenter(filedata) --contains a table where the key is the segment name and the value is a string 
	
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

function filehandling:readFileData(fileName)
	local contents, size = love.filesystem.read(fileName)
	return contents, size
end

function filehandling:writeFileData(fileName, data)
	local success, message = love.filesystem.write( fileName, data )
	
	return success, message
end