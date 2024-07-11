return {
	['testburger'] = {
		label = 'Test Burger',
		weight = 220,
		degrade = 60,
		client = {
			image = 'burger_chicken.png',
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			export = 'ox_inventory_examples.testburger'
		},
		server = {
			export = 'ox_inventory_examples.testburger',
			test = 'what an amazingly delicious burger, amirite?'
		},
		buttons = {
			{
				label = 'Lick it',
				action = function(slot)
					print('You licked the burger')
				end
			},
			{
				label = 'Squeeze it',
				action = function(slot)
					print('You squeezed the burger :(')
				end
			},
			{
				label = 'What do you call a vegan burger?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('A misteak.')
				end
			},
			{
				label = 'What do frogs like to eat with their hamburgers?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('French flies.')
				end
			},
			{
				label = 'Why were the burger and fries running?',
				group = 'Hamburger Puns',
				action = function(slot)
					print('Because they\'re fast food.')
				end
			}
		},
		consume = 0.3
	},

	['bandage'] = {
		label = 'Bandage',
		weight = 115,
		client = {
			anim = { dict = 'missheistdockssetup1clipboard@idle_a', clip = 'idle_a', flag = 49 },
			prop = { model = `prop_rolled_sock_02`, pos = vec3(-0.14, -0.14, -0.08), rot = vec3(-50.0, -50.0, 0.0) },
			disable = { move = true, car = true, combat = true },
			usetime = 2500,
		}
	},

	['black_money'] = {
		label = 'Dirty Money',
	},

	['burger'] = {
		label = 'Burger',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious burger'
		},
	},

	['sprunk'] = {
		label = 'Sprunk',
		weight = 350,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_can_01`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with a sprunk'
		}
	},

	['parachute'] = {
		label = 'Parachute',
		weight = 8000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 1500
		}
	},

	['garbage'] = {
		label = 'Garbage',
	},

	['paperbag'] = {
		label = 'Paper Bag',
		weight = 1,
		stack = false,
		close = false,
		consume = 0
	},

	['identification'] = {
		label = 'Identification',
		client = {
			image = 'card_id.png'
		}
	},

	['panties'] = {
		label = 'Knickers',
		weight = 10,
		consume = 0,
		client = {
			status = { thirst = -100000, stress = -25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_cs_panties_02`, pos = vec3(0.03, 0.0, 0.02), rot = vec3(0.0, -13.5, -1.5) },
			usetime = 2500,
		}
	},

	-- ['lockpick'] = {
	-- 	label = 'Lockpick',
	-- 	weight = 160,
	-- },

	-- ['phone'] = {
	-- 	label = 'Phone',
	-- 	weight = 190,
	-- 	stack = false,
	-- 	consume = 0,
	-- 	client = {
	-- 		add = function(total)
	-- 			if total > 0 then
	-- 				pcall(function() return exports.npwd:setPhoneDisabled(false) end)
	-- 			end
	-- 		end,

	-- 		remove = function(total)
	-- 			if total < 1 then
	-- 				pcall(function() return exports.npwd:setPhoneDisabled(true) end)
	-- 			end
	-- 		end
	-- 	}
	-- },

	['money'] = {
		label = 'Money',
	},

	['mustard'] = {
		label = 'Mustard',
		weight = 500,
		client = {
			status = { hunger = 25000, thirst = 25000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_food_mustard`, pos = vec3(0.01, 0.0, -0.07), rot = vec3(1.0, 1.0, -1.5) },
			usetime = 2500,
			notification = 'You.. drank mustard'
		}
	},

	['water'] = {
		label = 'Water',
		weight = 500,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ld_flow_bottle`, pos = vec3(0.03, 0.03, 0.02), rot = vec3(0.0, 0.0, -1.5) },
			usetime = 2500,
			cancel = true,
			notification = 'You drank some refreshing water'
		}
	},

	-- ['radio'] = {
	-- 	label = 'Radio',
	-- 	weight = 1000,
	-- 	stack = false,
	-- 	allowArmed = true
	-- },

	['armour'] = {
		label = 'Bulletproof Vest',
		weight = 3000,
		stack = false,
		client = {
			anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
			usetime = 3500
		}
	},

	['clothing'] = {
		label = 'Clothing',
		consume = 0,
	},

	['mastercard'] = {
		label = 'Fleeca Card',
		stack = false,
		weight = 10,
		client = {
			image = 'card_bank.png'
		}
	},

	['scrapmetal'] = {
		label = 'Scrap Metal',
		weight = 80,
	},

	['cola'] = {
		label = 'eCola',
		weight = 350,
		client = {
			status = { thirst = 200000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = { model = `prop_ecola_can`, pos = vec3(0.01, 0.01, 0.06), rot = vec3(5.0, 5.0, -180.5) },
			usetime = 2500,
			notification = 'You quenched your thirst with cola'
		}
	},
	['beehive'] = {
		label = 'Beehive',
		weight = 1000,
		stack = false,
		consume = 0,
		client = {
			export = 'js5m_beekeeping.useHive',
		},
	},
	['bee_queen'] = {
		label = 'Queen Bee',
		weight = 1000,
		stack = false,
		consume = 0,
	},
	['bees_wax'] = {
		label = 'Bees Wax',
		weight = 30,
		consume = 0,
	},
	['og_kush_seed'] = {
		label = 'OG Kush Seed',
		weight = 100,
		consume = 0,
		client = {
			export = 'js5m_planting.useSeed',
		},
	},
	['og_kush'] = {
		label = 'OG Kush Buds',
		weight = 1000,
		consume = 0,
	},
	['tomato_seed'] = {
		label = 'Tomato Seed',
		weight = 100,
		consume = 0,
		client = {
			export = 'js5m_planting.useSeed',
		},
	},
	['barley_seed'] = {
		label = 'Barley Seed',
		weight = 100,
		consume = 0,
		client = {
			export = 'js5m_planting.useSeed',
		},
	},
	['tobacco_seed'] = {
		label = 'Tobacco Seed',
		weight = 100,
		consume = 0,
		client = {
			export = 'js5m_planting.useSeed',
		},
	},
	['tobacco'] = {
		label = 'Tobacco Leaf',
		weight = 1000,
		consume = 0,
	},
	['plant_nutrition'] = {
		label = 'Plant Nutrition',
		weight = 3000,
	},
	['radio'] = {
		label = 'Radio',
		weight = 1000,
		stack = false,
		allowArmed = true,
		client = {
			export = 'js5m_radio.useRadio',
			add = function(total)
				if total > 0 then
					pcall(function() return exports.js5m_radio:pickupRadio() end)
				end
			end,
			remove = function(total)
				if total < 1 then
					pcall(function() return exports.js5m_radio:dropRadio() end)
				end
			end
		},
	},
	['phone'] = {
		label = 'Phone',
		weight = 1000,
		stack = false,
		consume = 0,
		server = {
			export = 'js5m_phone.UsePhone',
		},
	},
	['rolex'] = {
		label = 'Rolex',
		weight = 1500,
	},
	['diamond_ring'] = {
		label = 'Diamond Ring',
		weight = 1500,
	},
	['goldchain'] = {
		label = 'Gold Chain',
		weight = 1000,
	},
	['10kgoldchain'] = {
		label = '10k Gold Chain',
		weight = 2000,
	},
	--New Job Items
	['newsmic'] = {
		label = 'News Microphone',
		weight = 1000,
		stack = false,
		consume = 0,
		client = {
			export = 'js5m_newsjob.toggleMic',
		},
	},

	['newsbmic'] = {
		label = 'News Boom Mic',
		weight = 3000,
		stack = false,
		consume = 0,
		client = {
			export = 'js5m_newsjob.toggleBMic',
		},
	},
	['newscam'] = {
		label = 'News Camera',
		weight = 1000,
		stack = false,
		consume = 0,
		client = {
			export = 'js5m_newsjob.toggleCam',
		},
	},
	['spraypaint'] = {
		label = 'Spray Paint',
		weight = 1000,
		stack = false,
		consume = 0,
		server = {
			export = 'js5m_gangs.UseSprayPaint',
		},
		-- client = {
		-- 	export = 'js5m_newsjob.toggleCam',
		-- },
	},
	['sprayremover'] = {
		label = 'Paint Stripper',
		weight = 1000,
		stack = false,
		consume = 0,
		server = {
			export = 'js5m_gangs.UseSprayRemover',
		},
		-- client = {
		-- 	export = 'js5m_newsjob.toggleCam',
		-- },
	},
	['camping_tent'] = {
		label = 'Camping Tent',
		weight = 5000,
		stack = false,
		consume = 0,
		client = {
			export = 'js5m_camping.useTent',
		},
	},
	['stickynote'] = {
		label = 'Sticky Note',
		weight = 500,
		stack = false,
		consume = 0,
	},
	['gunrack'] = {
		label = 'Gun Rack',
		weight = 5000,
		stack = false,
		consume = 0,
		client = {
			export = 'js5m_gunrack.placeGunRack',
		},
	},
	['coal_ore'] = {
		label = 'Coal Ore',
		weight = 200,
		stack = true,
		consume = 0,
	},
	['diamond_ore'] = {
		label = 'Diamond Ore',
		weight = 300,
		stack = true,
		consume = 0,
	},
	['iron_ore'] = {
		label = 'Iron Ore',
		weight = 300,
		stack = true,
		consume = 0,
	},
	['silver_ore'] = {
		label = 'Silver Ore',
		weight = 300,
		stack = true,
		consume = 0,
	},
	['gold_ore'] = {
		label = 'Gold Ore',
		weight = 300,
		stack = true,
		consume = 0,
	},
	['tin_ore'] = {
		label = 'Tin Ore',
		weight = 300,
		stack = true,
		consume = 0,
	},
	['crystal_ore'] = {
		label = 'Crystal Ore',
		weight = 300,
		stack = true,
		consume = 0,
	},
	['copper_ore'] = {
		label = 'Copper Ore',
		weight = 300,
		stack = true,
		consume = 0,
	},
	['lead_ore'] = {
		label = 'Lead Ore',
		weight = 300,
		stack = true,
		consume = 0,
	},
	['iron_ingot'] = {
		label = 'Iron Ingot',
		weight = 300,
		stack = true,
		consume = 0,
	},
	['copper_ingot'] = {
		label = 'Copper Ingot',
		weight = 300,
		stack = true,
		consume = 0,
	},
	['gold_ingot'] = {
		label = 'Gold Ingot',
		weight = 300,
		stack = true,
		consume = 0,
	},
	['lead_ingot'] = {
		label = 'Lead Ingot',
		weight = 300,
		stack = true,
		consume = 0,
	},
	['diamond_ingot'] = {
		label = 'Diamond Ingot',
		weight = 300,
		stack = true,
		consume = 0,
	},
	['coal'] = {
		label = 'Coal',
		weight = 300,
		stack = true,
		consume = 0,
	},
	['hunting_deer_pelt_1'] = {
		label = 'Deer Pelt Rank 1',
		weight = 1000,
		stack = true,
		consume = 0,
	},
	['hunting_deer_pelt_2'] = {
		label = 'Deer Pelt Rank 2',
		weight = 1000,
		stack = true,
		consume = 0,
	},
	['hunting_deer_pelt_3'] = {
		label = 'Deer Pelt Rank 3',
		weight = 1000,
		stack = true,
		consume = 0,
	},
	['barrier'] = {
		label = 'Barrier',
		weight = 1000,
		stack = false,
		consume = 0,
		server = {
			export = 'js5m_objectspawner.placeObject',
		},
		hash = `prop_barrier_work01b`,
	},
	['construction_sign'] = {
		label = 'Construction Sign',
		weight = 1000,
		stack = false,
		consume = 0,
		server = {
			export = 'js5m_objectspawner.placeObject',
		},
		hash = `prop_barrier_work01d`,
	},
	['weedrack_a'] = {
		label = 'Weed Rack',
		weight = 2000,
		stack = false,
		consume = 0,
		client = {
			export = 'js5m_weed.useWeedrack',
		},
	},
	['weedrack_b'] = {
		label = 'Weed Rack',
		weight = 2000,
		stack = false,
		consume = 0,
		client = {
			export = 'js5m_weed.useWeedrack',
		},
	},
	['weedrack_c'] = {
		label = 'Weed Rack',
		weight = 2000,
		stack = false,
		consume = 0,
		client = {
			export = 'js5m_weed.useWeedrack',
		},
	},
	['tobaccorack_a'] = {
		label = 'Tobacco Rack',
		weight = 2000,
		stack = false,
		consume = 0,
		client = {
			export = 'js5m_weed.useWeedrack',
		},
	},
	['lockpick'] = {
		label = 'Lockpick',
		weight = 160,
		client = {
			event = 'lockpick:use'
		},
	},
	['advancedlockpick'] = {
		label = 'Advanced Lockpick',
		weight = 500,
		client = {
			event = 'lockpick:use'
		},
	},
	['vehiclekey'] = {
		label = 'Vehicle Key'
	},
	['laptop'] = {
		label = 'Laptop',
		weight = 500,
		client = {
			event = 'cuchi_computer:useItem'
		},
	},
	['crypto_rig'] = {
		label = 'Crypto Rig',
		weight = 2000,
		stack = false,
		consume = 0,
		-- client = {
		-- 	export = 'js5m_crypto.useMiningRig',
		-- },
	},
	['car_battery'] = {
		label = 'Car Battery',
		weight = 5000,
		stack = false,
		consume = 0,
		client = {
			export = 'js5m_crypto.useCarBattery',
		},
	},
	['crypto_gpu'] = {
		label = 'Crypto GPU',
		weight = 1000,
		consume = 0,
	},
	['joint'] = {
		label = 'Joint',
		weight = 100,
		consume = 0,
		client = {
			export = 'js5m_consumables.useJoint',
		},
	},
	['meth'] = {
		label = 'Joint',
		weight = 100,
		consume = 0,
		client = {
			export = 'js5m_consumables.useMeth',
		},
	},
	['coke_baggy'] = {
		label = 'Coke Baggy',
		weight = 200,
		consume = 0,
		client = {
			export = 'js5m_consumables.useCokeBaggy',
		},
	},
	['crack_baggy'] = {
		label = 'Cracky Baggy',
		weight = 100,
		consume = 0,
		client = {
			export = 'js5m_consumables.useCrackBaggy',
		},
	},
	['xtc_baggy'] = {
		label = 'Ecstacy Baggy',
		weight = 100,
		consume = 0,
		client = {
			export = 'js5m_consumables.useXtcBaggy',
		},
	},
	['oxy'] = {
		label = 'Oxy',
		weight = 100,
		consume = 0,
		client = {
			export = 'js5m_consumables.useOxy',
		},
	},
	['case_prisma2'] = {
		label = 'Prisma 2 Case',
		weight = 3000,
		consume = 0,
		server = {
			export = 'js5m_lootcrate_ox.UseLootCrate',
		},
	},
	['backpack'] = {
		label = 'Backpack',
		weight = 220,
		stack = false,
		consume = 0,
		client = {
			export = 'js5m_backpack.openBackpack'
		}
	},
	['scraplist'] = {
		label = 'Scrap List',
		stack = false,
		consume = 0,
		server = {
			export = 'js5m_scrapyard.openList'
		}
	},
}
