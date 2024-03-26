graphics = {
	
	screenDimensions = {}, --empty by default
	data = {
		mainmenu = { --pane name
			backgroundColour = {10, 120, 209},
			biomeData = {
				enabled = true,
				position = {0, 0},
				dimensions = {1,1},
			},
			buttons = {
				pressStart = {
					["type"] = "rectangle",
					dimensions = {.15,.15},
					length = 0.15,
					radius = 0.1,
					position = {0.05,0.325},
					idle_colour = {120,120,120,180},
					hover_colour = {200,200,200,180},
					pressed_colour = {100,100,100,180},
					zLayer = 1,
					label = "Start Game",
					labelPos = {0, 0.5},
					labelColour = {255,255,255,255},
					newX = 0.5,
					newY = 0.5,
					textAlign = "center",
					positionMode = "default", --center or default
					func = function()
						graphics.currentPane = "maingameScreen"
					end,
				},
				options = {
					["type"] = "rectangle",
					dimensions = {.15,.15},
					length = 0.15,
					radius = 0.1,
					position = {0.05,0.525},
					idle_colour = {120,120,120,180},
					hover_colour = {200,200,200,180},
					pressed_colour = {100,100,100,180},
					zLayer = 1,
					label = "Options",
					labelPos = {0, 0.5},
					labelColour = {255,255,255,255},
					newX = 0.5,
					newY = 0.5,
					textAlign = "center",
					positionMode = "default", --center or default
					func = function()
						graphics.currentPane = "options"
					end,
				},
				quitGame = {
					["type"] = "rectangle",
					dimensions = {.15,.15},
					length = 0.15,
					radius = 0.1,
					position = {0.05,0.725},
					idle_colour = {120,120,120,180},
					hover_colour = {200,200,200,180},
					pressed_colour = {100,100,100,180},
					zLayer = 1,
					label = "Quit Game",
					labelPos = {0, 0.5},
					labelColour = {255,255,255,255},
					newX = 0.5,
					newY = 0.5,
					textAlign = "center",
					positionMode = "default", --center or default
					func = function()
						love.window.close()
					end,
				},
			},
			textBoxs = {
				--[[testBox = {
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
				},]]--
			},
			screenDecoration = {
				titleCard = {
					["type"] = "rectangle",
					dimensions = {0.2, 0.15},
					position = {0.15,0.125},
					colour = {120,120,120,180},
					zLayer = 2,
					label = "Primordial Civilisation",
					labelPos = {0, 0.5},
					labelColour = {255,255,255,255},
					textAlign = "center",
					positionMode = "center", --center or default
				},
				--[[description = {
					["type"] = "rectangle",
					dimensions = {0.2, 0.7},
					position = {0.75,0.15},
					colour = {120,120,120,180},
					zLayer = 2,
					label = "Primordial Civilisation is a simulation video game about survival. You will define different clans, and give them some initial characteristics, such as their farming capabilities, violence, and more. From there, the simulation will take into account these factors and their environment based on their position in the map, and make logical decisions. These decisions will then accurately and realistically update each individual civilisation's stats and characteristics. Experiment, analyse, and keep them alive!",
					labelPos = {0, 0.5},
					labelColour = {255,255,255,255},
					textAlign = "justify",
					positionMode = "default", --center or default
				},]]--
			},
		},
		maingameScreen = { --pane name
			backgroundColour = {0, 90, 179},
			biomeData = {
				enabled = true,
				position = {0.5, 0},
				dimensions = {0.5, 1},
			},
			buttons = {
				quitGame = {
					["type"] = "rectangle",
					dimensions = {.10,.10},
					length = 0.15,
					radius = 0.1,
					position = {0.025,0.025},
					idle_colour = {120,120,120,255},
					hover_colour = {200,200,200,255},
					pressed_colour = {100,100,100,255},
					zLayer = 1,
					label = "Return To Menu",
					labelPos = {0, 0.5},
					labelColour = {255,255,255,255},
					newX = 0.5,
					newY = 0.5,
					textAlign = "center",
					positionMode = "default", --center or default
					func = function()
						graphics.currentPane = "mainmenu"
					end,
				},
				options = {
					["type"] = "rectangle",
					dimensions = {.10,.10},
					length = 0.15,
					radius = 0.1,
					position = {0.025,0.15},
					idle_colour = {120,120,120,255},
					hover_colour = {200,200,200,255},
					pressed_colour = {100,100,100,255},
					zLayer = 1,
					label = "Options",
					labelPos = {0, 0.5},
					labelColour = {255,255,255,255},
					newX = 0.5,
					newY = 0.5,
					textAlign = "center",
					positionMode = "default", --center or default
					func = function()
						graphics.currentPane = "options"
					end,
				},
				islandRandomise = {
					["type"] = "rectangle",
					dimensions = {.10,.10},
					length = 0.15,
					radius = 0.1,
					position = {0.025,0.275},
					idle_colour = {120,120,120,255},
					hover_colour = {200,200,200,255},
					pressed_colour = {100,100,100,255},
					zLayer = 1,
					label = "Regenerate Island",
					labelPos = {0, 0.5},
					labelColour = {255,255,255,255},
					newX = 0.5,
					newY = 0.5,
					textAlign = "center",
					positionMode = "default", --center or default
					func = function()
						graphics:generateIslandData()
					end,
				},
				manualSave = {
					["type"] = "rectangle",
					dimensions = {.10,.10},
					length = 0.15,
					radius = 0.1,
					position = {0.025,0.4},
					idle_colour = {120,120,120,255},
					hover_colour = {200,200,200,255},
					pressed_colour = {100,100,100,255},
					zLayer = 1,
					label = "Manual Save",
					labelPos = {0, 0.5},
					labelColour = {255,255,255,255},
					newX = 0.5,
					newY = 0.5,
					textAlign = "center",
					positionMode = "default", --center or default
					func = function()
						simulation:saveClans()
					end,
				},
				createClanData = {
					["type"] = "rectangle",
					dimensions = {.10,.10},
					length = 0.15,
					radius = 0.1,
					position = {0.025,0.525},
					idle_colour = {120,120,120,255},
					hover_colour = {200,200,200,255},
					pressed_colour = {100,100,100,255},
					zLayer = 1,
					label = "Create New Clan",
					labelPos = {0, 0.5},
					labelColour = {255,255,255,255},
					newX = 0.5,
					newY = 0.5,
					textAlign = "center",
					positionMode = "default", --center or default
					func = function()
						if simulation.paused then
							simulation:initialiseClan()
						end
						--creates a new clan with the listed parameters and name
					end,
				},
				updateClanData = {
					["type"] = "rectangle",
					dimensions = {.10,.10},
					length = 0.15,
					radius = 0.1,
					position = {0.025,0.65},
					idle_colour = {120,120,120,255},
					hover_colour = {200,200,200,255},
					pressed_colour = {100,100,100,255},
					zLayer = 1,
					label = "Update Clan Data",
					labelPos = {0, 0.5},
					labelColour = {255,255,255,255},
					newX = 0.5,
					newY = 0.5,
					textAlign = "center",
					positionMode = "default", --center or default
					func = function()
						simulation:updateClanData()
						--updates the currently selected clan with the data in the text boxes, if one is selected
					end,
				},
				deleteClan = {
					["type"] = "rectangle",
					dimensions = {.10,.10},
					length = 0.15,
					radius = 0.1,
					position = {0.025,0.775},
					idle_colour = {120,120,120,255},
					hover_colour = {200,200,200,255},
					pressed_colour = {100,100,100,255},
					zLayer = 1,
					label = "Delete Clan",
					labelPos = {0, 0.5},
					labelColour = {255,255,255,255},
					newX = 0.5,
					newY = 0.5,
					textAlign = "center",
					positionMode = "default", --center or default
					func = function()
						simulation:deleteClan()
						--Deletes selected clan
					end,
				},
				pause = {
					["type"] = "rectangle",
					dimensions = {.15,.125},
					length = 0.15,
					radius = 0.1,
					position = {0.5 - 0.15 - 0.01,0.7},
					idle_colour = {120,120,120,255},
					hover_colour = {200,200,200,255},
					pressed_colour = {100,100,100,255},
					zLayer = 1,
					label = "Pause",
					labelPos = {0, 0.5},
					labelColour = {255,255,255,255},
					newX = 0.5,
					newY = 0.5,
					textAlign = "center",
					positionMode = "default", --center or default
					func = function()
						--pauses simulation
						simulation.paused = true
					end,
				},
				play = {
					["type"] = "rectangle",
					dimensions = {.15,.125},
					length = 0.15,
					radius = 0.1,
					position = {0.165,0.7},
					idle_colour = {120,120,120,255},
					hover_colour = {200,200,200,255},
					pressed_colour = {100,100,100,255},
					zLayer = 1,
					label = "Play",
					labelPos = {0, 0.5},
					labelColour = {255,255,255,255},
					newX = 0.5,
					newY = 0.5,
					textAlign = "center",
					positionMode = "default", --center or default
					func = function()
						--continues simulation
						simulation.paused = false
					end,
				},
				yearSkip = {
					["type"] = "rectangle",
					dimensions = {.15,.125},
					length = 0.15,
					radius = 0.1,
					position = {0.5 - 0.15 - 0.01,0.85},
					idle_colour = {120,120,120,255},
					hover_colour = {200,200,200,255},
					pressed_colour = {100,100,100,255},
					zLayer = 1,
					label = "Jump Year - Laggy",
					labelPos = {0, 0.5},
					labelColour = {255,255,255,255},
					newX = 0.5,
					newY = 0.5,
					textAlign = "center",
					positionMode = "default", --center or default
					func = function()
						if not simulation.paused then
							for x = 1, 52 do
								simulation:naturalParamFluctuation()
							end
						end
					end,
				},
				decadeSkip = {
					["type"] = "rectangle",
					dimensions = {.15,.125},
					length = 0.15,
					radius = 0.1,
					position = {0.165,0.85},
					idle_colour = {120,120,120,255},
					hover_colour = {200,200,200,255},
					pressed_colour = {100,100,100,255},
					zLayer = 1,
					label = "Jump Decade - Very Laggy",
					labelPos = {0, 0.5},
					labelColour = {255,255,255,255},
					newX = 0.5,
					newY = 0.5,
					textAlign = "center",
					positionMode = "default", --center or default
					func = function()
						if not simulation.paused then
							for x = 1, 520 do
								simulation:naturalParamFluctuation()
							end
						end
					end,
				},
			},
			textBoxs = {
				clanName = { --the names of these are VERY IMPORTANT. these are used later on
					numberOnly = false,
					outline = { --the width of the region is 0.35
						colour = {120,120,120, 255},
						dimensions = {0.15, 0.05},
						position = {0.165, 0.15},
						zLayer = 1,
						positionMode = "left",
						label = "Name",
					},
					box = {
						colour = {200,200,200, 255},
						pressedColour = {230,230,230, 255},
						hoverColour = {170,170,170,255},
						dimensions = {0.5, 0.8},
						position = {0.45, 0.1},
						storedData = "",
						labelColour = {0,0,0,255},
					},
				},
				clanPopulation = {
					numberOnly = true,
					outline = {
						colour = {120,120,120, 255},
						dimensions = {0.15, 0.05},
						position = {0.3375, 0.15},
						zLayer = 1,
						positionMode = "left",
						label = "Population",
					},
					box = {
						colour = {200,200,200, 255},
						pressedColour = {230,230,230, 255},
						hoverColour = {170,170,170,255},
						dimensions = {0.5, 0.8},
						position = {0.45, 0.1},
						storedData = "",
						labelColour = {0,0,0,255},
					},
				},
				violence = { --the names of these are VERY IMPORTANT. these are used later on
					numberOnly = true,
					outline = { --the width of the region is 0.35
						colour = {120,120,120, 255},
						dimensions = {0.15, 0.05},
						position = {0.165, 0.225},
						zLayer = 1,
						positionMode = "left",
						label = "Violence",
					},
					box = {
						colour = {200,200,200, 255},
						pressedColour = {230,230,230, 255},
						hoverColour = {170,170,170,255},
						dimensions = {0.5, 0.8},
						position = {0.45, 0.1},
						storedData = "",
						labelColour = {0,0,0,255},
					},
				},
				intelligence = {
					numberOnly = true,
					outline = {
						colour = {120,120,120, 255},
						dimensions = {0.15, 0.05},
						position = {0.3375, 0.225},
						zLayer = 1,
						positionMode = "left",
						label = "Intelligence",
					},
					box = {
						colour = {200,200,200, 255},
						pressedColour = {230,230,230, 255},
						hoverColour = {170,170,170,255},
						dimensions = {0.5, 0.8},
						position = {0.45, 0.1},
						storedData = "",
						labelColour = {0,0,0,255},
					},
				},
				aggressiveness = { --the names of these are VERY IMPORTANT. these are used later on
					numberOnly = true,
					outline = { --the width of the region is 0.35
						colour = {120,120,120, 255},
						dimensions = {0.15, 0.05},
						position = {0.165, 0.3},
						zLayer = 1,
						positionMode = "left",
						label = "Aggressiveness",
					},
					box = {
						colour = {200,200,200, 255},
						pressedColour = {230,230,230, 255},
						hoverColour = {170,170,170,255},
						dimensions = {0.5, 0.8},
						position = {0.45, 0.1},
						storedData = "",
						labelColour = {0,0,0,255},
					},
				},
				farming = {
					numberOnly = true,
					outline = {
						colour = {120,120,120, 255},
						dimensions = {0.15, 0.05},
						position = {0.3375, 0.3},
						zLayer = 1,
						positionMode = "left",
						label = "Farming",
					},
					box = {
						colour = {200,200,200, 255},
						pressedColour = {230,230,230, 255},
						hoverColour = {170,170,170,255},
						dimensions = {0.5, 0.8},
						position = {0.45, 0.1},
						storedData = "",
						labelColour = {0,0,0,255},
					},
				},
				religiousness = { --the names of these are VERY IMPORTANT. these are used later on
					numberOnly = true,
					outline = { --the width of the region is 0.35
						colour = {120,120,120, 255},
						dimensions = {0.15, 0.05},
						position = {0.165, 0.375},
						zLayer = 1,
						positionMode = "left",
						label = "Religiousness",
					},
					box = {
						colour = {200,200,200, 255},
						pressedColour = {230,230,230, 255},
						hoverColour = {170,170,170,255},
						dimensions = {0.5, 0.8},
						position = {0.45, 0.1},
						storedData = "",
						labelColour = {0,0,0,255},
					},
				},
				desiretobreed = {
					numberOnly = true,
					outline = {
						colour = {120,120,120, 255},
						dimensions = {0.15, 0.05},
						position = {0.3375, 0.375},
						zLayer = 1,
						positionMode = "left",
						label = "Desire-to-Breed",
					},
					box = {
						colour = {200,200,200, 255},
						pressedColour = {230,230,230, 255},
						hoverColour = {170,170,170,255},
						dimensions = {0.5, 0.8},
						position = {0.45, 0.1},
						storedData = "",
						labelColour = {0,0,0,255},
					},
				},
				coldResistance = { --the names of these are VERY IMPORTANT. these are used later on
					numberOnly = true,
					outline = { --the width of the region is 0.35
						colour = {120,120,120, 255},
						dimensions = {0.15, 0.05},
						position = {0.165, 0.45},
						zLayer = 1,
						positionMode = "left",
						label = "Cold Resistance",
					},
					box = {
						colour = {200,200,200, 255},
						pressedColour = {230,230,230, 255},
						hoverColour = {170,170,170,255},
						dimensions = {0.5, 0.8},
						position = {0.45, 0.1},
						storedData = "",
						labelColour = {0,0,0,255},
					},
				},
				heatResistance = {
					numberOnly = true,
					outline = {
						colour = {120,120,120, 255},
						dimensions = {0.15, 0.05},
						position = {0.3375, 0.45},
						zLayer = 1,
						positionMode = "left",
						label = "Heat Resistance",
					},
					box = {
						colour = {200,200,200, 255},
						pressedColour = {230,230,230, 255},
						hoverColour = {170,170,170,255},
						dimensions = {0.5, 0.8},
						position = {0.45, 0.1},
						storedData = "",
						labelColour = {0,0,0,255},
					},
				},
				medication = {
					numberOnly = true,
					outline = {
						colour = {120,120,120, 255},
						dimensions = {0.15, 0.05},
						position = {0.3375, 0.525},
						zLayer = 1,
						positionMode = "left",
						label = "Medication",
					},
					box = {
						colour = {200,200,200, 255},
						pressedColour = {230,230,230, 255},
						hoverColour = {170,170,170,255},
						dimensions = {0.5, 0.8},
						position = {0.45, 0.1},
						storedData = "",
						labelColour = {0,0,0,255},
					},
				},
				happiness = { --the names of these are VERY IMPORTANT. these are used later on
					numberOnly = true,
					outline = { --the width of the region is 0.35
						colour = {120,120,120, 255},
						dimensions = {0.15, 0.05},
						position = {0.165, 0.525},
						zLayer = 1,
						positionMode = "left",
						label = "Happiness",
					},
					box = {
						colour = {200,200,200, 255},
						pressedColour = {230,230,230, 255},
						hoverColour = {170,170,170,255},
						dimensions = {0.5, 0.8},
						position = {0.45, 0.1},
						storedData = "",
						labelColour = {0,0,0,255},
					},
				},
				hungerDurability = {
					numberOnly = true,
					outline = {
						colour = {120,120,120, 255},
						dimensions = {0.15, 0.05},
						position = {0.3375, 0.6},
						zLayer = 1,
						positionMode = "left",
						label = "Hunger Durability",
					},
					box = {
						colour = {200,200,200, 255},
						pressedColour = {230,230,230, 255},
						hoverColour = {170,170,170,255},
						dimensions = {0.5, 0.8},
						position = {0.45, 0.1},
						storedData = "",
						labelColour = {0,0,0,255},
					},
				},
				thirstDurability = {
					numberOnly = true,
					outline = {
						colour = {120,120,120, 255},
						dimensions = {0.15, 0.05},
						position = {0.165, 0.6},
						zLayer = 1,
						positionMode = "left",
						label = "Thirst Durability",
					},
					box = {
						colour = {200,200,200, 255},
						pressedColour = {230,230,230, 255},
						hoverColour = {170,170,170,255},
						dimensions = {0.5, 0.8},
						position = {0.45, 0.1},
						storedData = "",
						labelColour = {0,0,0,255},
					},
				},
			},
			screenDecoration = {
				buttonsRegion = {
					["type"] = "rectangle",
					dimensions = {0.15, 1},
					position = {0,0},
					colour = {0,0,0,100},
					zLayer = 2,
					label = "",
					labelPos = {0, 0.5},
					labelColour = {255,255,255,255},
					textAlign = "justify",
					positionMode = "default", --center or default
				},
				textBoxsRegion = {
					["type"] = "rectangle",
					dimensions = {0.35, 0.1},
					position = {0.15,0},
					colour = {0,0,0,50},
					zLayer = 2,
					label = "Fill in the details for the clans here. Use the buttons to the left accordingly.",
					labelPos = {0, 0.45},
					labelColour = {255,255,255,255},
					textAlign = "center",
					positionMode = "default", --center or default
				},
				textBoxsRegionTitle = {
					["type"] = "rectangle",
					dimensions = {0.35, 1},
					position = {0.15,0},
					colour = {0,0,0,25},
					zLayer = 4,
					label = "",
					labelPos = {0, 0.5},
					labelColour = {255,255,255,255},
					textAlign = "justify",
					positionMode = "default", --center or default
				},
				leftscreenSeperator = {
					["type"] = "rectangle",
					dimensions = {0.005, 1},
					position = {0.1495,0},
					colour = {0,0,0,200},
					zLayer = 4,
					label = "",
					labelPos = {0, 0.5},
					labelColour = {255,255,255,255},
					textAlign = "justify",
					positionMode = "default", --center or default
				},
				midscreenSeperator = {
					["type"] = "rectangle",
					dimensions = {0.005, 1},
					position = {0.4995,0},
					colour = {0,0,0,200},
					zLayer = 3,
					label = "",
					labelPos = {0, 0.5},
					labelColour = {255,255,255,255},
					textAlign = "justify",
					positionMode = "default", --center or default
				},
				debugScreen = {
					["type"] = "rectangle",
					dimensions = {0.1, 0.2},
					position = {0.5025,0.01},
					colour = {150,150,150,0},
					zLayer = 3,
					label = "",
					labelPos = {0.05, 0.05},
					labelColour = {0,0,0,255},
					textAlign = "left",
					positionMode = "default", --center or default
				},
				bothorizontalSeperator = {
					["type"] = "rectangle",
					dimensions = {0.35, 0.01},
					position = {0.15,0.675},
					colour = {0,0,0,200},
					zLayer = 3,
					label = "",
					labelPos = {0, 0.5},
					labelColour = {255,255,255,255},
					textAlign = "justify",
					positionMode = "default", --center or default
				},
				tophorizontalSeperator = {
					["type"] = "rectangle",
					dimensions = {0.35, 0.01},
					position = {0.15,0.1},
					colour = {0,0,0,200},
					zLayer = 3,
					label = "",
					labelPos = {0, 0.5},
					labelColour = {255,255,255,255},
					textAlign = "justify",
					positionMode = "default", --center or default
				},
			},
		},
		options = {
			backgroundColour = {88,88,88,255},
			biomeData = {
				enabled = false,
				position = {0, 0},
				dimensions = {0, 0},
			},
			buttons = {
				returnButton = {
					["type"] = "rectangle",
					dimensions = {.25,.2},
					position = {0.05,0.4},
					idle_colour = {150,150,150,230},
					hover_colour = {220,220,220,180},
					pressed_colour = {100,100,100,180},
					zLayer = 1,
					label = "Return",
					labelPos = {0, 0.5},
					labelColour = {255,255,255,255},
					newX = 0.5,
					newY = 0.5,
					textAlign = "center",
					positionMode = "default", --center or default
					func = function()
						graphics.currentPane = "mainmenu"
					end,
				},
				quitButton = {
					["type"] = "rectangle",
					dimensions = {.25,.2},
					position = {0.05,0.65},
					idle_colour = {150,150,150,230},
					hover_colour = {220,220,220,180},
					pressed_colour = {100,100,100,180},
					zLayer = 1,
					label = "Quit Game",
					labelPos = {0, 0.5},
					labelColour = {255,255,255,255},
					newX = 0.5,
					newY = 0.5,
					textAlign = "center",
					positionMode = "default", --center or default
					func = function()
						love.window.close()
					end,
				},
				toggleFullscreen = {
					["type"] = "rectangle",
					dimensions = {.25,.2},
					position = {0.375,0.4},
					idle_colour = {150,150,150,230},
					hover_colour = {220,220,220,180},
					pressed_colour = {100,100,100,180},
					zLayer = 1,
					label = "Toggle Fullscreen",
					labelPos = {0, 0.5},
					labelColour = {255,255,255,255},
					newX = 0.5,
					newY = 0.5,
					textAlign = "center",
					positionMode = "default", --center or default
					func = function()
						love.window.setFullscreen(not love.window.getFullscreen())
					end,
				},
				toggleVsync = {
					["type"] = "rectangle",
					dimensions = {.25,.2},
					position = {0.375,0.65},
					idle_colour = {150,150,150,230},
					hover_colour = {220,220,220,180},
					pressed_colour = {100,100,100,180},
					zLayer = 1,
					label = "Toggle V-Sync",
					labelPos = {0, 0.5},
					labelColour = {255,255,255,255},
					newX = 0.5,
					newY = 0.5,
					textAlign = "center",
					positionMode = "default", --center or default
					func = function()
						love.window.setVSync(not love.window.getVSync())
					end,
				},
				deleteSave = {
					["type"] = "rectangle",
					dimensions = {.25,.2},
					position = {0.7,0.4},
					idle_colour = {150,150,150,230},
					hover_colour = {220,220,220,180},
					pressed_colour = {100,100,100,180},
					zLayer = 1,
					label = "Delete Current Save",
					labelPos = {0, 0.5},
					labelColour = {255,255,255,255},
					newX = 0.5,
					newY = 0.5,
					textAlign = "center",
					positionMode = "default", --center or default
					func = function()
						--nothing right now
						local files = love.filesystem.getDirectoryItems("")
						for k,v in ipairs(files) do 
							if v ~= "multipliers.sfl" and v ~= "affectors.sfl" and v ~= "biomeMultipliers.sfl" and v ~= "numericalFigures.sfl" then
								love.filesystem.remove(v)
							end
						end
						simulation:deleteAllClans() 
					end,
				},
				clearDirectory = {
					["type"] = "rectangle",
					dimensions = {.25,.2},
					position = {0.7,0.65},
					idle_colour = {150,150,150,230},
					hover_colour = {220,220,220,180},
					pressed_colour = {100,100,100,180},
					zLayer = 1,
					label = "Clear File Directory",
					labelPos = {0, 0.5},
					labelColour = {255,255,255,255},
					newX = 0.5,
					newY = 0.5,
					textAlign = "center",
					positionMode = "default", --center or default
					func = function()
						--nothing right now
						local files = love.filesystem.getDirectoryItems("")
						for k,v in ipairs(files) do 
							love.filesystem.remove(v)
						end
						simulation:deleteAllClans()
					end,
				},
			},
			textBoxs = {},
			screenDecoration = {
				titleCard = {
					["type"] = "rectangle",
					dimensions = {0.2, 0.15},
					position = {0.15,0.125},
					colour = {120,120,120,180},
					zLayer = 3,
					label = "Options",
					labelPos = {0, 0.5},
					labelColour = {255,255,255,255},
					textAlign = "center",
					positionMode = "center", --center or default
				},
				leftMenu = {
					["type"] = "rectangle",
					dimensions = {0.3, 0.65},
					position = {0.025,0.25},
					colour = {93, 168, 67, 180},
					zLayer = 2,
					label = "Menu Controls",
					labelPos = {0, 0.1},
					labelColour = {255,255,255,255},
					textAlign = "center",
					positionMode = "default", --center or default
				},
				middleMenu = {
					["type"] = "rectangle",
					dimensions = {0.3, 0.65},
					position = {0.35,0.25},
					colour = {26, 69, 22, 180},
					zLayer = 2,
					label = "Window Controls",
					labelPos = {0, 0.1},
					labelColour = {255,255,255,255},
					textAlign = "center",
					positionMode = "default", --center or default
				},
				rightMenu = {
					["type"] = "rectangle",
					dimensions = {0.3, 0.65},
					position = {0.675,0.25},
					colour = {59,128,40,180},
					zLayer = 2,
					label = "Save Controls",
					labelPos = {0, 0.1},
					labelColour = {255,255,255,255},
					textAlign = "center",
					positionMode = "default", --center or default
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
	currentPane = "mainmenu",
	textboxHasFocus = false,
	pressFailsafe = false,
	
	defaultBiomeData = {--this will contain the basics of how much each biome should take up on the screen
		{
			name = "grassLand",
			colour = {93, 168, 67, 255},
			size = 0.8, --proportions
		},
		{
			name = "forest",
			colour = {26, 69, 22, 255},
			size = 0.6, 
		},
		{
			name = "mountains",
			colour = {143, 142, 139, 255},
			size = 0.35, 
		},
		{
			name = "desert",
			colour = {230, 172, 0, 255},
			size = 0.2, 
		},
		{
			name = "snow",
			colour = {232, 232, 232, 255},
			size = 0.15, 
		},
		{
			name = "ocean",
			colour = {10, 120, 209,0},
			size = 0, -- this is so that the program can know to fill the rest of the space in with water
		}
	},

}
local firstTick = true -- allows an "Init" section of each

function graphics:init()
	
	--the random function is generating the same values upon every run.
	math.randomseed(os.clock())
	--this will change that
	
	love.mouse.setVisible(false) --hide the default system cursor
	self.screenDimensions[1], self.screenDimensions[2] = love.graphics.getDimensions()
	
	self.font = love.graphics.getFont()
	
	self:generateIslandData()
end

function graphics:generateIslandData()
	local biomeRegionData = self.data[self.currentPane].biomeData
	local biomeGraphicsData = self.defaultBiomeData
	local startPos = {biomeRegionData.position[1],biomeRegionData.position[2]}--{biomeRegionData.position[1]*self.screenDimensions[1],biomeRegionData.position[2]*self.screenDimensions[2]}
	local dimensions = {biomeRegionData.dimensions[1],biomeRegionData.dimensions[2]}--{biomeRegionData.dimensions[1]*self.screenDimensions[1],biomeRegionData.dimensions[2]*self.screenDimensions[2]}
	local topCorner = {startPos[1]+dimensions[1], startPos[2]+dimensions[2]}
	--these are now proportions of the screen. all subseuqent proportions shoudl be proportions of these values
	
	for k,v in ipairs(biomeGraphicsData) do 
		local radius = v.size * dimensions[2] / 2
		
		if k == 1 then --if its the biggest
			v.radius = radius
			v.position = {startPos[1] + 0.5*dimensions[1],startPos[2] + 0.5*dimensions[2]}
		elseif k ~= #biomeGraphicsData then
			--calcualte the range of avaialble positions so that it doesnt exceed the borders
			local mins = {v.size*dimensions[2]/2,v.size*dimensions[2]/2} -- it cannot be any less than this value in the x or y in pixels
			local maxs = {topCorner[1] - v.size*dimensions[2]/2, topCorner[2] - v.size*dimensions[2]/2}
			
			local randomBiome = biomeGraphicsData[math.random(1, k-1)] -- chooses a random biome that has already been rendered to base its position off
			local centeredPos = randomBiome.position
			--this will now calculate, based on the position of the centeredPos, how far away the new item can be rendered.
			local maxXDist = math.min(math.min( (centeredPos[1]-mins[1]), (maxs[1]-centeredPos[1]) ), randomBiome.radius + (radius/2)) -- this gets the largest horizontal distance available given the constraints
			local maxYDist = math.min(math.min( (centeredPos[2]-mins[2]), (maxs[2]-centeredPos[2]) ), randomBiome.radius + (radius/2)) -- the largest vertical distance available
			local maxValue = math.min(maxXDist, maxYDist) 
			
			local hyp = maxValue*math.random() -- a random distance from the center of the new biome
			local angle = math.random(0, 360) -- any random angle, the position is then calculated using the polar identities or rcostheta, and rsintheta
			local relative_position = {hyp*math.cos(math.rad(angle)), hyp*math.sin(math.rad(angle))}
			
			v.radius = radius
			v.position = {centeredPos[1] + relative_position[1],centeredPos[2] + relative_position[2]}			
		end
	end
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
			if mod < (v.radius*self.screenDimensions[1]) then
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

function graphics:islandRender()
	--first the region which the island should take up needs to be determined and filled in
	local biomeRegionData = self.data[self.currentPane].biomeData
	local biomeGraphicsData = self.defaultBiomeData
	local startPos = {biomeRegionData.position[1]*self.screenDimensions[1],biomeRegionData.position[2]*self.screenDimensions[2]}
	local dimensions = {biomeRegionData.dimensions[1]*self.screenDimensions[1],biomeRegionData.dimensions[2]*self.screenDimensions[2]}
	local topCorner = {startPos[1]+dimensions[1], startPos[2]+dimensions[2]}
	
	love.graphics.setColor(biomeGraphicsData[#biomeGraphicsData].colour[1]/255,biomeGraphicsData[#biomeGraphicsData].colour[2]/255,biomeGraphicsData[#biomeGraphicsData].colour[3]/255,biomeGraphicsData[#biomeGraphicsData].colour[4]/255)
	love.graphics.rectangle("fill", startPos[1], startPos[2], dimensions[1], dimensions[2])
	--The code above renders the ocean portion of the island
	local centerPos = {startPos[1]+dimensions[1]/2,startPos[2]+dimensions[2]/2}
	local distanceFromCenterPos = {centerPos[1] - biomeGraphicsData[1].position[1]*self.screenDimensions[2],centerPos[2] - biomeGraphicsData[1].position[2]*self.screenDimensions[2]}
	--island requirements:
	--must not verticall or horizontally exceed the boundary,
	--biggest first, then on top of each other. Do this by saying the center of the new biome cannot be ( biggestRadius - (currentRadius/2) ) away from the center
	--Alternatively, have the "BiggestRadius" be replaced instead with a randomly set or pre-determined radius
	
	--the table will be altered to be loopable through via ipairs. this means that it gets looped through in a set order. and will by default be in order
	for k,v in ipairs(biomeGraphicsData) do 
	
		if k ~= #biomeGraphicsData then
			love.graphics.setColor(v.colour[1]/255, v.colour[2]/255, v.colour[3]/255, v.colour[4]/255)
			love.graphics.circle("fill", 
				distanceFromCenterPos[1] + v.position[1]*self.screenDimensions[2],
				distanceFromCenterPos[2] + v.position[2]*self.screenDimensions[2],
			v.radius*self.screenDimensions[2])
			
			biomeGraphicsData[k].pixelData = {
				position = {distanceFromCenterPos[1] + v.position[1]*self.screenDimensions[2], distanceFromCenterPos[2] + v.position[2]*self.screenDimensions[2]},
				radius = v.radius*self.screenDimensions[2]
			}
		end
	end
end

function graphics:render()
	local colour = self.data[self.currentPane].backgroundColour
	love.graphics.setBackgroundColor(colour[1]/255, colour[2]/255, colour[3]/255)
	--made a local reference to prevent a long-line cluster
	--divided by 255 as this expects inputs between 0 and 1

	self:createBounds() --boundaries for buttons/text boxes
	
	self:screenDecorationRender()

	if self.data[self.currentPane].biomeData.enabled then
		self:islandRender()
	end
	
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
		local numberOnly = self.data[self.currentPane].textBoxs[self.textboxHasFocus].numberOnly or false
		local scope = self.data[self.currentPane].textBoxs[self.textboxHasFocus].box --so i dont have to rewrite this bajillions of times excluding when actually changing data
		local data = tostring(scope.storedData)
		local width = self.font:getWidth(data.."M") --concatenated an additional character because we need to see if ading a character will overfow the textwrap
		--i also used a wide character because id rather it under fills than over fills the box
		 
		--may be better for sustainability to have a blacklist of scancodes and loop through, potentially investigate
		if numberOnly then
			if scancode == "backspace" then 
				scope.storedData = data:sub(1,data:len()-1)
			end
			
			local allowedChars = "1234567890."
			
			if data:find(".", 1, true) then
				allowedChars = "1234567890"
			end
			if allowedChars:find(scancode, 1, true) then --if the character that is being added is in the allowed chars list then
				if width < scope.width then
					scope.storedData = data .. scancode
				end
			end
		else
			if scancode == "space" then scancode = " " end
			if scancode ~= "lshift" and scancode ~= "rshift"  and scancode ~= "capslock" and scancode ~= "return" and scancode ~= "tab" and scancode ~= "printscreen" then --yeh self explanatory, dont want this appended to the data
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
end

function graphics:buttonsRender()
	
	local correctColour = function(key,value)
		if self.currentFocus == key and self.currentFocusType == "button" then
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
				v.position[1] * self.screenDimensions[1], -- x 				v.position[1] * self.screenDimensions[1],  v.position[2] * self.screenDimensions[2],
				v.position[2] * self.screenDimensions[2], -- y
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
			corner[1] + 0.05*spanningRegion[1],
			corner[2] + 0.35*spanningRegion[2],
			(spanningRegion[1]*box.dimensions[1]),
			"left"
		)
		love.graphics.printf(
			box.storedData,
			textboxTextData[1] + 0.025*textboxTextData[3],
			textboxTextData[2] + 0.35*textboxTextData[4],
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