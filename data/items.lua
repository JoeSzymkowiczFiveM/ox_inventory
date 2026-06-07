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
    ['phone'] = {
        label = 'Phone',
        weight = 190,
        stack = false,
        consume = 0,
        client = {
            add = function(total)
                if total > 0 then
                    pcall(function() return exports.npwd:setPhoneDisabled(false) end)
                end
            end,

            remove = function(total)
                if total < 1 then
                    pcall(function() return exports.npwd:setPhoneDisabled(true) end)
                end
            end
        }
    },

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

    ['radio'] = {
        label = 'Radio',
        weight = 1000,
        stack = false,
        allowArmed = true
    },

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
    ['plastic'] = {
        label = 'Plastic',
        weight = 50,
    },
    ['aluminum'] = {
        label = 'Aluminum',
        weight = 70,
    },
    ['glass'] = {
        label = 'Glass',
        weight = 65,
    },
    ['rubber'] = {
        label = 'Rubber',
        weight = 65,
    },
    ['electronickit'] = {
        label = 'Electronics Kit',
        weight = 250,
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
        weight = 200,
        consume = 0,
    },
    ['sour_diesel_seed'] = {
        label = 'Sour Diesel Seed',
        weight = 100,
        consume = 0,
        client = {
            export = 'js5m_planting.useSeed',
        },
    },
    ['sour_diesel'] = {
        label = 'Sour Diesel Buds',
        weight = 200,
        consume = 0,
    },
    ['ak47_seed'] = {
        label = 'AK 47 Seed',
        weight = 100,
        consume = 0,
        client = {
            export = 'js5m_planting.useSeed',
        },
    },
    ['white_widow_seed'] = {
        label = 'White Widow Seed',
        weight = 100,
        consume = 0,
        client = {
            export = 'js5m_planting.useSeed',
        },
    },
    ['white_widow'] = {
        label = 'White Widow Buds',
        weight = 200,
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
    ['potato_seed'] = {
        label = 'Potato Seed',
        weight = 100,
        consume = 0,
        client = {
            export = 'js5m_planting.useSeed',
        },
    },
    ['potato'] = {
        label = 'Potato',
        weight = 2000,
        consume = 0,
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
            export = 'z_phone.UsePhone',
            test = 'what an amazingly delicious burger, amirite?'
        }
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
    ['animal_pelt'] = {
        label = 'Animal Pelt',
        weight = 1000,
        consume = 0,
        stack = true,
    },
    ['animal_meat'] = {
        label = 'Animal Meat',
        weight = 1000,
        consume = 0,
        stack = true,
    },
    ['beef_patty'] = {
        label = 'Beef Patty',
        weight = 500,
        consume = 0,
        stack = true,
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
        stack = false,
        client = {
            event = 'lockpick:use'
        },
    },
    ['advancedlockpick'] = {
        label = 'Advanced Lockpick',
        weight = 500,
        stack = false,
        client = {
            event = 'lockpick:use'
        },
    },
    ['vehiclekey'] = {
        label = 'Vehicle Key'
    },
    ['laptop'] = {
        label = 'Laptop',
        weight = 5000,
        client = {
            export = 'cuchi_computer.useItem'
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
    ['js5m_backpack_b_01'] = {
        label = 'Backpack',
        weight = 5000,
        stack = false,
        consume = 0,
        client = {
            export = 'js5m_backpack.openBackpack'
        }
    },
    ['js5m_backpack_b_02'] = {
        label = 'Backpack',
        weight = 5000,
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
    ['coffee'] = {
        label = 'Coffee',
        weight = 350,
        client = {
            status = { thirst = 200000 },
            anim = { dict = 'amb@world_human_drinking@coffee@male@idle_a', clip = 'idle_c' },
            prop = { model = `p_ing_coffeecup_01`, pos = vec3(0.01, 0.01, 0.00), rot = vec3(5.0, 5.0, -180.5), bone = 28422 },
            usetime = 6000,
            notification = 'You quenched your thirst with cola'
        }
    },
    ['fishing_rod'] = {
        label = 'Fishing Rod',
        stack = false,
        consume = 0,
        server = {
            export = 'js5m_fishing.UseFishingRod'
        }
    },
    ['fishing_bait'] = {
        label = 'Fishing Bait',
    },
    ['pills_anxiety'] = {
        label = 'Anxiety Pills',
        weight = 350,
        client = {
            status = { stress = -2500 },
            anim = { dict = 'mp_suicide', clip = 'pill', flag = 49 },
            usetime = 2500,
            notification = 'You feel a bit better'
        },
    },
    ['mask_3'] = {
        label = 'Monkey Mask',
        weight = 1000,
        client = {
            export = 'js5m_misc.useMask'
        },
    },
    ['mask_34'] = {
        label = 'Gnome Mask',
        weight = 1000,
        client = {
            export = 'js5m_misc.useMask'
        },
    },
    ['mask_35'] = {
        label = 'Balaclava',
        weight = 1000,
        client = {
            export = 'js5m_misc.useMask'
        },
    },
    ['mask_46'] = {
        label = 'Gas Mask',
        weight = 1000,
        client = {
            export = 'js5m_misc.useMask'
        },
    },
    ['mask_115'] = {
        label = 'Shemagh Mask',
        weight = 1000,
        client = {
            export = 'js5m_misc.useMask'
        },
    },
    ['mask_179'] = {
        label = 'Smiley Mask',
        weight = 1000,
        client = {
            export = 'js5m_misc.useMask'
        },
    },
    ["id_card"] = {
        label = "ID Card",
        weight = 0,
        stack = false,
        consume = 0,
        description = "A card containing all your information to identify yourself",
        server = {
            export = 'js5m_idcard.UseIdCard'
        },
        client = {
            anim = { dict = 'paper_1_rcm_alt1-9', clip = 'player_one_dual-9' },
            prop = { model = `prop_franklin_dl`, pos = vec3(0.1000, 0.0200, -0.0300), rot = vec3(-90.000, 170.000, 78.999), bone = 57005 },
            disable = { move = true, combat = true },
            usetime = 5000,
        }
    },

    ["driver_license"] = {
        label = "Drivers License",
        weight = 0,
        stack = false,
        consume = 0,
        description = "Permit to show you can drive a vehicle",
        server = {
            export = 'js5m_idcard.UseIdCard'
        },
        client = {
            anim = { dict = 'paper_1_rcm_alt1-9', clip = 'player_one_dual-9' },
            prop = { model = `prop_franklin_dl`, pos = vec3(0.1000, 0.0200, -0.0300), rot = vec3(-90.000, 170.000, 78.999), bone = 57005 },
            disable = { move = true, combat = true },
            usetime = 5000,
        }
    },
    ["weapon_license"] = {
        label = "Weapon License",
        weight = 0,
        stack = false,
        consume = 0,
        description = "Weapon License",
        server = {
            export = 'js5m_idcard.UseIdCard'
        },
        client = {
            anim = { dict = 'paper_1_rcm_alt1-9', clip = 'player_one_dual-9' },
            prop = { model = `prop_franklin_dl`, pos = vec3(0.1000, 0.0200, -0.0300), rot = vec3(-90.000, 170.000, 78.999), bone = 57005 },
            disable = { move = true, combat = true },
            usetime = 5000,
        }
    },
    ["cigarette_pack"] = {
        label = "Pack Of Cigarettes",
        weight = 0,
        stack = false,
        consume = 0.05,
        decay = true,
        description = "Pack Of Cigarettes",
        server = {
            export = 'js5m_smoking.UseCigarettePack'
        },
        client = {
            anim = { dict = 'move_p_m_two_idles@generic', clip = 'fidget_sniff_fingers' },
            -- prop = { model = `ng_proc_cigarette01a`, pos = vec3(0.1000, 0.0200, -0.0300), rot = vec3(-90.000, 170.000, 78.999), bone = 57005 },
            -- disable = { move = true},
            usetime = 1000,
        }
    },
    ['tradingcard_pack'] = {
        label = 'Trading Card Pack',
        weight = 500,
        consume = 0,
        -- server = {
        -- 	export = 'js5m_tradingcards.UseTradingCardPack',
        -- },
        client = {
            -- anim = { dict = 'anim@mp_snowball', clip = 'pickup_snowball' },
            -- prop = { model = `ng_proc_cigarette01a`, pos = vec3(0.1000, 0.0200, -0.0300), rot = vec3(-90.000, 170.000, 78.999), bone = 57005 },
            disable = { combat = true },
            -- usetime = 5000,
            export = 'js5m_tradingcards.useTradingCardPack'
        }
    },
    ['tradingcard'] = {
        label = 'Trading Card',
        consume = 0,
        weight = 100,
        client = {
            disable = { combat = true },
            export = 'js5m_tradingcards.useTradingCard'
        },
    },
    ["grill_1"] = {
        label = 'Grill 1',
        weight = 1000,
        stack = false,
        consume = 0,
        client = {
            export = 'js5m_grilling.useGrill',
        },
    },
    ["grill_2"] = {
        label = 'Grill 2',
        weight = 1000,
        stack = false,
        consume = 0,
        client = {
            export = 'js5m_grilling.useGrill',
        },
    },
    ['bzzz_food_grill_zucchini_grill_a'] = {
        label = 'Grilled zucchini',
        weight = 50,
        client = {
            status = { hunger = 100000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger' },
            prop = { model = `bzzz_food_grill_zucchini_grill_a`, pos = vec3(0.04, -0.02, -0.05), rot = vec3(30.0, -30.0, 65.0) },
            usetime = 5000,
            notification = 'Bon appétit!'
        }
    },
    ['bzzz_food_grill_tofu_grill_a'] = {
        label = 'Grilled tofu',
        weight = 100,
        client = {
            status = { hunger = 100000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger' },
            prop = { model = `bzzz_food_grill_tofu_grill_a`, pos = vec3(0.04, -0.02, -0.03), rot = vec3(15.0, -30.0, 65.0) },
            usetime = 5000,
            notification = 'Bon appétit!'
        }
    },
    ['bzzz_food_grill_steak_grill_d'] = {
        label = 'Ossobuco',
        weight = 500,
        client = {
            status = { hunger = 100000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger' },
            prop = { model = `bzzz_food_grill_steak_grill_d`, pos = vec3(0.03, -0.04, -0.02), rot = vec3(30.0, 0.0, -8.0) },
            usetime = 5000,
            notification = 'Bon appétit!'
        }
    },
    ['bzzz_food_grill_steak_grill_c'] = {
        label = 'T-Bone Steak',
        weight = 400,
        client = {
            status = { hunger = 100000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger' },
            prop = { model = `bzzz_food_grill_steak_grill_c`, pos = vec3(0.06, -0.04, -0.02), rot = vec3(24.0, 30.0, -62.0) },
            usetime = 5000,
            notification = 'Bon appétit!'
        }
    },
    ['bzzz_food_grill_steak_grill_b'] = {
        label = 'Tomahawk steak',
        weight = 250,
        client = {
            status = { hunger = 100000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger' },
            prop = { model = `bzzz_food_grill_steak_grill_b`, pos = vec3(0.03, -0.03, -0.02), rot = vec3(18.0, -35.0, 64.0) },
            usetime = 5000,
            notification = 'Bon appétit!'
        }
    },
    ['bzzz_food_grill_steak_grill_a'] = {
        label = 'Grilled steak',
        weight = 250,
        client = {
            status = { hunger = 100000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger' },
            prop = { model = `bzzz_food_grill_steak_grill_a`, pos = vec3(0.03, -0.03, -0.02), rot = vec3(18.0, -35.0, 64.0) },
            usetime = 5000,
            notification = 'Bon appétit!'
        }
    },
    ['bzzz_food_grill_skewer_grill_a'] = {
        label = 'Grilled meat',
        weight = 200,
        client = {
            status = { hunger = 100000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger' },
            prop = { model = `bzzz_food_grill_skewer_grill_a`, pos = vec3(0.04, -0.02, -0.03), rot = vec3(15.0, -30.0, 65.0) },
            usetime = 5000,
            notification = 'Bon appétit!'
        }
    },
    ['bzzz_food_grill_sausage_grill_a'] = {
        label = 'Grilled sausage',
        weight = 200,
        client = {
            status = { hunger = 100000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger' },
            prop = { model = `bzzz_food_grill_sausage_grill_a`, pos = vec3(0.04, -0.02, -0.03), rot = vec3(15.0, -30.0, 65.0) },
            usetime = 5000,
            notification = 'Bon appétit!'
        }
    },
    ['bzzz_food_grill_salmon_grill_a'] = {
        label = 'Grilled salmon',
        weight = 200,
        client = {
            status = { hunger = 100000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger' },
            prop = { model = `bzzz_food_grill_salmon_grill_a`, pos = vec3(0.0, -0.02, -0.02), rot = vec3(25.0, -35.0, 64.0) },
            usetime = 5000,
            notification = 'Bon appétit!'
        }
    },
    ['bzzz_food_grill_ribs_grill_b'] = {
        label = 'Grilled rib',
        weight = 200,
        client = {
            status = { hunger = 100000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger' },
            prop = { model = `bzzz_food_grill_ribs_grill_b`, pos = vec3(0.01, -0.01, -0.01), rot = vec3(-62.0, 5.0, 174.0) },
            usetime = 5000,
            notification = 'Bon appétit!'
        }
    },
    ['bzzz_food_grill_potato_grill_a'] = {
        label = 'Grilled potato',
        weight = 200,
        client = {
            status = { hunger = 100000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger' },
            prop = { model = `bzzz_food_grill_potato_grill_a`, pos = vec3(-0.03, 0.0, -0.01), rot = vec3(2.0, -15.0, 106.0) },
            usetime = 5000,
            notification = 'Bon appétit!'
        }
    },
    ['bzzz_food_grill_pineapple_grill_a'] = {
        label = 'Grilled pineapple',
        weight = 200,
        client = {
            status = { hunger = 100000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger' },
            prop = { model = `bzzz_food_grill_pineapple_grill_a`, pos = vec3(-0.03, 0.0, -0.01), rot = vec3(2.0, -15.0, 106.0) },
            usetime = 5000,
            notification = 'Bon appétit!'
        }
    },
    ['bzzz_food_grill_naan_grill_a'] = {
        label = 'Grilled naan',
        weight = 350,
        client = {
            status = { hunger = 100000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger' },
            prop = { model = `bzzz_food_grill_naan_grill_a`, pos = vec3(0.03, -0.06, -0.04), rot = vec3(32.0, 5.0, 25.0) },
            usetime = 5000,
            notification = 'Bon appétit!'
        }
    },
    ['bzzz_food_grill_mushrooms_grill_a'] = {
        label = 'Grilled mushrooms',
        weight = 300,
        client = {
            status = { hunger = 100000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger' },
            prop = { model = `bzzz_food_grill_mushrooms_grill_a`, pos = vec3(0.04, -0.02, -0.03), rot = vec3(15.0, -30.0, 65.0) },
            usetime = 5000,
            notification = 'Bon appétit!'
        }
    },
    ['bzzz_food_grill_halloumi_grill_a'] = {
        label = 'Grilled halloumi',
        weight = 300,
        client = {
            status = { hunger = 100000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger' },
            prop = { model = `bzzz_food_grill_halloumi_grill_a`, pos = vec3(-0.03, 0.0, 0.0), rot = vec3(22.0, -25.0, 85.0) },
            usetime = 5000,
            notification = 'Bon appétit!'
        }
    },
    ['bzzz_food_grill_fish_grill_a'] = {
        label = 'Grilled fish',
        weight = 300,
        client = {
            status = { hunger = 100000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger' },
            prop = { model = `bzzz_food_grill_fish_grill_a`, pos = vec3(0.06, 0.00, -0.04), rot = vec3(-20.0, -16.0, -83.0) },
            usetime = 5000,
            notification = 'Bon appétit!'
        }
    },
    ['bzzz_food_grill_corn_grill_a'] = {
        label = 'Grilled corn',
        weight = 300,
        client = {
            status = { hunger = 100000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger' },
            prop = { model = `bzzz_food_grill_corn_grill_a`, pos = vec3(0.04, -0.02, -0.03), rot = vec3(15.0, -30.0, 65.0) },
            usetime = 5000,
            notification = 'Bon appétit!'
        }
    },
    ['bzzz_food_grill_chicken_grill_d'] = {
        label = 'Grilled chicken steak',
        weight = 300,
        client = {
            status = { hunger = 100000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger' },
            prop = { model = `bzzz_food_grill_chicken_grill_d`, pos = vec3(-0.01, 0.0, 0.0), rot = vec3(-20.0, -16.0, -83.0) },
            usetime = 5000,
            notification = 'Bon appétit!'
        }
    },
    ['bzzz_food_grill_chicken_grill_c'] = {
        label = 'Grilled chicken wing',
        weight = 300,
        client = {
            status = { hunger = 100000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger' },
            prop = { model = `bzzz_food_grill_chicken_grill_c`, pos = vec3(-0.01, 0.0, 0.0), rot = vec3(-20.0, -16.0, -83.0) },
            usetime = 5000,
            notification = 'Bon appétit!'
        }
    },
    ['bzzz_food_grill_chicken_grill_b'] = {
        label = 'Grilled chicken thigh',
        weight = 300,
        client = {
            status = { hunger = 100000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger' },
            prop = { model = `bzzz_food_grill_chicken_grill_b`, pos = vec3(-0.01, 0.0, 0.0), rot = vec3(-20.0, -16.0, -83.0) },
            usetime = 5000,
            notification = 'Bon appétit!'
        }
    },
    ['bzzz_food_grill_camembert_grill_a'] = {
        label = 'Grilled camembert',
        weight = 300,
        client = {
            status = { hunger = 100000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger' },
            prop = { model = `bzzz_food_grill_camembert_grill_a`, pos = vec3(-0.01, 0.0, 0.0), rot = vec3(-20.0, -16.0, -83.0) },
            usetime = 5000,
            notification = 'Bon appétit!'
        }
    },
    ['bzzz_food_grill_burger_grill_d'] = {
        label = 'Grilled burger',
        weight = 600,
        client = {
            status = { hunger = 100000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger' },
            prop = { model = `bzzz_food_grill_burger_grill_d`, pos = vec3(0.0, -0.02, -0.03), rot = vec3(0.0, 0.0, -50.0) },
            usetime = 5000,
            notification = 'Bon appétit!'
        }
    },
    ['bzzz_food_grill_baguette_grill_c'] = {
        label = 'Grilled chicken baguette',
        weight = 600,
        client = {
            status = { hunger = 100000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger' },
            prop = { model = `bzzz_food_grill_baguette_grill_c`, pos = vec3(0.07, 0.01, -0.02), rot = vec3(0.15, 0.0, -60.0) },
            usetime = 5000,
            notification = 'Bon appétit!'
        }
    },
    ['bzzz_food_grill_bacon_grill_a'] = {
        label = 'Grilled bacon',
        weight = 50,
        client = {
            status = { hunger = 100000 },
            anim = { dict = 'mp_player_inteat@burger', clip = 'mp_player_int_eat_burger' },
            prop = { model = `bzzz_food_grill_bacon_grill_a`, pos = vec3(0.02, -0.01, -0.01), rot = vec3(0.0, 0.0, 80.0) },
            usetime = 5000,
            notification = 'Bon appétit!'
        }
    },

    ["house_key"] = {
        label = 'House Key',
        weight = 5,
        stack = false,
        consume = 0,
    },
    ["wood_log"] = {
        label = 'Wood Log',
        weight = 30,
        consume = 0,
    },
    -- Fresh variants (non-consumable)
    ["bzzz_food_grill_bacon_fresh_a"] = {
        label = 'Fresh Bacon',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_bbq_a_fresh"] = {
        label = 'Fresh BBQ (A)',
        weight = 50,
        consume = 0,
    },
    ["bzzz_food_grill_bbq_b_fresh"] = {
        label = 'Fresh BBQ (B)',
        weight = 50,
        consume = 0,
    },
    ["bzzz_food_grill_bbq_c_fresh"] = {
        label = 'Fresh BBQ (C)',
        weight = 50,
        consume = 0,
    },
    ["bzzz_food_grill_bbq_d_fresh"] = {
        label = 'Fresh BBQ (D)',
        weight = 50,
        consume = 0,
    },
    ["bzzz_food_grill_bbq_e_fresh"] = {
        label = 'Fresh BBQ (E)',
        weight = 50,
        consume = 0,
    },
    ["bzzz_food_grill_bbq_f_fresh"] = {
        label = 'Fresh BBQ (F)',
        weight = 50,
        consume = 0,
    },
    ["bzzz_food_grill_bbq_g_fresh"] = {
        label = 'Fresh BBQ (G)',
        weight = 50,
        consume = 0,
    },
    ["bzzz_food_grill_baguette_fresh_a"] = {
        label = 'Fresh Baguette (A)',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_baguette_fresh_b"] = {
        label = 'Fresh Baguette (B)',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_baguette_fresh_c"] = {
        label = 'Fresh Baguette (C)',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_burger_fresh_a"] = {
        label = 'Fresh Burger (A)',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_burger_fresh_b"] = {
        label = 'Fresh Burger (B)',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_burger_fresh_c"] = {
        label = 'Fresh Burger (C)',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_burger_fresh_d"] = {
        label = 'Fresh Burger (D)',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_camembert_fresh_a"] = {
        label = 'Fresh Camembert',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_chicken_fresh_a"] = {
        label = 'Fresh Chicken (A)',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_chicken_fresh_b"] = {
        label = 'Fresh Chicken (B)',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_chicken_fresh_c"] = {
        label = 'Fresh Chicken (C)',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_chicken_fresh_d"] = {
        label = 'Fresh Chicken (D)',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_corn_fresh_a"] = {
        label = 'Fresh Corn',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_fish_fresh_a"] = {
        label = 'Fresh Fish',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_halloumi_fresh_a"] = {
        label = 'Fresh Halloumi',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_mushrooms_fresh_a"] = {
        label = 'Fresh Mushrooms',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_naan_fresh_a"] = {
        label = 'Fresh Naan',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_pineapple_fresh_a"] = {
        label = 'Fresh Pineapple',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_potato_fresh_a"] = {
        label = 'Fresh Potato',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_ribs_fresh_a"] = {
        label = 'Fresh Ribs (A)',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_ribs_fresh_b"] = {
        label = 'Fresh Ribs (B)',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_salmon_fresh_a"] = {
        label = 'Fresh Salmon',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_sausage_fresh_a"] = {
        label = 'Fresh Sausage',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_skewer_fresh_a"] = {
        label = 'Fresh Skewer',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_steak_fresh_a"] = {
        label = 'Fresh Steak (A)',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_steak_fresh_b"] = {
        label = 'Fresh Steak (B)',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_steak_fresh_c"] = {
        label = 'Fresh Steak (C)',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_steak_fresh_d"] = {
        label = 'Fresh Steak (D)',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_tofu_fresh_a"] = {
        label = 'Fresh Tofu',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_zucchini_fresh_a"] = {
        label = 'Fresh Zucchini',
        weight = 30,
        consume = 0,
    },
    ["prop_food_meat_fresh"] = {
        label = 'Fresh Meat',
        weight = 30,
        consume = 0,
    },
    -- Burnt variants (non-consumable)
    ["bzzz_food_grill_bacon_burnt_a"] = {
        label = 'Burnt Bacon',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_bbq_a_burnt"] = {
        label = 'Burnt BBQ (A)',
        weight = 50,
        consume = 0,
    },
    ["bzzz_food_grill_bbq_b_burnt"] = {
        label = 'Burnt BBQ (B)',
        weight = 50,
        consume = 0,
    },
    ["bzzz_food_grill_bbq_c_burnt"] = {
        label = 'Burnt BBQ (C)',
        weight = 50,
        consume = 0,
    },
    ["bzzz_food_grill_bbq_d_burnt"] = {
        label = 'Burnt BBQ (D)',
        weight = 50,
        consume = 0,
    },
    ["bzzz_food_grill_bbq_e_burnt"] = {
        label = 'Burnt BBQ (E)',
        weight = 50,
        consume = 0,
    },
    ["bzzz_food_grill_bbq_f_burnt"] = {
        label = 'Burnt BBQ (F)',
        weight = 50,
        consume = 0,
    },
    ["bzzz_food_grill_bbq_g_burnt"] = {
        label = 'Burnt BBQ (G)',
        weight = 50,
        consume = 0,
    },
    ["bzzz_food_grill_baguette_burnt_a"] = {
        label = 'Burnt Baguette (A)',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_baguette_burnt_b"] = {
        label = 'Burnt Baguette (B)',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_baguette_burnt_c"] = {
        label = 'Burnt Baguette (C)',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_burger_burnt_a"] = {
        label = 'Burnt Burger (A)',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_burger_burnt_b"] = {
        label = 'Burnt Burger (B)',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_burger_burnt_c"] = {
        label = 'Burnt Burger (C)',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_burger_burnt_d"] = {
        label = 'Burnt Burger (D)',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_camembert_burnt_a"] = {
        label = 'Burnt Camembert',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_chicken_burnt_a"] = {
        label = 'Burnt Chicken (A)',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_chicken_burnt_b"] = {
        label = 'Burnt Chicken (B)',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_chicken_burnt_c"] = {
        label = 'Burnt Chicken (C)',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_chicken_burnt_d"] = {
        label = 'Burnt Chicken (D)',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_corn_burnt_a"] = {
        label = 'Burnt Corn',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_fish_burnt_a"] = {
        label = 'Burnt Fish',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_halloumi_burnt_a"] = {
        label = 'Burnt Halloumi',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_mushrooms_burnt_a"] = {
        label = 'Burnt Mushrooms',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_naan_burnt_a"] = {
        label = 'Burnt Naan',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_pineapple_burnt_a"] = {
        label = 'Burnt Pineapple',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_potato_burnt_a"] = {
        label = 'Burnt Potato',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_ribs_burnt_a"] = {
        label = 'Burnt Ribs (A)',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_ribs_burnt_b"] = {
        label = 'Burnt Ribs (B)',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_salmon_burnt_a"] = {
        label = 'Burnt Salmon',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_sausage_burnt_a"] = {
        label = 'Burnt Sausage',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_skewer_burnt_a"] = {
        label = 'Burnt Skewer',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_steak_burnt_a"] = {
        label = 'Burnt Steak (A)',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_steak_burnt_b"] = {
        label = 'Burnt Steak (B)',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_steak_burnt_c"] = {
        label = 'Burnt Steak (C)',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_steak_burnt_d"] = {
        label = 'Burnt Steak (D)',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_tofu_burnt_a"] = {
        label = 'Burnt Tofu',
        weight = 30,
        consume = 0,
    },
    ["bzzz_food_grill_zucchini_burnt_a"] = {
        label = 'Burnt Zucchini',
        weight = 30,
        consume = 0,
    },
    ["prop_food_meat_burnt"] = {
        label = 'Burnt Meat',
        weight = 30,
        consume = 0,
    },
    ['boombox'] = {
        label = 'Boombox',
        weight = 3000,
        stack = false,
        consume = 0,
        server = {
            export = 'js5m_boombox.UseBoomBox',
        },
    },
    ['binoculars'] = {
        label = 'Binoculars',
        weight = 1000,
        stack = false,
        consume = 0,
        client = {
            export = 'js5m_misc.UseBinoculars',
        },
    },
}
