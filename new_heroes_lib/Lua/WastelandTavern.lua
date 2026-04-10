

do 
	local quest = helper.QuestDefinition();
	quest.id = 'WastelandTavern'
	quest.visual = "Tavern"
	quest.kindFlag = "Recruit"
	quest.encounters = {}
	quest.startRevealed = true
	quest.tags = {"RECRUIT","NARRATIVE","FIXED","TERRAIN_WASTELAND"}


	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						        	type = DialogType.Dialog,
						        	condition = || cinematicMapHelper.CurrentQuestStatus().context.GetInt("liberated") == 1,
						            narrator = || __N(1, "The Dark Rendezvous"),
						            text = || __D(2, "The bartender sighs as we step into the tavern.\n\n\"You all really like to test your luck coming here, huh? Make it quick. My clients are getting annoyed already.\""),
						            who = || "mapCinematicId",
						    		icon = || "Asst_TavernNew",
						    		inheritFrom = "start"
						        },

						        {
						            type = DialogType.Dialog,
						            condition = || cinematicMapHelper.CurrentQuestStatus().context.GetInt("liberated") != 1,
						            narrator = || __N(3, "The Dark Rendezvous"),
						            text = || __D(4, "We spot a decrepit tavern at the foot of a mountain and decide to get closer. Once there, three rugged bandits stand in our way.\n\n\"Looking for trouble, chum? No heroes allowed here,\" says one of them."),
						            who = || "mapCinematicId",
						    		icon = || "Asst_TavernNew",
						    		children = {
						    			{
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(5, "Convince them to move away."),
						    				challenge = {
						    					requirements =  |t| t("ct_social")
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(6, "We spoke firmly about the importance of our mission and said we were just looking for a place to rest.\n\nThey reluctantly moved aside to let us in."), 
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.socialSuccess,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
															children = {
																{
														            type = DialogType.Dialog,
														            id = "start",
														            text = || __D(7, "The boisterous tavern becomes silent the moment we put a foot inside, as a couple of unfriendly faces turn our way.\n\nThe bartender makes a hand gesture and everyone returns to their business.||\"Bold of you to come to this place ... but my men tell me you're after those pesky cultists, am I right? You can stay, but you'll regret it if you cause any trouble here,\" he says."),
														    		condition = || (cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") != "enter") and (cinematicMapHelper.Guild().context.GetInt("linked.hasMerchant") == 0),
														    		 onChoose = function(d,n)
														            	cinematicMapHelper.CurrentQuestStatus().context.SetInt("liberated", 1)
														            end,
														    		who = || "mapCinematicId",
														            children = {
														            	{
										                                    type = DialogType.Custom,
										                                    subtype = "loot",
										                                    amount = || 30,
										                                    text = || __R(8, "Rest."),
										                                    children = {
																				{
																					type = DialogType.Dialog,
											                                    	text = || __D(9, "The place was quite dirty and the food was mediocre, but it was enough to restore some of our strength."),
																		    		who = || "mapCinematicId",
																		    		children = {
																						{
																		    				type = DialogType.Custom,
																		    				subtype = "rewards",
																		    				rewards = || quest.results.Rest,
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
										                                    text = || __R(10, "Ask for recruits."),
										                                    onEnter = function (d,n)
										                                    	local heroesAvailable = {}
																				-- Searches the party for specific heroes by looking for their specific tag, NOT their uniqueID!
																				-- Character tags are listed in "cinematicTags" in their RLHeroes file.
																				-- If the tag is NOT in the party, it inserts the hero into a list of available companions
										                                    	if( cinematicMapHelper.HeroByTag("Knight") == nil ) then
											                                    	table.insert(heroesAvailable, "Knight")
											                               		end
																				if( cinematicMapHelper.HeroByTag("Ranger") == nil ) then
										                                    		table.insert(heroesAvailable, "Ranger")
										                                    	end
																				if( cinematicMapHelper.HeroByTag("Wizard") == nil ) then -- "Wizard" is Arcane Wizard's character-specific tag
										                                    		table.insert(heroesAvailable, "Mage") -- "Mage" is an arbitrary name, which is how he is inserted into the table
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
																				if( cinematicMapHelper.HeroByTag("Enchantress") == nil) then
																					table.insert(heroesAvailable, "Enchantress")
																				end
																				if( cinematicMapHelper.HeroByTag("Necromancer") == nil) then
																					table.insert(heroesAvailable, "Necromancer")
																				end
																				if( cinematicMapHelper.HeroByTag("Cleric") == nil) then
																					table.insert(heroesAvailable, "Cleric")
																				end
																				if( cinematicMapHelper.HeroByTag("Musketeer") == nil) then
																					table.insert(heroesAvailable, "Musketeer")
																				end
																				if( cinematicMapHelper.HeroByTag("Assassin") == nil) then
																					table.insert(heroesAvailable, "Assassin")
																				end

										                                    	d.data.options = cinematicMapHelper.RandomItemN(heroesAvailable, 3)	-- randomly picks three heroes from the list for selection
										                                    end,
										                                    children = {
																				{
																					type = DialogType.Dialog,
																					id = "recruits",
											                                    	text = || __D(11, "\"Sure, take your pick.\nAll the cultists looming around the place got these aspiring adventurers all riled up,\"\n\nsaid the bartender, pointing toward a few travelers."),
																		    		who = || "mapCinematicId",
																		    		children = {
																						{
																							type = DialogType.Response,
																							text = || __R(12, "Talk to the knight."),
																							condition = |d| cinematicMapHelper.InList(d.data.options, "Knight"),
																				    		who = || "mapCinematicId",
																				    		children ={
																				    			{
																									type = DialogType.Dialog,
																									text = || __D(13, "\"I got a keen sword, a sturdy shield, and the muscles to carry them.\n\nIf you want fancy introductions, go find yourself a mage,\"\n\nsaid the knight as she sharpened her sword."),
																						    		who = || "mapCinematicId",
																						    		children = {
																						    			{
																											type = DialogType.Response,
																											text = || __R(14, "Recruit her."),
																											
																											onChoose = function(d,n) 
																								            	cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitKnight")
																								            end,
																											exit = true
																										},
																										{
																											type = DialogType.Response,
																											text = || __R(15, "Look for other recruits."),
																											jumpTo = "recruits"
																										}
																						    		}
																								}
																				    		}
																						},
																						{
																							type = DialogType.Response,
																							text = || __R(16, "Talk to the ranger."),
																							condition = |d| cinematicMapHelper.InList(d.data.options, "Ranger"),
																				    		who = || "mapCinematicId",
																				    		children ={
																				    			{
																									type = DialogType.Dialog,
																									text = || __D(17, "\"If you're looking for an experienced woodsman with a deadly bow, look no further, I'm your guy!\"\n\nsaid the ranger, before hitting the bullseye with one of the tavern's darts."),
																						    		who = || "mapCinematicId",
																						    		children = {
																						    			{
																											type = DialogType.Response,
																											text = || __R(18, "Recruit him."),
																											
																											onChoose = function(d,n)
																								            	cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitRanger")
																								            end,
																											exit = true
																										},
																										{
																											type = DialogType.Response,
																											text = || __R(19, "Look for other recruits."),
																											jumpTo = "recruits"
																										}
																						    		}
																								}
																				    		}
																						},
																						{
																							type = DialogType.Response,
																							text = || __R(20, "Talk to the mage."),
																							condition = |d| cinematicMapHelper.InList(d.data.options, "Mage"), -- Checks if "Mage" is in the randomized list of options
																				    		who = || "mapCinematicId",
																				    		children ={
																				    			{
																									type = DialogType.Dialog,
																									text = || __D(21, "\"I am well versed in the secrets of the Arcane Lore.\nThe mind and all its mysteries are my domain,\"\n\nsaid the mage, lifting his eyes from the large book he was reading."),
																						    		who = || "mapCinematicId",
																						    		children = {
																						    			{
																											type = DialogType.Response,
																											text = || __R(22, "Recruit him."),
																											
																											onChoose = function(d,n)
																												-- Sets the status to "recruitMage", which indicates that you want to recruit the Arcane Wizard
																												-- This status is used later in the document to put the Arcane Wizard in your party
																								            	cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitMage")
																								            end,
																											exit = true -- exits because you chose to recruit this character
																										},
																										{
																											type = DialogType.Response,
																											text = || __R(23, "Look for other recruits."),
																											jumpTo = "recruits"
																										}
																						    		}
																								}
																				    		}
																						},
																						{
																							type = DialogType.Response,
																							text = || __R(24, "Talk to the bombardier."),
																							condition = |d| cinematicMapHelper.InList(d.data.options, "Bombardier"),
																				    		who = || "mapCinematicId",
																				    		children ={
																				    			{
																									type = DialogType.Dialog,
																									text = || __D(25, "\"Oi, need some exploding done?\nTake me with ya and I'll blast the lights out of your enemies,\"\n\nsaid the dwarf bombardier, kissing the barrel of her Dwarvenfaust rifle."),
																						    		who = || "mapCinematicId",
																						    		children = {
																						    			{
																											type = DialogType.Response,
																											text = || __R(26, "Recruit her."),
																											
																											onChoose = function(d,n)
																								            	cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitBombardier")
																								            end,
																											exit = true
																										},
																										{
																											type = DialogType.Response,
																											text = || __R(27, "Look for other recruits."),
																											jumpTo = "recruits"
																										}
																						    		}
																								}
																				    		}
																						},
																						{
																							type = DialogType.Response,
																							text = || __R(28, "Talk to the barbarian."),
																							condition = |d| cinematicMapHelper.InList(d.data.options, "Barbarian"),
																				    		who = || "mapCinematicId",
																				    		children ={
																				    			{
																									type = DialogType.Dialog,
																									text = || __D(29, "\"The wilds give me strength of ox and legs of quick snow leopard.\nPoint me at enemy and no more enemy,\"\n\nsaid the barbarian, flexing his muscles."),
																						    		who = || "mapCinematicId",
																						    		children = {
																						    			{
																											type = DialogType.Response,
																											text = || __R(30, "Recruit him."),
																											
																											onChoose = function(d,n)
																								            	cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitBarbarian")
																								            end,
																											exit = true
																										},
																										{
																											type = DialogType.Response,
																											text = || __R(31, "Look for other recruits."),
																											jumpTo = "recruits"
																										}
																						    		}
																								}
																				    		}
																						},
																						{
																							type = DialogType.Response,
																							text = || __R(32, "Talk to the Dark Knight."),
																							condition = |d| cinematicMapHelper.InList(d.data.options, "DarkKnight"),
																				    		who = || "mapCinematicId",
																				    		children ={
																				    			{
																									type = DialogType.Dialog,
																									text = || __D(33, "\"...\"\n\nThe heavily armored Dark Knight looked at us without saying a word, before standing up, ready to leave. "),
																						    		who = || "mapCinematicId",
																						    		children = {
																						    			{
																											type = DialogType.Response,
																											text = || __R(34, "Recruit him."),
																											
																											onChoose = function(d,n)
																								            	cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitDarkKnight")
																								            end,
																											exit = true
																										},
																										{
																											type = DialogType.Response,
																											text = || __R(35, "Look for other recruits."),
																											jumpTo = "recruits"
																										}
																						    		}
																								}
																				    		}
																						},
																						{
																							type = DialogType.Response,
																							text = || __R(36, "Talk to the witch doctor."),
																							condition = |d| cinematicMapHelper.InList(d.data.options, "WitchDoctor"),
																				    		who = || "mapCinematicId",
																				    		children ={
																				    			{
																									type = DialogType.Dialog,
																									text = || __D(37, "\"Spirits say I come with you. Great things are planned for us,\"\n\nthe scrawny goblin doctor said eagerly, getting ready to join our adventure."),
																						    		who = || "mapCinematicId",
																						    		children = {
																						    			{
																											type = DialogType.Response,
																											text = || __R(38, "Recruit him."),
																											
																											onChoose = function(d,n)
																								            	cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitWitchDoctor")
																								            end,
																											exit = true
																										},
																										{
																											type = DialogType.Response,
																											text = || __R(39, "Look for other recruits."),
																											jumpTo = "recruits"
																										}
																						    		}
																								}
																				    		}
																						},
																						{
																							type = DialogType.Response,
																							text = || __R(40, "Talk to the sasquatch."),
																							condition = |d| cinematicMapHelper.InList(d.data.options, "Sasquatch"),
																				    		who = || "mapCinematicId",
																				    		children ={
																				    			{
																									type = DialogType.Dialog,
																									text = || __D(41, "\"Oh, I believe in you guys! Sure, I'll join your party,\"\n\nthe sasquatch said with a huge tusky smile before standing up."),
																						    		who = || "mapCinematicId",
																						    		children = {
																						    			{
																											type = DialogType.Response,
																											text = || __R(42, "Recruit him."),
																											
																											onChoose = function(d,n)
																								            	cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitSasquatch")
																								            end,
																											exit = true
																										},
																										{
																											type = DialogType.Response,
																											text = || __R(43, "Look for other recruits."),
																											jumpTo = "recruits"
																										}
																						    		}
																								}
																				    		}
																						},
																						{
																							type = DialogType.Response,
																							text = || __R(44, "Talk to the zapper."),
																							condition = |d| cinematicMapHelper.InList(d.data.options, "Zapper"),
																				    		who = || "mapCinematicId",
																				    		children ={
																				    			{
																									type = DialogType.Dialog,
																									text = || __D(45, "\"I'm shocked it took you so long to offer me a place in your party,\"\n\nthe zapper said with a crazy smile."),
																						    		who = || "mapCinematicId",
																						    		children = {
																						    			{
																											type = DialogType.Response,
																											text = || __R(46, "Recruit him."),
																											
																											onChoose = function(d,n)
																								            	cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitZapper")
																								            end,
																											exit = true
																										},
																										{
																											type = DialogType.Response,
																											text = || __R(47, "Look for other recruits."),
																											jumpTo = "recruits"
																										}
																						    		}
																								}
																				    		}
																						},
																						{
																							type = DialogType.Response,
																							text = || __R(48, "Talk to the orc cleaver."),
																							condition = |d| cinematicMapHelper.InList(d.data.options, "OrcCleaver"),
																				    		who = || "mapCinematicId",
																				    		children ={
																				    			{
																									type = DialogType.Dialog,
																									text = || __D(49, "\"So you want me to join you? Keep my plate and pouch full and we won't have any problems,\"\n\nthe huge orc said, getting up and picking up his gear."),
																						    		who = || "mapCinematicId",
																						    		children = {
																						    			{
																											type = DialogType.Response,
																											text = || __R(50, "Recruit him."),
																											
																											onChoose = function(d,n)
																								            	cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitOrcCleaver")
																								            end,
																											exit = true
																										},
																										{
																											type = DialogType.Response,
																											text = || __R(51, "Look for other recruits."),
																											jumpTo = "recruits"
																										}
																						    		}
																								}
																				    		}
																						},
																						{
																							type = DialogType.Response,
																							text = || __R(52, "Talk to the sorceress."),
																							condition = |d| cinematicMapHelper.InList(d.data.options, "Sorceress"),
																				    		who = || "mapCinematicId",
																				    		children ={
																				    			{
																									type = DialogType.Dialog,
																									text = || __D(53, "\"Sure I'll come with you, sweeties! There's still some adventuring left in me,\"\n\nsaid the sorceress with a warm, granny-like smile."),
																						    		who = || "mapCinematicId",
																						    		children = {
																						    			{
																											type = DialogType.Response,
																											text = || __R(54, "Recruit her."),
																											
																											onChoose = function(d,n)
																								            	cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitSorceress")
																								            end,
																											exit = true
																										},
																										{
																											type = DialogType.Response,
																											text = || __R(55, "Look for other recruits."),
																											jumpTo = "recruits"
																										}
																						    		}
																								}
																				    		}
																						},
																						{
																							type = DialogType.Response,
																							text = || __R(67, "Talk to the sylvan elf."),
																							condition = |d| cinematicMapHelper.InList(d.data.options, "sylvanElf"),
																				    		who = || "mapCinematicId",
																				    		children ={
																				    			{
																									type = DialogType.Dialog,
																									text = || __D(68, "\"You fellows look like you need a fighter with my expertise. You are lucky; I am available,\"\n\nthe elf said, showing us his spear."),
																						    		who = || "mapCinematicId",
																						    		children = {
																						    			{
																											type = DialogType.Response,
																											text = || __R(69, "Recruit him."),
																											
																											onChoose = function(d,n)
																								            	cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitSylvanElf")
																								            end,
																											exit = true
																										},
																										{
																											type = DialogType.Response,
																											text = || __R(70, "Look for other recruits."),
																											jumpTo = "recruits"
																										}
																						    		}
																								}
																				    		}
																						},
																						{
																							type = DialogType.Response,
																							text = || __R(71, "Talk to the high enchantress."),
																							condition = |d| cinematicMapHelper.InList(d.data.options, "Enchantress"),
																				    		who = || "mapCinematicId",
																				    		children ={
																				    			{
																									type = DialogType.Dialog,
																									text = || __D(72, "\"I'm here to right my people's wrongs. Let me help you,\"\n\nthe enchantress grinned wide, displaying her long fangs."),
																						    		who = || "mapCinematicId",
																						    		children = {
																						    			{
																											type = DialogType.Response,
																											text = || __R(73, "Recruit her."),
																											
																											onChoose = function(d,n)
																								            	cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitEnchantress")
																								            end,
																											exit = true
																										},
																										{
																											type = DialogType.Response,
																											text = || __R(74, "Look for other recruits."),
																											jumpTo = "recruits"
																										}
																						    		}
																								}
																				    		}
																						},
																						{
																							type = DialogType.Response,
																							text = || __R(75, "Talk to the Necromancer."),
																							condition = |d| cinematicMapHelper.InList(d.data.options, "Necromancer"),
																				    		who = || "mapCinematicId",
																				    		children ={
																				    			{
																									type = DialogType.Dialog,
																									text = || __D(76, "\"Don't be afraid,\"\n\nthe Necromancer said.\n\n\"My army marches alongside you this day.\""),
																						    		who = || "mapCinematicId",
																						    		children = {
																						    			{
																											type = DialogType.Response,
																											text = || __R(77, "Recruit them."),
																											
																											onChoose = function(d,n)
																								            	cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitNecromancer")
																								            end,
																											exit = true
																										},
																										{
																											type = DialogType.Response,
																											text = || __R(78, "Look for other recruits."),
																											jumpTo = "recruits"
																										}
																						    		}
																								}
																				    		}
																						},
																						{
																							type = DialogType.Response,
																							text = || __R(79, "Talk to the Cleric."),
																							condition = |d| cinematicMapHelper.InList(d.data.options, "Cleric"),
																				    		who = || "mapCinematicId",
																				    		children ={
																				    			{
																									type = DialogType.Dialog,
																									text = || __D(80, "\"Looking for an ally, friends?\"\n\nThe Cleric patted us firmly on our backs with a grin."),
																						    		who = || "mapCinematicId",
																						    		children = {
																						    			{
																											type = DialogType.Response,
																											text = || __R(81, "Recruit him."),
																											
																											onChoose = function(d,n)
																								            	cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitCleric")
																								            end,
																											exit = true
																										},
																										{
																											type = DialogType.Response,
																											text = || __R(82, "Look for other recruits."),
																											jumpTo = "recruits"
																										}
																						    		}
																								}
																				    		}
																						},
																						{
																							type = DialogType.Response,
																							text = || __R(83, "Talk to the Musketeer."),
																							condition = |d| cinematicMapHelper.InList(d.data.options, "Musketeer"),
																				    		who = || "mapCinematicId",
																				    		children ={
																				    			{
																									type = DialogType.Dialog,
																									text = || __D(84, "\"If you're looking for a crackshot, you've come to the right place!\"\n\nThe Musketeer said as he twirled his mustache."),
																						    		who = || "mapCinematicId",
																						    		children = {
																						    			{
																											type = DialogType.Response,
																											text = || __R(85, "Recruit him."),
																											
																											onChoose = function(d,n)
																								            	cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitMusketeer")
																								            end,
																											exit = true
																										},
																										{
																											type = DialogType.Response,
																											text = || __R(86, "Look for other recruits."),
																											jumpTo = "recruits"
																										}
																						    		}
																								}
																				    		}
																						},
																						{
																							type = DialogType.Response,
																							text = || __R(87, "Talk to the Assassin."),
																							condition = |d| cinematicMapHelper.InList(d.data.options, "Assassin"),
																				    		who = || "mapCinematicId",
																				    		children ={
																				    			{
																									type = DialogType.Dialog,
																									text = || __D(88, "\"I will be your shadow,\"\n\nthe Assassin whispered."),
																						    		who = || "mapCinematicId",
																						    		children = {
																						    			{
																											type = DialogType.Response,
																											text = || __R(89, "Recruit him."),
																											
																											onChoose = function(d,n)
																								            	cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitAssassin")
																								            end,
																											exit = true
																										},
																										{
																											type = DialogType.Response,
																											text = || __R(90, "Look for other recruits."),
																											jumpTo = "recruits"
																										}
																						    		}
																								}
																				    		}
																						},
																						{
																							type = DialogType.Response,
																							text = || __R(56, "Not right now."),
																				    		jumpTo = "return"
																						}
																		        	}
																				}
																	        }
										                                },
										                                
										                                {
														    				type = DialogType.Custom,
														    				condition = || cinematicMapHelper.CurrentQuestStatus().context.GetInt("wrestled") != 1,
														    				subtype = "diceChallenge",
														    				text = || __R(57, "Arm wrestle!"),
														    				challenge = {
														    					requirements =  |t| t("ct_might")
														    					},
														    				children = {
																				{
																		            type = DialogType.Dialog,
																		            condition = |d| d.challenge.result == "success",
																		            onEnter = function (d,n)
																					    	d.data.hero = d.challenge.heroesSuccess[0]
																					end,
																		            text = || __D(58, "We saw some patrons arm wrestling for money and decided to give it a try.\n\nWe showed them our raw strength and won the prize pool!"),
																		            who = || "mapCinematicId",
																		            children = {
																				        {
																		    				type = DialogType.Custom,
																		    				subtype = "rewards",
																		    				rewards = || quest.results.mightSuccess,
																		    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
																							onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetInt("wrestled", 1),
																							jumpTo = "return"
																						}
																				    }
																		        },
																		        {
																		            type = DialogType.Dialog,
																		            condition = |d| d.challenge.result == "failure",
																		            onEnter = function (d,n)
																					    	d.data.hero = d.challenge.heroesFailure[0]
																					end,
																		            text = || __D(59, "We saw some patrons arm wrestling for money and decided to give it a try.\n\nSadly, our strength wasn't enough against our opponents, and we had to pay out some coins."),
																		            who = || "mapCinematicId",
																		            children = {
																				        {
																		    				type = DialogType.Custom,
																		    				subtype = "rewards",
																		    				rewards = || quest.results.mightFailure,
																		    				rewardsParams = |d| {hero = d.data.hero},
																		    				onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetInt("wrestled", 1),
																				    		jumpTo = "return"
																						}
																				    }
																		        }
														    				}
															    		},
										                                {
										                                    type = DialogType.Response,
										                                    text = || __R(60, "Leave."),
										                                    onChoose = function(d,n)
																            	cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "leave")
																            	
																            end,
										                                    exit = true
										                                },
														        	}
														        },

														        {
														            type = DialogType.Dialog,
														            id = "return",
														            text = || __D(61, "\"Are you done? Your presence is driving off some of my customers,\"\n\nsays the bartender, cleaning the counter."),
														    		who = || "mapCinematicId",
														    		inheritFrom = "start"
														    	}
														    }
														}
												    }
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "failure",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesFailure[0]
													end,
										            text = || __D(62, "We told them they didn't understand the importance of our mission, which made them start attacking us and rallying the rest of patrons inside to get us.\n\nWe ran away before we could be caught by a mob of outlaws from all places and races."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.socialFailure,
										    				rewardsParams = |d| {hero = d.data.hero},
												    		onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "leave"),
										                    exit = true
														}
												    }
										        }
						    				}
							    		},

							    		{
		                                    type = DialogType.Custom,
		                                    subtype = "loot",
		                                    amount = || 50,
		                                    text = || __R(63, "Bribe them."),
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(64, "Knowing that everyone has their price, we took a small purse filled with coins and tossed it to them.\n\n\"Hmm ... this will do!\" said the leader, before stepping aside."),
										    		who = || "mapCinematicId",
										    		children = {
														{
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.bribe,
										    				rewardsParams = || {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		jumpTo = "start"
												    		
														}
										        	}
												}
									        }
		                                },

		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(65, "Walk away."),
		                                    who = || "mapCinematicId",
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(66, "Having enough on our plates already, we decided to walk away and avoid engaging in a fight."),
										    		who = || "mapCinematicId",
										    		onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "leave"),
										            exit = true
												}
									        }
		                                }
		                            }
						        }
						    })


	

	quest.results = {
		socialSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = config.rewards.starXp.eMid()},
			}),
		socialFailure = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level = -1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(2)},
			}),

		mightSuccess = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = 25 },
			}),
		mightFailure = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 1, targets = {params.hero}},
			{type="guild.attribute", kind = "loot", amount = -15 },
			}),

		bribe = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = config.rewards.starXp.eLow()},
			{type="guild.attribute", kind = "loot", amount = -50 },
			}),

		Rest = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = -30 },
			{type="applyModifier", category="energyMod", level = 1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
				{type="doHeal", amount = 3, targets = cinematicMapHelper.Party()},
			}),

		Rumors = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = -20 },
			}),

		-- These character results are part of an unused section of code that presumably would've made you buy the heroes to recruit them
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
																				{"MinionFemaleKnightLvl2"}, checkRecruited
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitRanger", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionRangerLvl2"}, checkRecruited
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitMage",  -- Checks if the status is set to "recruitMage"
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionArcaneMageLvl2"}, checkRecruited -- Double checks that this character is not in the party.
																				-- Notably, "MinionArcaneMageLvl2" is the name of the unit, NOT the uniqueID.
																				-- This indicates that you are specifically recruiting the Lvl2 Arcane Wizard.
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitBarbarian", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionBarbarianLvl2"}, checkRecruited
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitBombardier", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionDwarfBombardierLvl2"}, checkRecruited
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitDarkKnight", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionDarkKnightLvl2"}, checkRecruited
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitWitchDoctor", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionWitchDoctorLvl2"}, checkRecruited
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitSasquatch", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionSasquatchLvl2"}, checkRecruited
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitZapper", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionTeslaLvl2"}, checkRecruited
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitOrcCleaver", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionOrcCleaverLvl2"}, checkRecruited
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitSorceress", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionSorceressLvl2"}, checkRecruited
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitSylvanElf", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionSylvanElfLvl2"}, checkRecruited
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitEnchantress", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionEnchantressLvl2"}, checkRecruited
																				)
																				}
																			)),	
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitNecromancer", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionNecromancerLvl2"}, checkRecruited
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitCleric", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionClericLvl2"}, checkRecruited
																				)
																				}
																			)),	
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitMustekeer", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionMusketeerLvl2"}, checkRecruited
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
