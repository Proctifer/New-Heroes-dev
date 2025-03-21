



do 
	local quest = helper.QuestDefinition();
	quest.id = 'TavernNew'
	quest.visual = "Tavern"
	quest.kindFlag = "Recruit"
	quest.startRevealed = true
	quest.tags = {"RECRUIT","NARRATIVE","FIXED","EASY","TERRAIN_PLAINS"}
	quest.encounters = {}


		local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        
								
								
								
                                
						    	
						    	
								
						    	
						    	
						    	
						    	
								
								
								
								
								
								
						        
								
						        {
						            type = DialogType.Dialog,
						            id = "start",
						            narrator = || __N(1, "The Prancing Tony"),
						            text = || __D(2, "The tavern is busy, as always. A place for locals to forget the hardships of life and enjoy some time together.##The bartender looks at us and asks: \"How can I help ya, fellas?\""),
						    		icon = || "Asst_TavernNew",
						    		condition = || (cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") != "enter") and (cinematicMapHelper.Guild().context.GetInt("linked.hasMerchant") == 0),
						    		who = || "mapCinematicId",
						            children = {
						            	{
		                                    type = DialogType.Custom,
		                                    subtype = "loot",
		                                    amount = || 30,
		                                    text = || __R(3, "Rest."),
		                                    children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(4, "A decent meal and a warm bed was just what we needed!##We recovered some health."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.Rest,
										    				onChoose = function(d,n)
												            	cinematicMapHelper.Guild().context.SetInt("linked.villagerMorality", (cinematicMapHelper.Guild().context.GetInt("linked.villagerMorality") +1))
												            	print (cinematicMapHelper.Guild().context.GetInt("linked.villagerMorality"))
												            end,
										    				rewardsParams = || {},
												    		jumpTo = "return"
														}
										        	}
												}
									        }
		                                },
		                                {
		                                    type = DialogType.Response,
		                                    condition = || cinematicMapHelper.CurrentQuestStatus().context.GetInt("recruited") != 1,
		                                    text = || __R(5, "Ask for recruits."),
		                                    onEnter = function (d,n)
		                                    	local heroesAvailable = {}

		                                    	if( cinematicMapHelper.HeroByTag("Knight") == nil ) then
			                                    	table.insert(heroesAvailable, "Knight")
			                               		end
												if( cinematicMapHelper.HeroByTag("Ranger") == nil ) then
		                                    		table.insert(heroesAvailable, "Ranger")
		                                    	end
												if( cinematicMapHelper.HeroByTag("Wizard") == nil ) then
		                                    		table.insert(heroesAvailable, "Mage")
		                                    	end
												if( cinematicMapHelper.HeroByTag("Barbarian") == nil ) then
		                                    		table.insert(heroesAvailable, "Barbarian")
		                                    	end
												if( cinematicMapHelper.HeroByTag("Bombardier") == nil ) then
		                                    		table.insert(heroesAvailable, "Bombardier")
		                                    	end
												if( cinematicMapHelper.HeroByTag("DarkKnight") == nil ) then
		                                    		table.insert(heroesAvailable, "DarkKnight")
		                                    	end
		                                    	if( cinematicMapHelper.HeroByTag("WitchDoctor") == nil ) then
		                                    		table.insert(heroesAvailable, "WitchDoctor")
		                                    	end
		                                    	if( cinematicMapHelper.HeroByTag("Sasquatch") == nil ) then
		                                    		table.insert(heroesAvailable, "Sasquatch")
		                                    	end
		                                    	if( cinematicMapHelper.HeroByTag("Tesla") == nil ) then
		                                    		table.insert(heroesAvailable, "Zapper")
		                                    	end
		                                    	if( cinematicMapHelper.HeroByTag("OrcCleaver") == nil ) then
		                                    		table.insert(heroesAvailable, "OrcCleaver")
		                                    	end
		                                    	if( cinematicMapHelper.HeroByTag("Sorceress") == nil ) then
		                                    		table.insert(heroesAvailable, "Sorceress")
		                                    	end
		                                    	if( cinematicMapHelper.HeroByTag("SylvanElf") == nil ) then
		                                    		table.insert(heroesAvailable, "sylvanElf")
		                                    	end
												if( cinematicMapHelper.HeroByTag("Enchantress") == nil ) then
		                                    		table.insert(heroesAvailable, "Enchantress")
		                                    	end
												if( cinematicMapHelper.HeroByTag("Necromancer") == nil ) then
		                                    		table.insert(heroesAvailable, "Necromancer")
		                                    	end
												if( cinematicMapHelper.HeroByTag("Cleric") == nil ) then
		                                    		table.insert(heroesAvailable, "Cleric")
		                                    	end

		                                    	d.data.options = cinematicMapHelper.RandomItemN(heroesAvailable, 3)	
		                                    end,
		                                    children = {
												{
													type = DialogType.Dialog,
													id = "recruits",
			                                    	text = || __D(6, "\"Sure, take your pick.\nAll the dangers looming around the place got these aspiring adventurers all riled up,\"\n\nsaid the bartender, pointing toward a few travelers."),
										    		who = || "mapCinematicId",
										    		children = {
														{
															type = DialogType.Response,
															text = || __R(7, "Talk to the knight."),
															condition = |d| cinematicMapHelper.InList(d.data.options, "Knight"),
												    		who = || "mapCinematicId",
												    		children ={
												    			{
																	type = DialogType.Dialog,
																	text = || __D(8, "\"I got a keen sword, a sturdy shield, and the muscles to carry them.\n\nIf you want fancy introductions, go find yourself a mage,\"\n\nsaid the knight as she sharpened her sword."),
														    		who = || "mapCinematicId",
														    		children = {
														    			{
																			type = DialogType.Response,
																			text = || __R(9, "Recruit her."),
																			
																			onChoose = function(d,n)
																            	cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitKnight")
																            end,
																			exit = true
																		},
																		{
																			type = DialogType.Response,
																			text = || __R(10, "Look for other recruits."),
																			jumpTo = "recruits"
																		}
														    		}
																}
												    		}
														},
														{
															type = DialogType.Response,
															text = || __R(11, "Talk to the ranger."),
															condition = |d| cinematicMapHelper.InList(d.data.options, "Ranger"),
												    		who = || "mapCinematicId",
												    		children ={
												    			{
																	type = DialogType.Dialog,
																	text = || __D(12, "\"If you're looking for an experienced woodsman with a deadly bow, look no further, I'm your guy!\"\n\nsaid the ranger, before hitting the bullseye with one of the tavern's darts."),
														    		who = || "mapCinematicId",
														    		children = {
														    			{
																			type = DialogType.Response,
																			text = || __R(13, "Recruit him."),
																			
																			onChoose = function(d,n)
																            	cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitRanger")
																            end,
																			exit = true
																		},
																		{
																			type = DialogType.Response,
																			text = || __R(14, "Look for other recruits."),
																			jumpTo = "recruits"
																		}
														    		}
																}
												    		}
														},
														{
															type = DialogType.Response,
															text = || __R(15, "Talk to the mage."),
															condition = |d| cinematicMapHelper.InList(d.data.options, "Mage"),
												    		who = || "mapCinematicId",
												    		children ={
												    			{
																	type = DialogType.Dialog,
																	text = || __D(16, "\"I am well versed in the secrets of the Arcane Lore.\nThe mind and all its mysteries are my domain,\"\n\nsaid the mage, lifting his eyes from the large book he was reading."),
														    		who = || "mapCinematicId",
														    		children = {
														    			{
																			type = DialogType.Response,
																			text = || __R(17, "Recruit him."),
																			
																			onChoose = function(d,n)
																            	cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitMage")
																            end,
																			exit = true
																		},
																		{
																			type = DialogType.Response,
																			text = || __R(18, "Look for other recruits."),
																			jumpTo = "recruits"
																		}
														    		}
																}
												    		}
														},
														{
															type = DialogType.Response,
															text = || __R(19, "Talk to the bombardier."),
															condition = |d| cinematicMapHelper.InList(d.data.options, "Bombardier"),
												    		who = || "mapCinematicId",
												    		children ={
												    			{
																	type = DialogType.Dialog,
																	text = || __D(20, "\"Oi, need some exploding done?\nTake me with ya and I'll blast the lights out of your enemies,\"\n\nsaid the dwarf bombardier, kissing the barrel of her Dwarvenfaust rifle."),
														    		who = || "mapCinematicId",
														    		children = {
														    			{
																			type = DialogType.Response,
																			text = || __R(21, "Recruit her."),
																			
																			onChoose = function(d,n)
																            	cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitBombardier")
																            end,
																			exit = true
																		},
																		{
																			type = DialogType.Response,
																			text = || __R(22, "Look for other recruits."),
																			jumpTo = "recruits"
																		}
														    		}
																}
												    		}
														},
														{
															type = DialogType.Response,
															text = || __R(23, "Talk to the barbarian."),
															condition = |d| cinematicMapHelper.InList(d.data.options, "Barbarian"),
												    		who = || "mapCinematicId",
												    		children ={
												    			{
																	type = DialogType.Dialog,
																	text = || __D(24, "\"The wilds give me strength of ox and legs of quick snow leopard.\nPoint me at enemy and no more enemy,\"\n\nsaid the barbarian, flexing his muscles."),
														    		who = || "mapCinematicId",
														    		children = {
														    			{
																			type = DialogType.Response,
																			text = || __R(25, "Recruit him."),
																			
																			onChoose = function(d,n)
																            	cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitBarbarian")
																            end,
																			exit = true
																		},
																		{
																			type = DialogType.Response,
																			text = || __R(26, "Look for other recruits."),
																			jumpTo = "recruits"
																		}
														    		}
																}
												    		}
														},
														{
															type = DialogType.Response,
															text = || __R(27, "Talk to the Dark Knight."),
															condition = |d| cinematicMapHelper.InList(d.data.options, "DarkKnight"),
												    		who = || "mapCinematicId",
												    		children ={
												    			{
																	type = DialogType.Dialog,
																	text = || __D(28, "\"...\"\n\nThe heavily armored Dark Knight looked at us without saying a word, before standing up, ready to leave. "),
														    		who = || "mapCinematicId",
														    		children = {
														    			{
																			type = DialogType.Response,
																			text = || __R(29, "Recruit him."),
																			
																			onChoose = function(d,n)
																            	cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitDarkKnight")
																            end,
																			exit = true
																		},
																		{
																			type = DialogType.Response,
																			text = || __R(30, "Look for other recruits."),
																			jumpTo = "recruits"
																		}
														    		}
																}
												    		}
														},
														{
															type = DialogType.Response,
															text = || __R(31, "Talk to the witch doctor."),
															condition = |d| cinematicMapHelper.InList(d.data.options, "WitchDoctor"),
												    		who = || "mapCinematicId",
												    		children ={
												    			{
																	type = DialogType.Dialog,
																	text = || __D(32, "\"Spirits say I come with you. Great things are planned for us,\"\n\nthe scrawny goblin doctor said eagerly, getting ready to join our adventure."),
														    		who = || "mapCinematicId",
														    		children = {
														    			{
																			type = DialogType.Response,
																			text = || __R(33, "Recruit him."),
																			
																			onChoose = function(d,n)
																            	cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitWitchDoctor")
																            end,
																			exit = true
																		},
																		{
																			type = DialogType.Response,
																			text = || __R(34, "Look for other recruits."),
																			jumpTo = "recruits"
																		}
														    		}
																}
												    		}
														},
														{
															type = DialogType.Response,
															text = || __R(35, "Talk to the sasquatch."),
															condition = |d| cinematicMapHelper.InList(d.data.options, "Sasquatch"),
												    		who = || "mapCinematicId",
												    		children ={
												    			{
																	type = DialogType.Dialog,
																	text = || __D(36, "\"Oh, I believe in you guys! Sure, I'll join your party,\"\n\nthe sasquatch said with a huge tusky smile before standing up."),
														    		who = || "mapCinematicId",
														    		children = {
														    			{
																			type = DialogType.Response,
																			text = || __R(37, "Recruit him."),
																			
																			onChoose = function(d,n)
																            	cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitSasquatch")
																            end,
																			exit = true
																		},
																		{
																			type = DialogType.Response,
																			text = || __R(38, "Look for other recruits."),
																			jumpTo = "recruits"
																		}
														    		}
																}
												    		}
														},
														{
															type = DialogType.Response,
															text = || __R(39, "Talk to the zapper."),
															condition = |d| cinematicMapHelper.InList(d.data.options, "Zapper"),
												    		who = || "mapCinematicId",
												    		children ={
												    			{
																	type = DialogType.Dialog,
																	text = || __D(40, "\"I'm shocked it took you so long to offer me a place in your party,\"\n\nthe zapper said with a crazy smile."),
														    		who = || "mapCinematicId",
														    		children = {
														    			{
																			type = DialogType.Response,
																			text = || __R(41, "Recruit him."),
																			
																			onChoose = function(d,n)
																            	cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitZapper")
																            end,
																			exit = true
																		},
																		{
																			type = DialogType.Response,
																			text = || __R(42, "Look for other recruits."),
																			jumpTo = "recruits"
																		}
														    		}
																}
												    		}
														},
														{
															type = DialogType.Response,
															text = || __R(43, "Talk to the orc cleaver."),
															condition = |d| cinematicMapHelper.InList(d.data.options, "OrcCleaver"),
												    		who = || "mapCinematicId",
												    		children ={
												    			{
																	type = DialogType.Dialog,
																	text = || __D(44, "\"So you want me to join you? Keep my plate and pouch full and we won't have any problems,\"\n\nthe huge orc said, getting up and picking up his gear."),
														    		who = || "mapCinematicId",
														    		children = {
														    			{
																			type = DialogType.Response,
																			text = || __R(45, "Recruit him."),
																			
																			onChoose = function(d,n)
																            	cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitOrcCleaver")
																            end,
																			exit = true
																		},
																		{
																			type = DialogType.Response,
																			text = || __R(46, "Look for other recruits."),
																			jumpTo = "recruits"
																		}
														    		}
																}
												    		}
														},
														{
															type = DialogType.Response,
															text = || __R(47, "Talk to the sorceress."),
															condition = |d| cinematicMapHelper.InList(d.data.options, "Sorceress"),
												    		who = || "mapCinematicId",
												    		children ={
												    			{
																	type = DialogType.Dialog,
																	text = || __D(48, "\"Sure I'll come with you, sweeties! There's still some adventuring left in me,\"\n\n said the sorceress with a warm, granny-like smile."),
														    		who = || "mapCinematicId",
														    		children = {
														    			{
																			type = DialogType.Response,
																			text = || __R(49, "Recruit her."),
																			
																			onChoose = function(d,n)
																            	cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitSorceress")
																            end,
																			exit = true
																		},
																		{
																			type = DialogType.Response,
																			text = || __R(50, "Look for other recruits."),
																			jumpTo = "recruits"
																		}
														    		}
																}
												    		}
														},
														{
															type = DialogType.Response,
															text = || __R(51, "Talk to the sylvan elf."),
															condition = |d| cinematicMapHelper.InList(d.data.options, "sylvanElf"),
												    		who = || "mapCinematicId",
												    		children ={
												    			{
																	type = DialogType.Dialog,
																	text = || __D(52, "\"You fellows look like you need a fighter with my expertise. You are lucky; I am available,\"\n\nthe elf said, showing us his spear."),
														    		who = || "mapCinematicId",
														    		children = {
														    			{
																			type = DialogType.Response,
																			text = || __R(53, "Recruit him."),
																			
																			onChoose = function(d,n)
																            	cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitSylvanElf")
																            end,
																			exit = true
																		},
																		{
																			type = DialogType.Response,
																			text = || __R(54, "Look for other recruits."),
																			jumpTo = "recruits"
																		}
														    		}
																}
												    		}
														},
														{
															type = DialogType.Response,
															text = || __R(55, "Talk to the high enchantress."),
															condition = |d| cinematicMapHelper.InList(d.data.options, "Enchantress"),
												    		who = || "mapCinematicId",
												    		children ={
												    			{
																	type = DialogType.Dialog,
																	text = || __D(56, "\"I may not be the elf you're expecting, but I'll gladly join your quest.\"\n\nthe enchantress said with a wicked smile."),
														    		who = || "mapCinematicId",
														    		children = {
														    			{
																			type = DialogType.Response,
																			text = || __R(57, "Recruit her."),
																			
																			onChoose = function(d,n)
																            	cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitEnchantress")
																            end,
																			exit = true
																		},
																		{
																			type = DialogType.Response,
																			text = || __R(58, "Look for other recruits."),
																			jumpTo = "recruits"
																		}
														    		}
																}
												    		}
														},
														{
															type = DialogType.Response,
															text = || __R(59, "Talk to the Necromancer."),
															condition = |d| cinematicMapHelper.InList(d.data.options, "Necromancer"),
												    		who = || "mapCinematicId",
												    		children ={
												    			{
																	type = DialogType.Dialog,
																	text = || __D(60, "\"I'd be delighted to make more corpses for my army. I shall revel in this chaos,\"\n\n the necromancer said, sending a chill down our spines."),
														    		who = || "mapCinematicId",
														    		children = {
														    			{
																			type = DialogType.Response,
																			text = || __R(61, "Recruit them."),
																			
																			onChoose = function(d,n)
																            	cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitNecromancer")
																            end,
																			exit = true
																		},
																		{
																			type = DialogType.Response,
																			text = || __R(62, "Look for other recruits."),
																			jumpTo = "recruits"
																		}
														    		}
																}
												    		}
														},
														{
															type = DialogType.Response,
															text = || __R(63, "Talk to the Cleric."),
															condition = |d| cinematicMapHelper.InList(d.data.options, "Cleric"),
												    		who = || "mapCinematicId",
												    		children ={
												    			{
																	type = DialogType.Dialog,
																	text = || __D(64, "\"Any quest for the world is a quest for me!\" the cleric said, hefting his mace.\n\n\"The road may be long, but I have faith on my side.\""),
														    		who = || "mapCinematicId",
														    		children = {
														    			{
																			type = DialogType.Response,
																			text = || __R(65, "Recruit him."),
																			
																			onChoose = function(d,n)
																            	cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitCleric")
																            end,
																			exit = true
																		},
																		{
																			type = DialogType.Response,
																			text = || __R(66, "Look for other recruits."),
																			jumpTo = "recruits"
																		}
														    		}
																}
												    		}
														},
														{
															type = DialogType.Response,
															text = || __R(66, "Not right now."),
												    		jumpTo = "return"
														}
										        	}
												}
									        }
		                                },
		                                
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(67, "Talk to the patrons."),
										    children = {
												{
													type = DialogType.Dialog,
													condition = |d| cinematicMapHelper.RandomChance(0.3) and not dialogs.HasFlag(d, "gotRumor3"),
													text = || __D(68, "After talking to one of the patrons for a while, he said:##\"I used to be an adventurer like you ...##but then I took an arrow to the knee.\""),
										    		who = || "mapCinematicId",
										    		onChoose = function(d)
									    				dialogs.SetFlag(d, "gotRumor3");
									    			end,
										    		jumpTo = "return"
												},
												
												
												
												
										  
										  
									   
									   
										  
												
												
												
												
												
										  
										  
									   
									   
										  
												
												{
													type = DialogType.Dialog,
													condition = |d| cinematicMapHelper.RandomChance(0.3) and not dialogs.HasFlag(d, "gotRumor7"),
													text = || __D(69, "After talking to one of the patrons for a while, he said:##\"If you want to survive as an adventuring party, it's key to have a diverse set of skills.##Oh! I miss adventuring so!\""),
										    		who = || "mapCinematicId",
										    		onChoose = function(d)
									    				dialogs.SetFlag(d, "gotRumor7");
									    			end,
										    		jumpTo = "return"
												},
												{
													type = DialogType.Dialog,
													condition = |d| cinematicMapHelper.RandomChance(0.3) and not dialogs.HasFlag(d, "gotRumor8"),
													text = || __D(70, "After talking to one of the patrons for a while, he said:##\"I heard there are some adventurers like you scattered round these parts....##Maybe you can convince them to join your party.\""),
										    		who = || "mapCinematicId",
										    		onChoose = function(d)
									    				dialogs.SetFlag(d, "gotRumor8");
									    			end,
										    		jumpTo = "return"
												},
												{
													type = DialogType.Dialog,
													condition = |d| cinematicMapHelper.RandomChance(0.3) and not dialogs.HasFlag(d, "gotRumor9"),
													text = || __D(71, "After talking to one of the patrons for a while, he said:##\"Oh yes! Choosing what gear to carry on an adventure can be a daunting task, but having some tools on you can be a life saver.\""),
										    		who = || "mapCinematicId",
										    		onChoose = function(d)
									    				dialogs.SetFlag(d, "gotRumor9");
									    			end,
										    		jumpTo = "return"
												},
												
												
												
												
										  
										  
									   
									   
										  
												
												{
													type = DialogType.Dialog,
													condition = |d| cinematicMapHelper.RandomChance(0.3) and not dialogs.HasFlag(d, "gotRumor11"),
													text = || __D(72, "After talking to one of the patrons for a while, he said:##\"Yeah, I did one of those tarot readings once.##I ended up finding some treasure on the way home, but my buddy said he got cursed because of it.\""),
										    		who = || "mapCinematicId",
										    		onChoose = function(d)
									    				dialogs.SetFlag(d, "gotRumor11");
									    			end,
										    		jumpTo = "return"
												},
												{
													type = DialogType.Dialog,
													condition = |d| cinematicMapHelper.RandomChance(0.3) and not dialogs.HasFlag(d, "gotRumor12"),
													text = || __D(73, "After talking to one of the patrons for a while, he said:##\"A companion is never gonna give you up.##Never gonna let you down.##Never gonna run around and desert you.\""),
										    		who = || "mapCinematicId",
										    		onChoose = function(d)
									    				dialogs.SetFlag(d, "gotRumor12");
									    			end,
										    		jumpTo = "return"
												},
												{
													type = DialogType.Dialog,
													condition = |d| cinematicMapHelper.RandomChance(0.3) and not dialogs.HasFlag(d, "gotRumor13"),
													text = || __D(74, "After talking to one of the patrons for a while, he said:##\"Fortune is a cruel maiden ...##but she does favor the blessed.\""),
										    		who = || "mapCinematicId",
										    		onChoose = function(d)
									    				dialogs.SetFlag(d, "gotRumor13");
									    			end,
										    		jumpTo = "return"
												},
												{
													type = DialogType.Dialog,
													condition = |d| cinematicMapHelper.RandomChance(0.3) and not dialogs.HasFlag(d, "gotRumor14"),
													text = || __D(75, "After talking to one of the patrons for a while, he said:##\"I got 99 problems ...##but a drink ain't one.\""),
										    		who = || "mapCinematicId",
										    		onChoose = function(d)
									    				dialogs.SetFlag(d, "gotRumor14");
									    			end,
										    		jumpTo = "return"
												},
												
												
												
												
										  
										  
									   
									   
										  
												
												{
													type = DialogType.Dialog,
													condition = |d| cinematicMapHelper.RandomChance(0.3) and not dialogs.HasFlag(d, "gotRumor16"),
													text = || __D(76, "After talking to one of the patrons for a while, he said:##\"Last Easter, I found an egg.##I cracked it open and it was empty.##Just a joke ... I guess.\""),
										    		who = || "mapCinematicId",
										    		onChoose = function(d)
									    				dialogs.SetFlag(d, "gotRumor16");
									    			end,
										    		jumpTo = "return"
												},
												{
													type = DialogType.Dialog,
													condition = |d| cinematicMapHelper.RandomChance(0.3) and not dialogs.HasFlag(d, "gotRumor17"),
													text = || __D(77, "After talking to one of the patrons for a while, he said:##\"Your mother was a hamster, and your father smelt of elderberries!\""),
										    		who = || "mapCinematicId",
										    		onChoose = function(d)
									    				dialogs.SetFlag(d, "gotRumor17");
									    			end,
										    		jumpTo = "return"
												},
												{
													type = DialogType.Dialog,
													condition = |d| cinematicMapHelper.RandomChance(0.3) and not dialogs.HasFlag(d, "gotRumor19"),
													text = || __D(78, "After talking to one of the patrons for a while, he said:##\"Does your party have a name?##Mine was called John and the Fab 7.##Funny thing is, there was no John and we were only 4.\""),
										    		who = || "mapCinematicId",
										    		onChoose = function(d)
									    				dialogs.SetFlag(d, "gotRumor19");
									    			end,
										    		jumpTo = "return"
												},
												{
													type = DialogType.Dialog,
													text = || __D(79, "After talking to one of the patrons for a while, he said:##\"Hmm ... let me think ... ask me again later.\""),
										    		who = || "mapCinematicId",
										    		jumpTo = "return"
												}
									        }
		                                },
		                                
		                                
		                                
		                                
										
										
										
										
										
										
										
										
										
						                
						                
										
										
										
							            
										
										
										
										
										
										
										
										
						                
						                
						                
						                
						                
										
										
										
						                
						                
										
										
										
										
										
										
										
										
										
						                
						                
										
										
										
							            
										
										
										
										
										
										
										
										
						                
						                
						                
						                
						                
										
										
										
						                
						                
										
										
										
										
										
										
									    
									    
										
										
									    
		                                
						            	
		                                
		                                
		                                
		                                
		                                
		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(80, "Leave."),
		                                    onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "leave"),
		                                    exit = true
		                                },
						        	}
						        },

						        {
						            type = DialogType.Dialog,
						            id = "return",
						            narrator = || __N(81, "The Prancing Tony"),
						            text = || __D(82, "\"It sure is nice to get a chance to lay back and rest from adventuring, am I right, fellas?\"\n\nthe bartender says with a welcoming smile."),
						    		icon = || "Asst_TavernNew",
						    		who = || "mapCinematicId",
						    		inheritFrom = "start"
						    	}
						    })

	quest.results = {
		Rest = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = -30 },
			{type="applyModifier", category="energyMod", level = 1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			
			{type="doHeal", amount = 3, targets = cinematicMapHelper.Party()},
			}),
		Rumors = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = -20 },
			}),
		recruitKnight = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = -50 },
			}),
		recruitRanger = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = -50 },
			}),
		recruitMage = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = -50 },
			}),
		recruitBarbarian = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = -100 },
			}),
		recruitBombardier = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = -100 },
			}),
		recruitDarkKnight = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = -100 },
			}),
		reward = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = 100 },
			{type="giveXP", amount = config.rewards.starXp.low()},
			}),
	}

	function checkRecruited(recruited)
		print("RECRUITED: " .. tostring(recruited))
		if recruited then
			cinematicMapHelper.CurrentQuestStatus().context.SetInt("recruited", 1)
		end
	end



	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.Instant(function ()
										cinematicMapHelper.CurrentQuestStatus().temporal.storeContent = cinematicMapHelper.StoreContentFromLootTable({
											
												{type = "oneOf", quantity = || 4, items = {
													{type = "item", id = "healthPotion", quantity = || 3, slot = 2},
													{type = "item", id = "tent", quantity = || 1, slot = 1},
													{type = "item", id = "rope", quantity = || 1, slot = 1},
													{type = "item", id = "torch", quantity = || 1, slot = 1},
													{type = "item", id = "pick", quantity = || 1, slot = 1},
													{type = "item", id = "crowbar", quantity = || 1, slot = 1},
													{type = "item", id = "elixirOfLife", quantity = || 1, slot = 1},
												}}

											})
									end),
									cinematicMapHelper.While(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") != "leave", 
									cinematicMapHelper.Sequence({
										cinematicMapHelper.ShowDialogInstance(theDialog),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "enter",
											cinematicMapHelper.ShowStore(|| cinematicMapHelper.CurrentQuestStatus().temporal.storeContent)
										),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitKnight", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionFemaleKnight"}, checkRecruited
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitRanger", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionRanger"}, checkRecruited
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitMage", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionArcaneMage"}, checkRecruited
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitBarbarian", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionBarbarian"}, checkRecruited
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitBombardier", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionDwarfBombardier"}, checkRecruited
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitDarkKnight", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionDarkKnight"}, checkRecruited
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitWitchDoctor", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionWitchDoctor"}, checkRecruited
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitSasquatch", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionSasquatch"}, checkRecruited
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitZapper", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionTesla"}, checkRecruited
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitOrcCleaver", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionOrcCleaver"}, checkRecruited
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitSorceress", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionSorceress"}, checkRecruited
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitSylvanElf", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionSylvanElf"}, checkRecruited
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitEnchantress", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionEnchantress"}, checkRecruited
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitNecromancer", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionNecromancer"}, checkRecruited
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitCleric", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionCleric"}, checkRecruited
																				)
																				}
																			))
										
									})
									),
									cinematicMapHelper.Instant(|| cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", nil))
								}))

	quest.shouldRun = || true
	quest.canReenter = || true

	quest.revealDistance = 3
	quest.consumesDay = || not cinematicMapHelper.IsReenter()

	helper.AddQuest(quest)
end
