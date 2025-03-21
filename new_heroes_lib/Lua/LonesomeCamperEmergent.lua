

do  
	local quest = helper.QuestDefinition();
	quest.id = 'LonesomeCamperEmergent'
	
	quest.encounters = {}
	quest.tags = {"ISOLATED","RECRUIT","NARRATIVE","NORMAL"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						        	type = DialogType.Dialog,
						            narrator = || __N(1, "The Lonesome Camper"),
						            text = || __D(2, "We come across a camper during our travels."),
						    		icon = || "Asst_MercenaryCamp",
						    		who = || "mapCinematicId",
						            children = {
								        {
		                                    type = DialogType.Response,
		                                    text = || __R(3, "Talk to the traveler."),
		                                    onEnter = function (d,n)
		                                    	local heroesAvailable = {}

		                                    	
		                                    	if( cinematicMapHelper.HeroByTag("Knight") == nil ) then
			                                    	table.insert(heroesAvailable, "knight")
			                               		end
												if( cinematicMapHelper.HeroByTag("Ranger") == nil ) then
		                                    		table.insert(heroesAvailable, "ranger")
		                                    	end
												if( cinematicMapHelper.HeroByTag("Wizard") == nil ) then
		                                    		table.insert(heroesAvailable, "mage")
		                                    	end
												if( cinematicMapHelper.HeroByTag("Barbarian") == nil ) then
		                                    		table.insert(heroesAvailable, "barbarian")
		                                    	end
												if( cinematicMapHelper.HeroByTag("Bombardier") == nil ) then
		                                    		table.insert(heroesAvailable, "bombardier")
		                                    	end
												if( cinematicMapHelper.HeroByTag("DarkKnight") == nil ) then
		                                    		table.insert(heroesAvailable, "darkKnight")
		                                    	end
		                                    	if( cinematicMapHelper.HeroByTag("WitchDoctor") == nil ) then
		                                    		table.insert(heroesAvailable, "witchDoctor")
		                                    	end
		                                    	if( cinematicMapHelper.HeroByTag("Sasquatch") == nil ) then
		                                    		table.insert(heroesAvailable, "sasquatch")
		                                    	end
		                                    	if( cinematicMapHelper.HeroByTag("Tesla") == nil ) then
		                                    		table.insert(heroesAvailable, "zapper")
		                                    	end
		                                    	if( cinematicMapHelper.HeroByTag("OrcCleaver") == nil ) then
		                                    		table.insert(heroesAvailable, "orcCleaver")
		                                    	end
		                                    	if( cinematicMapHelper.HeroByTag("Sorceress") == nil ) then
		                                    		table.insert(heroesAvailable, "sorceress")
		                                    	end
		                                    	if( cinematicMapHelper.HeroByTag("SylvanElf") == nil ) then
		                                    		table.insert(heroesAvailable, "sylvanElf")
		                                    	end
		                                    	if( cinematicMapHelper.HeroByTag("Enchantress") == nil ) then
		                                    		table.insert(heroesAvailable, "enchantress")
		                                    	end
		                                    	if( cinematicMapHelper.HeroByTag("Necromancer") == nil ) then
		                                    		table.insert(heroesAvailable, "necromancer")
		                                    	end
												if( cinematicMapHelper.HeroByTag("Cleric") == nil ) then
		                                    		table.insert(heroesAvailable, "cleric")
		                                    	end


		                                    	local heroToRecruit = cinematicMapHelper.RandomItem(heroesAvailable)

		                                    	d.data.recruit = heroToRecruit
		                                    end,
		                                    children = {
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.recruit == "knight",
										            text = || __D(4, "As we got closer, we noticed the camper was a heavily armored knight.\n\n\"Join you? Well...\nit sure looks like you could use the muscle.\""),
										    		who = || "mapCinematicId",
										            children = {
										    			{
															type = DialogType.Response,
															text = || __R(5, "Ask her to join you."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitKnight"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(6, "The knight nodded and walked toward us.\n\n\"You have my sword!\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														}
														
														
														
														
														
										    		}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.recruit == "ranger",
										            text = || __D(8, "We noticed the camper was a ranger whittling some arrows.\n\n\"So you want me to join your ragtag group of adventurers?\""),
										    		who = || "mapCinematicId",
										            children = {
										    			{
															type = DialogType.Response,
															text = || __R(9, "Ask him to join you."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitRanger"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(10, "The ranger strapped his gear on his back and walked toward us with a smile\n\n\"You have my bow!\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														}
														
														
														
														
														
										    		}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.recruit == "mage",
										            text = || __D(12, "The camper turned out to be a wizard.\nHe looked at us as he raised his eyes from his book.\n\n\"I sense you are in need of an expert in the arts of arcana.\nWould you care for my services?\""),
										    		who = || "mapCinematicId",
										            children = {
										    			{
															type = DialogType.Response,
															text = || __R(13, "Ask him to join you."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitMage"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(14, "The wizard stood up and patiently gathered his belongings before joining us.\n\n\"You have my ... mana?\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														}
														
														
														
														
														
										    		}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.recruit == "barbarian",
										            text = || __D(16, "We found out the camper was a hulking barbarian sharpening his axes.\n\n\"I'm bored waiting.\nI come with you and put axe in enemies, good?\""),
										    		who = || "mapCinematicId",
										            children = {
										    			{
															type = DialogType.Response,
															text = || __R(17, "Ask him to join you."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitBarbarian"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(18, "The barbarian grinned wickedly and crossed his axes behind his back as he joined us.\n\n\"You have my axes!\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														}
														
														
														
														
														
										    		}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.recruit == "bombardier",
										            text = || __D(20, "We noticed the stranger was a bombardier doing target practice.\n\n\"Yippee-ki-yay! Right on target.\nImpressive, am I right?\""),
										    		who = || "mapCinematicId",
										            children = {
										    			{
															type = DialogType.Response,
															text = || __R(21, "Ask her to join you."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitBombardier"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(22, "The bombardier nodded and smiled as she walked toward us.\n\n\"Sure, I'll join you, fellas.\nYou have my bombs.\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														}
														
														
														
														
														
										    		}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.recruit == "darkKnight",
										            text = || __D(24, "We realized the camper was a heavily armored Dark Knight staring at the horizon.\n\nThe Dark Knight turned around to face us and stared at us without saying a word."),
										    		who = || "mapCinematicId",
										            children = {
										    			{
															type = DialogType.Response,
															text = || __R(25, "Ask him to join you."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitDarkKnight"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(26, "The Dark Knight simply nodded and walked toward us, mumbling unintelligibly.\n\n\"...\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														}
														
														
														
														
														
										    		}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.recruit == "witchDoctor",
										            text = || __D(28, "We noticed the stranger was a witch doctor foraging for roots.\n\n\"Spirits say I'll need these for our journey.\""),
										    		who = || "mapCinematicId",
										            children = {
										    			{
															type = DialogType.Response,
															text = || __R(29, "Ask him to join you."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitWitchDoctor"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(30, "The witch doctor stood up and smiled, dusting off his knees.\n\n\"Of course I'll join you. You have my healing.\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														}
														
														
														
														
														
										    		}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.recruit == "sasquatch",
										            text = || __D(32, "We found that the stranger was in fact a huge sasquatch sitting on a rock. He seemed to be picking some food from between his tusks with a twig.\n\n\"I'm done with my second lunch. I need to find something to eat for my third one.\""),
										    		who = || "mapCinematicId",
										            children = {
										    			{
															type = DialogType.Response,
															text = || __R(33, "Ask him to join you."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitSasquatch"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(34, "The sasquatch stood up and grinned at us.\n\n\"OK, we can find some food together. You have my fists!\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														}
														
														
														
														
														
										    		}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.recruit == "zapper",
										            text = || __D(36, "We noticed the stranger was a dwarven zapper making some sort of magic candle using a potato and a glass orb.\n\n\"Hey there! Bet you've never seen one of these potato bulbs in action, huh?\""),
										    		who = || "mapCinematicId",
										            children = {
										    			{
															type = DialogType.Response,
															text = || __R(37, "Ask him to join you."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitZapper"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(38, "The zapper stood up and started to pack his experiment.\n\n\"Oh yes, I'll join you. I got some new toys I can't wait to test in the field. You have my ingenuity!\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														}
														
														
														
														
														
										    		}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.recruit == "orcCleaver",
										            text = || __D(40, "We realized the stranger was an intimidating orc sharpening a huge cleaver.\n\n\"No need to be afraid. I'm not with the rest of the warmongers. If you're planning to get into fights, I might be interested....\""),
										    		who = || "mapCinematicId",
										            children = {
										    			{
															type = DialogType.Response,
															text = || __R(41, "Ask him to join you."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitOrcCleaver"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(42, "The orc cleaver grinned a wicked grin and got up, resting his cleaver over his shoulder.\n\n\"Good, we have some bone-breaking to do. You have my cleaver!\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														}
														
														
														
														
														
										    		}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.recruit == "sorceress",
										            text = || __D(44, "We found an old lady using magic to reshape a rock into a bench to sit on.\n\n\"Oh, hello there, lovelies. I was about to take a nap, but I'm glad you came along ... I'm a bit bored.\""),
										    		who = || "mapCinematicId",
										            children = {
										    			{
															type = DialogType.Response,
															text = || __R(45, "Ask her to join you."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitSorceress"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(46, "The sorceress stood up and snapped her fingers, turning the bench back into a regular rock.\n\n\"OK, my darlings. You have my sorcery!\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														}
														
														
														
														
														
										    		}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.recruit == "sylvanElf",
										            text = || __D(48, "We found a blindfolded sylvan elf training with a double-edged spear next to the road.\n\n\"Fate is surely smiling at us today. Tell me, adventurers ... are you prepared for what lies ahead?\""),
										    		who = || "mapCinematicId",
										            children = {
										    			{
															type = DialogType.Response,
															text = || __R(49, "Ask him to join you."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitSylvanElf"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(50, "The elf removed the blindfold and smiled at us.\n\n\"It is time to beat evil, forever and ever. You have my spear!\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														}
														
														
														
														
														
										    		}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.recruit == "enchantress",
										            text = || __D(52, "We saw an ashervan enchantress invoking her magic into a sapling.\n\n\"If nature beckons me forward, then I must heed its call to battle.\""),
										    		who = || "mapCinematicId",
										            children = {
										    			{
															type = DialogType.Response,
															text = || __R(53, "Ask her to join you."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitEnchantress"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(54, "The sapling withered into a pile of dust.\n\n\"Let us quell this dark magic from the realm!\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														}
														
														
														
														
														
										    		}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.recruit == "necromancer",
										            text = || __D(56, "The stranger turned out to be a necromancer, who extended a crooked finger toward us.\n\n\"Enlighten me, adventurers ... do you fear death?\""),
										    		who = || "mapCinematicId",
										            children = {
										    			{
															type = DialogType.Response,
															text = || __R(57, "Ask it to join you."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitNecromancer"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(58, "The necromancer grabbed its staff and chuckled.\n\n\"Defeating a greater evil will favor the greater good!\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														}
														
														
														
														
														
										    		}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.recruit == "cleric",
										            text = || __D(60, "The stranger turned out to be a cleric, who looked up and grinned.\n\n\"Hello, my friends! May I be of service?\""),
										    		who = || "mapCinematicId",
										            children = {
										    			{
															type = DialogType.Response,
															text = || __R(61, "Ask him to join you."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitCleric"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(62, "The cleric hoisted his shield, clapped each of us on the back, and said,\n\n\"May the heavens guide us ... through me!\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														}
														
														
														
														
														
										    		}
										        }
										    }
										}
										
		                                  
		                                   
										   
		                                
									}
								}
							})

	quest.results = {


		recruit = cinematicMapHelper.Result(|params| {
			{type="giveXP", amount = config.rewards.starXp.eLow()},
			}),
	}

	quest.interruptFixed = || helper.PriorityAndSlots(((cinematicMapHelper.PartySize()<4) and (cinematicMapHelper.NodeDistance(cinematicMapHelper.CurrentNode(),cinematicMapHelper.NodeSafe("start")) >= 3)) and 10 or 0, 3)

	quest.AddCinematic("onReach", cinematicMapHelper.Cinematic({
									cinematicMapHelper.ShowDialogInstance(theDialog),
									cinematicMapHelper.Instant(function ()
										cinematicMapHelper.CurrentNode().SetVisualState("solved")
									end),
									cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitKnight", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionFemaleKnight"}
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitRanger", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionRanger"}
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitMage", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionArcaneMage"}
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitBarbarian", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionBarbarian"}
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitBombardier", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionDwarfBombardier"}
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitDarkKnight", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionDarkKnight"}
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitWitchDoctor", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionWitchDoctor"}
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitSasquatch", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionSasquatch"}
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitZapper", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionTesla"}
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitOrcCleaver", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionOrcCleaver"}
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitSorceress", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionSorceress"}
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitSylvanElf", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionSylvanElf"}
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitEnchantress", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionEnchantress"}
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitNecromancer", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionNecromancer"}
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitCleric", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionCleric"}
																				)
																				}
																			))												
								}))
	helper.AddQuest(quest)
	quest.revealDistance = 0

	quest.maxInstancesInGame = 1;
	quest.maxInstancesInAdventure = 1;
end
