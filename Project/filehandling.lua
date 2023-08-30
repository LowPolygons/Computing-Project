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
	number = function(k,v)
		return "\t\tnumber : "..k.." = "..tostring(v)..";"
	end,
	["string"] = function(k,v)
		return "\t\tstring : "..k.." = "..tostring(v)..";"
	end,
	bool = function(k,v)
		return "\t\tstring : "..k.." = "..tostring(v)..";"
	end,
	array_string = function(k,v)
		local arrayData = "{"
		for key,val in ipairs(v) do
			arrayData = arrayData .. tostring(val) ..","
		end
		arrayData = arrayData:sub(1,arrayData:len()-1) .. "};" --gets rid of the last comma
		return "\t\tarray_string : "..k.." = "..arrayData
	end,
	array_number = function(k,v)
		local arrayData = "{"
		for key,val in ipairs(v) do
			arrayData = arrayData .. tostring(val) ..","
		end
		arrayData = arrayData:sub(1,arrayData:len()-1) .. "};" --gets rid of the last comma
		return "\t\tarray_number : "..k.." = "..arrayData
	end,
}

function filehandling:storeData(dataTable)
	local segmentNames = {}
	for k,v in pairs(dataTable) do table.insert(segmentNames, k) end --populating the above
	
	local writtenString = "["
	
	for k,v in ipairs(segmentNames) do
		writtenString = writtenString .. self:segmentConverter(v, dataTable[""..v])
	end
	
	writtenString = writtenString .. "\n" .. "]"
	
	success, message = love.filesystem.write( "testfile.txt", writtenString )
end

function filehandling:segmentConverter(key, data)
	local returnString = "\n\t" .. key .. " = (" --what will be appended to the file
	
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
