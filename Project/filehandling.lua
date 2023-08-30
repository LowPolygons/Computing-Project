filehanding = {
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
					-- datatypes are `number`  `string`  `array_string`  `array_number`
					--eg => number : clanPopulation = 121;
					--eg => string : clanName = No Quotes Necessary;
					--eg => array_string : parameterTypes = {strength, speed, intelligence};
					--eg => array_number : previousAnnualPopulation = {100, 123, 242, 238, 388};
				--arrays should have the data between the { } seperated and then treated as CSV
}

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
]]--