

do 
	local quest = helper.QuestDefinition();
	quest.id = 'SilveroakTavern'
	quest.visual = "Tavern"
	quest.kindFlag = "Recruit"
	quest.startRevealed = true
	quest.tags = {"RECRUIT","NARRATIVE","FIXED","TERRAIN_SILVEROAK"}
	quest.encounters = {}


		local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						            type = DialogType.Dialog,
						            id = "start",
						            narrator = || __N(1, "The Sylvan Elf Hall"),
						    		condition = || (cinematicMapHelper.HeroByTag("VeznanFaction") == nil),
						            text = || __D(2, "A heavily protected Sylvan elf hall by the road is bustling with warriors training and sparring, and it has a tavern of sorts.\n\nHere we can safely rest for a while."),
						    		icon = || "Asst_TavernNew",
						    		who = || "mapCinematicId",
						            children = {
						            	{
		                                    type = DialogType.Custom,
		                                    subtype = "loot",
		                                    amount = || 50,
		                                    text = || __R(3, "Rest."),
		                                    children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(4, "We paid the fee and took some time to rest in comfortable beds and have a taste of the wonderful elven cuisine."),
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
																	text = || __D(56, "\"I may not be the elf you're expecting,\"the enchantress said with a wicked smile.\"\n\nbut I will gladly join your quest.\""),
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
															text = || __R(67, "Not right now."),
												    		jumpTo = "return"
														}
										        	}
												}
									        }
		                                },
		                                {
						    				type = DialogType.Custom,
						    				condition = || cinematicMapHelper.CurrentQuestStatus().context.GetInt("archeryContest") != 1,
						    				subtype = "diceChallenge",
						    				text = || __R(68, "Archery contest!"),
						    				challenge = {
						    					requirements =  |t| t("ct_ranged")
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(53, "Feeling confident, we challenged the elven archers to an accuracy contest on the shooting range.\n\nWe surprised our rivals with a perfect score and they, far from being disheartened, paid up in coin and a round of drinks."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.rangedSuccess,
										    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetInt("archeryContest", 1),
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
										            text = || __D(69, "Feeling confident, we challenged the elven archers practicing on the shooting range to an accuracy contest.\n\nWe tried our best, but the elves were certainly better than us and we quickly fell behind. We paid the agreed amount and left, silent and ashamed."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.rangedFailure,
										    				rewardsParams = |d| {hero = d.data.hero},
										    				onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetInt("archeryContest", 1),
												    		jumpTo = "return"
														}
												    }
										        }
						    				}
							    		},

		                                {
		                                    type = DialogType.Response,
		                                    text = || __R(70, "Leave."),
		                                    onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "leave"),
		                                    exit = true
		                                },
						        	}
						        },
						        
						        {
						            type = DialogType.Dialog,
						            id = "darkStart",
						            narrator = || __N(71, "The Sylvan Elf Hall"),
						    		condition = || (cinematicMapHelper.HeroByTag("VeznanFaction") != nil) and cinematicMapHelper.CurrentQuestStatus().context.GetInt("darkConvinced") != 1,
						            text = || __D(72, "We are approaching an elvish tavern when armed guards surround us before we can put a foot inside the building.||\"You must be really naive to think we'll let the likes of you enter this place. Away with you! Or face your punishment right here, right now,\" says their captain."),
						    		icon = || "Asst_TavernNew",
						    		who = || "mapCinematicId",
						            children = {
						            	{
						    				type = DialogType.Custom,
						    				
						    				subtype = "diceChallenge",
						    				text = || __R(73, "Persuade them."),
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
										            text = || __D(74, "It took some smart talk to convince the guards to let us enter, but in the end they saw that our mission to save the forest would benefit their people as well, so they put their weapons down."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.socialSuccess,
										    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetInt("darkConvinced", 1),
															jumpTo = "darkPassed"
														}
													}
											    },
										        
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "failure",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesFailure[0]
													end,
										            text = || __D(75, "Our arguments weren't convincing enough, and the guards remained adamant on their position.\n\nTired and outnumbered, we decided to desist and find another place to rest."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.socialFailure,
										    				rewardsParams = |d| {hero = d.data.hero},
										    				onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetInt("darkFailed", 1),
										    				onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "leave"),
												    		exit = true 
														}
												    }
										        }
						    				}
						            	},
						            	{
						    				type = DialogType.Custom,
						    				subtype = "diceChallenge",
						    				text = || __R(76, "Intimidate them."),
						    				challenge = {
						    					requirements =  |t| t("VeznanFaction") and t("ct_legend")
						    					},
						    				children = {
												{
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "success",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesSuccess[0]
													end,
										            text = || __D(77, "We reminded them who's still in charge in Linirea, and that if they didn't want to suffer the fury of Vez'nan himself once again, they should really consider getting out of our way.\n\nGroaning, and with their eyes filled with hatred, they let us through."),
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.dLegendSuccess,
										    				rewardsParams = |d| {hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
												    		onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetInt("darkConvinced", 1),
												    		jumpTo = "darkPassed"
														}
												    }
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.challenge.result == "failure",
										            onEnter = function (d,n)
													    	d.data.hero = d.challenge.heroesFailure[0]
													end,
										            text = || __D(78, "We told them to move or face the Dark Army's might, hoping to instill fear in their minds, but our words fueled their anger even more instead.\n\nA skirmish started almost immediately, forcing us to flee for our lives."), 
										            who = || "mapCinematicId",
										            children = {
												        {
										    				type = DialogType.Custom,
										    				subtype = "rewards",
										    				rewards = || quest.results.dLegendFailure,
										    				rewardsParams = |d| {hero = d.data.hero, hard= cinematicMapHelper.CurrentNode().tags.Contains("hard"), normal= cinematicMapHelper.CurrentNode().tags.Contains("normal")},
										    				
										    				onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "leave"),
												    		exit = true
														}
												    }
										        }
						    				}
							    		},
						            	{
		                                    type = DialogType.Response,
		                                    text = || __R(79, "Just leave."),
		                                    who = || "mapCinematicId",
										   	children = {
												{
													type = DialogType.Dialog,
			                                    	text = || __D(80, "Seeing ourselves outnumbered by angry warriors, we decided to leave and find another place to rest."),
										    		who = || "mapCinematicId",
										    		onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "leave"),
										    		exit = true
												}
									        }
		                                }

						            }
						        },
						        {
						            type = DialogType.Dialog,
						            id = "darkPassed",
						            condition = || (cinematicMapHelper.HeroByTag("VeznanFaction") != nil) and cinematicMapHelper.CurrentQuestStatus().context.GetInt("darkConvinced") == 1,
						            narrator = || __N(81, "The Sylvan Elf Hall"),
						            text = || __D(82, "\"Do whatever you need to do, and carry on with your mission. Allies of the Dark Army aren't welcome here,\" the captain says with a fierce look in his eyes."), 
						    		icon = || "Asst_TavernNew",
						    		who = || "mapCinematicId",
						    		inheritFrom = "start"
						    	},
						        {
						            type = DialogType.Dialog,
						            id = "return",
						            
						            narrator = || __N(83, "The Sylvan Elf Hall"),
						            text = || __D(84, "\"I'm glad you're enjoying your stay, but the forest is getting worse by the minute, so if you could get back to it, that'd be great...,\"\n\nthe captain says with an acerbic tone."),
						    		icon = || "Asst_TavernNew",
						    		who = || "mapCinematicId",
						    		inheritFrom = "start"
						    	}
					    })

	quest.results = {
		Rest = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = -50 },
			{type="applyModifier", category="energyMod", level = 1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			{type="doHeal", amount = 3, targets = cinematicMapHelper.Party()},
			}),
		rangedSuccess = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = 25 },
			{type="applyModifier", category="energyMod", level = 1, duration = config.rewards.buffDuration.energy(), targets = {params.hero}},
			}),
		rangedFailure = cinematicMapHelper.Result(|params| {
			{type="guild.attribute", kind = "loot", amount = -25 },
			{type="applyModifier", category="luckMod", level = -1, duration = config.rewards.buffDuration.energy(), targets = {params.hero}},
			}),

		socialSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or (config.rewards.starXp.eLow()))},
			}),
		socialFailure = cinematicMapHelper.Result(|params| {
			{type="applyModifier", category="energyMod", level = -1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
			}),
		dLegendSuccess = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = params.hard and config.rewards.starXp.eHigh() or (params.normal and config.rewards.starXp.eMid() or (config.rewards.starXp.eLow()))},
			}),
		dLegendFailure = cinematicMapHelper.Result(|params| {
			{type="doDamage", amount = 1, targets =  cinematicMapHelper.Party()},
			{type="applyModifier", category="energyMod", level = -1, duration = config.rewards.buffDuration.energy(), targets = cinematicMapHelper.PartyRandom(1)},
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
