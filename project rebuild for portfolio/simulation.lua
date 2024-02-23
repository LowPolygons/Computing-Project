simulation = {
	clans = {}, --to be populated
	defaultValue = "1", -- may vary 
	focusedClan = "", -- none by default
	buttonDefaultRadius = 0.01,
	paused = true,
	saveDelay = 120, --seconds
	
--[[
			violence 		 = {},
			intelligence 	 = {},
			aggressiveness   = {},
			farming 		 = {},
			religiousness 	 = {},
			desiretobreed 	 = {},
			coldResistance   = {},
			heatResistance 	 = {},
			medication 		 = {},
			happiness		 = {},
			hungerDurability = {},
			thirstDurability = {},
]]--
	multipliers = { -- > 1, how much influence a parameter has on the result. order 0 -> 2
		violence = {	--if a parameter has no influence on another, its multiplier is zero
			violence 		 = {0},  
			intelligence 	 = {3,2.5,2.25,1.5},
			aggressiveness   = {8}, --regardless of how violent/unviolent, it always has a large effect
			farming 		 = {2,2,1.5,1},
			religiousness 	 = {0},
			desiretobreed 	 = {4,3,2,1.5,2,3,4}, --super violent will have diminishing returns
			coldResistance   = {0},
			heatResistance 	 = {0},
			medication 		 = {4,3,2,2,5,6}, --diminishing
			happiness		 = {5,3,2,1,2,4,5},
			hungerDurability = {5,1,3,4,4,6,7,8}, --diminishing returns in the beginning but quickly ramps up. More violent, more food
			thirstDurability = {0,0,0,0,2,3,4,5}, 		
		},
		intelligence = {
			violence 		 = {5, 4, 3, 4, 5, 6, 6, 7},
			intelligence 	 = {0},
			aggressiveness   = {2, 3, 3, 4},
			farming 		 = {8, 6, 4, 6, 8, 9, 9, 10},
			religiousness 	 = {2,2,2,2,2,4,6,8},
			desiretobreed 	 = {6,5,4,2,2,2,5,5,5,7,8,8,9,10},
			coldResistance   = {5,3,3,2,1,1,1,3,3,3},
			heatResistance 	 = {5,3,3,2,1,1,1,3,3,3},
			medication 		 = {10,8,4,6,7,8,9,9,9,10},
			happiness		 = {6},
			hungerDurability = {8,6,4,5,5,6,7,7,7,7,7,7,7},
			thirstDurability = {0},		
		},
		aggressiveness = {
			violence 		 = {7,6,4,3,3,3,6,7,8,9},
			intelligence 	 = {0},
			aggressiveness   = {0},
			farming 		 = {2,2,1,1,1,1,1},
			religiousness 	 = {0,0,0,0,0,1,2,4,5}, --too angry to believe in anything
			desiretobreed 	 = {3,2,2,2,4,5,6,7,8,8},
			coldResistance   = {0},
			heatResistance 	 = {0},
			medication 		 = {3,2,2,1,1,1,1,0,2,4,4},
			happiness		 = {4,3,1,1,1,1,1,3,5},
			hungerDurability = {0},
			thirstDurability = {0},		
		},
		farming = {
			violence 		 = {5,4,3,2,1,1,1,1,3,3},
			intelligence 	 = {1},
			aggressiveness   = {4,4,3,2,1,1,1,1,1,3,5,6},
			farming 		 = {0},
			religiousness 	 = {0},
			desiretobreed 	 = {3,2,1,1,1,1,3,5,6,6,7},
			coldResistance   = {0},
			heatResistance 	 = {0},
			medication 		 = {5,4,2,1,1,1,4,5,6,6,6,7},
			happiness		 = {8,7,5,3,3,3,7,8,9,9,9},
			hungerDurability = {5},
			thirstDurability = {4},		
		},
		religiousness = {
			violence 		 = {1,1,2,4,5,7,8,10,10,10},
			intelligence 	 = {0},
			aggressiveness   = {1,1,3,4,5,6,8,10,10},
			farming 		 = {0},
			religiousness 	 = {0},
			desiretobreed 	 = {1,1,1,1,1,1,2,3,3},
			coldResistance   = {0},
			heatResistance 	 = {0},
			medication 		 = {0},
			happiness		 = {0,0,0,0,0,3,5,5,6,7,7},
			hungerDurability = {0},
			thirstDurability = {0},		
		},
		desiretobreed = {
			violence 		 = {6,3,2,1,1,1,1,0},
			intelligence 	 = {1,1,1,1,1,0,0,0,0,0,0,0},
			aggressiveness   = {6,4,3,2,1,1,1,1,0,0,0},
			farming 		 = {0},
			religiousness 	 = {0},
			desiretobreed 	 = {0},
			coldResistance   = {0},
			heatResistance 	 = {0},
			medication 		 = {0},
			happiness		 = {1,1,1,1,3,4,5,7,7,8},
			hungerDurability = {0,0,0,0,0,0,1,2,2},
			thirstDurability = {0,0,0,0,0,0,1,2,2},	
		},
		coldResistance = {
			violence 		 = {3,2,1,1,1,0,0,0,0,0},
			intelligence 	 = {1,1,1,0,0,0,0,0,0,0},
			aggressiveness   = {3,2,1,1,1,0,0,0,0,0},
			farming 		 = {0},
			religiousness 	 = {0},
			desiretobreed 	 = {6,3,2,1,0,0,0,2,3,3},
			coldResistance   = {0},
			heatResistance 	 = {0,0,0,0,1,1,1,1,2,3},
			medication 		 = {0},
			happiness		 = {6,6,4,3,2,1,0,0,0},
			hungerDurability = {1,1,1,0,0,0,0,0},
			thirstDurability = {1,1,1,0,0,0,0,0},		
		},
		heatResistance = {
			violence 		 = {3,2,1,1,1,0,0,0,0,0},
			intelligence 	 = {1,1,1,0,0,0,0,0,0,0},
			aggressiveness   = {3,2,1,1,1,0,0,0,0,0},
			farming 		 = {0},
			religiousness 	 = {0},
			desiretobreed 	 = {6,3,2,1,0,0,0,2,3,3},
			coldResistance   = {0,0,0,0,1,1,1,1,2,3},
			heatResistance 	 = {0},
			medication 		 = {0},
			happiness		 = {6,6,4,3,2,1,0,0,0},
			hungerDurability = {1,1,1,0,0,0,0,0},
			thirstDurability = {1,1,1,0,0,0,0,0},			
		},
		medication = {
			violence 		 = {0},
			intelligence 	 = {1,2,2,3,3,3,3},
			aggressiveness   = {0},
			farming 		 = {0},
			religiousness 	 = {0},
			desiretobreed 	 = {0},
			coldResistance   = {0},
			heatResistance 	 = {0},
			medication 		 = {0},
			happiness		 = {3,1,1,1,3,4,5,6},
			hungerDurability = {3,1,1,1,3,4,5},
			thirstDurability = {3,1,1,1,3,4,5},		
		},
		happiness = {
			violence 		 = {5,4,2,2,2,2,2,2,2,2},
			intelligence 	 = {2,2,1,1,1,1,2,2},
			aggressiveness   = {5,4,3,2,2,1,4,5,6,6},
			farming 		 = {1},
			religiousness 	 = {1,1,1,1,1,1,2,3,3},
			desiretobreed 	 = {3,3,2,1,1,3,5,6,7,7,7},
			coldResistance   = {0},
			heatResistance 	 = {0},
			medication 		 = {1,2,2,3},
			happiness		 = {0},
			hungerDurability = {0},
			thirstDurability = {0},		
		},
		hungerDurability = {
			violence 		 = {7,6,5,4,3,3,2,1},
			intelligence 	 = {5,4,3,2,2,2,2,2},
			aggressiveness   = {8,6,4,3,2,1,1,1},
			farming 		 = {3,2,2,1,1,1,1,1},
			religiousness 	 = {0},
			desiretobreed 	 = {5,4,2,0,1,2,3,4,5},
			coldResistance   = {1},
			heatResistance 	 = {1},
			medication 		 = {6,3,1,1,1,1,2,3},
			happiness		 = {7,4,2,4,5,5,5,6},
			hungerDurability = {0},
			thirstDurability = {3,2,1,1,1,1,1,1,2},		
		},
		thirstDurability = {
			violence 		 = {4,4,4,1,1,1,2,3},
			intelligence 	 = {5,5,5,3,3,2,1},
			aggressiveness   = {5,5,3,2,4,5},
			farming 		 = {3,3,3,1,1,1,0,0},
			religiousness 	 = {0},
			desiretobreed 	 = {6,4,3,2,2,2,2,3},
			coldResistance   = {3,1,1,1,1,1,1},
			heatResistance 	 = {7,5,3,3,3,3,1,1},
			medication 		 = {7},
			happiness		 = {8},
			hungerDurability = {3,3,1,1,1,1,1,1},
			thirstDurability = {0},		
		},
	},
	affectors = { -- -1<x<1, percentage multplier of how much to multiply by the maximum change per iteration
		violence = { --the order which items in array are access is from 0 -> 2. This numbers in the arrays inside are how much that given parameter is influenced by THIS param. eg all of these are how much violence influences the parameters
			violence 		 = {0}, --zero in the multipliers, doesnt matter
			intelligence 	 = {0.5,0.25,0.1,-0.25},
			aggressiveness   = {-0.6, -0.3, -0.1, 0.1, 0.3, 0.4, 0.5, 0.6, 0.7},
			farming 		 = {0.4,0.4 -0.2, -0.25},
			religiousness 	 = {0},
			desiretobreed 	 = {-0.2, 0.6, 0.4, 0.3, -0.1, -0.3, -0.6},
			coldResistance   = {0},
			heatResistance 	 = {0},
			medication 		 = {0.6,0.5,0.4,0.3,-0.3,-0.5,-0.7,-0.7,-0.75},
			happiness		 = {0.8,0.6,0.3,0.1,0.1,0.1,-0.05, -0.1},
			hungerDurability = {-0.7, -0.05, 0.1, 0.3, 0.4, 0.4, 0.4, 0.4, 0.5, 0.6, 0.7, 0.9},
			thirstDurability = {0,0,0,0,0,-0.1,-0.2,-0.4,-0.5},		
		},
		intelligence = {
			violence 		 = {0.8, 0.6, 0.6, 0.6, 0.6, 0.3, -0.2, -0.2, -0.3, -0.1, 0.1, 0.05, -0.05},
			intelligence 	 = {0},
			aggressiveness   = {0.6, 0.3, 0.3, 0.2, 0.2, 0.2, 0.3, 0.3},
			farming 		 = {-0.6, -0.6, -0.4, -0.4, -0.3, 0, 0.1, 0.4, 0.6, 0.8, 0.8, 0.8, 0.8, 0.8, 0.9},
			religiousness 	 = {0,0,0,0.1,0.2,0.2,0.2,0.5,0.7,0.9,0.9,0.3,-0.3,-0.7,-0.9},
			desiretobreed 	 = {-0.7,-0.5,-0.3,0.1,0.1,0.1,0.4,0.6,0.6,0.7,0.9},
			coldResistance   = {-0.5, -0.3, -0.1,-0.1,0.1,0.1,0.1,0.4,0.5,0.6,0.7,0.7,0.8},
			heatResistance 	 = {-0.5, -0.3, -0.1,-0.1,0.1,0.1,0.1,0.4,0.5,0.6,0.7,0.7,0.8},
			medication 		 = {-0.95,-0.76,-0.4,-0.1,-0.1,-0.1,-0.1,0.3,0.4,0.4,0.4,0.6,0.8,0.9,0.9,0.9},
			happiness		 = {-0.8,-0.6,-0.4,-0.2,0,0.2,0.4,0.6,0.8,0.9},
			hungerDurability = {-0.7,-0.6,-0.5,-0.3,-0.3,-0.1,0.1,0.3,0.4,0.4,0.4,0.6,0.7,0.8},
			thirstDurability = {0},		
		},
		aggressiveness = {
			violence 		 = {-0.3,-0.3,-0.3,0.1,0.1,0.3,0.3,0.5,0.6,0.8,0.9},
			intelligence 	 = {0},
			aggressiveness   = {0},
			farming 		 = {0.3,0.3,0.2,0.1,0.1,0,0,0,0,0,0,0},
			religiousness 	 = {0,0,0,0,0.4,0.3,0.2,0.1,-0.3,-0.5,-0.6,-0.7,-0.8},
			desiretobreed 	 = {0.7,0.6,0.5,0.4,0.3,0.1,-0.3,-0.5,-0.5,-0.5,-0.7,-0.7},
			coldResistance   = {0},
			heatResistance 	 = {0},
			medication 		 = {0.7,0.4,0.1,0.1,-0.1,-0.1,-0.3,-0.6,-0.7,-0.7,-0.},
			happiness		 = {0.6,0.5,0.5,0.3,0.1,-0.3,-0.4,-0.6,-0.6,-0.7},
			hungerDurability = {0},
			thirstDurability = {0},		
		},
		farming = {
			violence 		 = {0.8,0.6,0.4,0,0,0,0,-0.3,-0.3},
			intelligence 	 = {-0.1,-0.05,0.05,0.1,0.1,0.1,0.15},
			aggressiveness   = {0.8,0.6,0.4,0,0,0,0,-0.3,-0.3},
			farming 		 = {0},
			religiousness 	 = {0},
			desiretobreed 	 = {-0.5,-0.4,-0.3,-0.1,0.1,0.4,0.5,0.6,0.7,0.7,0.7},
			coldResistance   = {0},
			heatResistance 	 = {0},
			medication 		 = {-0.6,-0.6,-0.3,-0.1,0.1,0.2,0.2,0.4,0.6,0.6,0.6,0.6,0.7},
			happiness		 = {-0.8,-0.3,-0.3,0.3,0.5,0.7,0.7,0.7},
			hungerDurability = {-0.5,-0.1,0.2,0.6},
			thirstDurability = {-0.2,-0.1,0.4,0.6},		
		},
		religiousness = {
			violence 		 = {0,0,0,-0.1,-0.2,-0.3,-0.5,-0.65,-0.75,-0.8},
			intelligence 	 = {0},
			aggressiveness   = {0,0,0,-0.1,-0.2,-0.3,-0.5,-0.65,-0.75,-0.8},
			farming 		 = {0},
			religiousness 	 = {0},
			desiretobreed 	 = {0.1,0.1,0.1,0.1,0.1,0.2,0.3,0.4},
			coldResistance   = {0},
			heatResistance 	 = {0},
			medication 		 = {0},
			happiness		 = {0,0,0,0,0.2,0.4,0.6,0.8,0.8},
			hungerDurability = {0},
			thirstDurability = {0},		
		},
		desiretobreed = {
			violence 		 = {0.5},
			intelligence 	 = {-0.05},
			aggressiveness   = {0.5},
			farming 		 = {0},
			religiousness 	 = {0},
			desiretobreed 	 = {0},
			coldResistance   = {0},
			heatResistance 	 = {0},
			medication 		 = {0},
			happiness		 = {-0.4,-0.4,-0.3,-0.1,0.2,0.2,0.5,0.7,0.8},
			hungerDurability = {0,0,0,0,0,0,0,-0.1,-0.25,-0.4},
			thirstDurability = {0,0,0,0,0,0,0,-0.1,-0.25,-0.4},	
		},
		coldResistance = {
			violence 		 = {-0.5,-0.2,-0.1,0,0,0,0,0,0},
			intelligence 	 = {-0.1,-0.1,0,0,0,0,0,0,0,0},
			aggressiveness   = {0.5,0.2,0.1,0,0,0,0,0,0},
			farming 		 = {0},
			religiousness 	 = {0},
			desiretobreed 	 = {0.6,0.4,0.3,0.1,0,0,0,-0.3,-0.5},
			coldResistance   = {0},
			heatResistance 	 = {0,0,0,0,0,0,-0.1,-0.1,-0.1,-0.35},
			medication 		 = {0},
			happiness		 = {-0.6,-0.6,-0.5,-0.4,-0.1,-0.1,0.2,0,0,},
			hungerDurability = {-0.3,-0.3,-0.3,0,0,0,0,0,0},
			thirstDurability = {-0.1,-0.1,-0.1,0,0,0,0,0,0},		
		},
		heatResistance = {
			violence 		 = {-0.5,-0.2,-0.1,0,0,0,0,0,0},
			intelligence 	 = {-0.1,-0.1,0,0,0,0,0,0,0,0},
			aggressiveness   = {0.5,0.2,0.1,0,0,0,0,0,0},
			farming 		 = {0},
			religiousness 	 = {0},
			desiretobreed 	 = {-0.6,-0.4,-0.3,-0.1,0,0,0,0.3,0.5},
			coldResistance   = {0,0,0,0,0,0,-0.1,-0.1,-0.1,-0.35},
			heatResistance 	 = {0},
			medication 		 = {0},
			happiness		 = {-0.6,-0.6,-0.5,-0.4,-0.1,-0.1,0.2,0,0,},
			hungerDurability = {-0.3,-0.3,-0.3,0,0,0,0,0,0},
			thirstDurability = {-0.8,-0.6,-0.4,-0.1,0,0,0,0,0},	
		},
		medication = {
			violence 		 = {0},
			intelligence 	 = {-0.2,-0.05,0.1,0.1,0.2,0.4,0.4},
			aggressiveness   = {0},
			farming 		 = {0},
			religiousness 	 = {0},
			desiretobreed 	 = {0},
			coldResistance   = {0},
			heatResistance 	 = {0},
			medication 		 = {0},
			happiness		 = {-0.6,-0.5,-0.3,-0.1,0.1,0.3,0.4,0.7,0.9},
			hungerDurability = {-0.4,-0.3,-0.1,0.1,0.1,0.1,0.1,0.2},
			thirstDurability = {-0.4,-0.3,-0.1,0.1,0.1,0.1,0.1,0.2},		
		},
		happiness = {
			violence 		 = {0.7,0.7,0.5,0.3,0.1,0.1,0,0,-0.1,-0.15},
			intelligence 	 = {-0.15,-0.1,0,0,0,0,0,0.1,0.15},
			aggressiveness   = {0.7,0.6,0.6,0.6,0.3,0,-0.1,-0.3,-0.4,-0.6},
			farming 		 = {-0.1,-0.05,0.05,0.1,0.2,0.2,0.2,0.3},
			religiousness 	 = {-0.2,-0.15,0,0,0.1,0.1,0.1,0.1,0.3,0.55},
			desiretobreed 	 = {-0.5,-0.3,-0.1,0,0,0.1,0.3,0.4,0.6,0.7,0.75},
			coldResistance   = {0},
			heatResistance 	 = {0},
			medication 		 = {-0.05,0.1,0.1,0.1},
			happiness		 = {0},
			hungerDurability = {0},
			thirstDurability = {0},		
		},
		hungerDurability = {
			violence 		 = {0.8,0.8,0.6,0.4,-0.05,-0.1,-0.3},
			intelligence 	 = {-0.5,-0.4,-0.1,0,0,0,0.2,0.25},
			aggressiveness   = {0.8,0.8,0.6,0.4,-0.05,-0.1,-0.3},
			farming 		 = {-0.1, -0.05, 0.2, 0.25, 0.25, 0.25, 0.25},
			religiousness 	 = {0},
			desiretobreed 	 = {-0.8,-0.5,-0.2,0,0.3,0.3,0.3},
			coldResistance   = {-0.12,-0.1,-0.05,0.05,0.1,0.12},
			heatResistance 	 = {-0.12,-0.1,-0.05,0.05,0.1,0.12},
			medication 		 = {-0.8, -0.6, -0.3, -0.1, 0.05, 0.15, 0.2, 0.3, 0.4},
			happiness		 = {-0.8, -0.65, -0.45, -0.2, -0.1, 0.05, 0.2, 0.35, 0.45, 0.66, 0.75},
			hungerDurability = {0},
			thirstDurability = {-0.4,-0.2,0,0,0,0,0.1,0.2,0.2},		
		},
		thirstDurability = {
			violence 		 = {-0.4,-0.3,-0.1,0.2,0.1,0.05,0,0},
			intelligence 	 = {-0.5,-0.3,-0.1,0,0,0,0.1,0.1},
			aggressiveness   = {0.8,0.6,0.6,0.4,0.1,0.1,0.1,-0.15},
			farming 		 = {-0.1,-0.1,-0.1,0.2},
			religiousness 	 = {0},
			desiretobreed 	 = {-0.8,-0.6,-0.4,-0.1,0.2,0.3,0.5,0.5,0.5},
			coldResistance   = {-0.2,-0.2,-0.1,-0.1,-0.1,0,0,0,0.1},
			heatResistance 	 = {-0.9,-0.8,-0.7,-0.6,-0.4,-0.2,-0.15,-0.1,0,0,0},
			medication 		 = {-0.4,-0.1,0,0,0,0.1,0.4},
			happiness		 = {-0.5,-0.4,-0.1,0.2,0.4,0.5},
			hungerDurability = {-0.3,-0.1,-0.1,-0.5,-0.5,0,0,0},
			thirstDurability = {0},		
		},
	},
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

function simulation:updateDebugInfo()
	local things = {
		["Focused Clan"] = self.focusedClan,
		["Paused"] = tostring(self.paused),
	}
	local text = ""
	
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
		if k ~= "clanName" then --handled seperately
			if v.box.storedData == "" and v.numberOnly then --if a parameter has not been filled in 
				v.box.storedData = self.defaultValue
			end
			tableOfValues[k] = tonumber(v.box.storedData) 
		end
	end
	
	if scope.clanName.box.storedData == "" then
		scope.clanName.box.storedData = "Default_"..math.random(1000,9999) --random so no overwriting occurs
	end
	
	name = scope.clanName.box.storedData 
	--any further parsing or data addition needed is done here, etc population should be rounded to an integer.
	
	self.clans[name] = tableOfValues --creates the clan
	self.focusedClan = name
	
	self:clanButtonInitialisation(name)
	
	
	self:saveClans()
end

function simulation:clanButtonInitialisation(name, clan_data)
	local defaultTable = {
		["type"] = "circle",
		radius = self.buttonDefaultRadius,
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
		local scope = graphics.data.maingameScreen.textBoxs
		local currentClan = self.clans[self.focusedClan]

		for k,v in pairs(scope) do
			v.box.storedData = currentClan[k]
		end
		scope.clanName.box.storedData = self.focusedClan
	end
end

function simulation:updateClanData()
	if self.focusedClan ~= "" then
		local scope = graphics.data.maingameScreen.textBoxs
		local tableOfValues = {}
		
		for k,v in pairs(scope) do
			if k ~= "clanName" then --handled seperately
				if v.box.storedData == "" and v.numberOnly then --if a parameter has not been filled in 
					v.box.storedData = self.defaultValue
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
	saveTimer = self.saveDelay
	self:loadSavedClans()
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
	
	if graphics.currentPane == "maingameScreen" then
		if saveTimer == 0 then
			saveTimer = self.saveDelay
			self:saveClans()
		end
	end
	
	self:updateDebugInfo()
end

function simulation:render()

end

function simulation:uninit()

end
