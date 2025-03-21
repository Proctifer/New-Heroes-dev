

do 
	local quest = helper.QuestDefinition();
	quest.id = 'SecondWind'
	quest.visual = "Wanderer"
	quest.kindFlag = "Recruit"
	quest.encounters = {}
	quest.tags = {"RECRUIT","NARRATIVE","NORMAL"}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						        	type = DialogType.Dialog,
						            narrator = || __N(1, "Second Wind"),
						            text = || __D(2, "We hear pained groaning and notice a wounded hero lying against a nearby rock."),
						    		icon = || "Asst_FallenHero",
						    		who = || "mapCinematicId",
						            children = {
								        {
		                                    type = DialogType.Response,
		                                    text = || __R(3, "Talk to the hero."),
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
										            text = || __D(4, "As we got closer, we found a Linirean knight with grievous (although not mortal) wounds.\n\n\"Help me ... I must go on....\""),
										    		who = || "mapCinematicId",
										            children = {
										    			{
															type = DialogType.Custom,
															subtype = "item",
						                  					item = || "healthPotion",
															text = || __R(5, "Heal her."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitKnight"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(6, "We gave her one of our potions and waited until she felt better.\n\n\"Thanks! Let me protect you as you finish your quest.\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														},

														{
															type = DialogType.Custom,
															subtype = "item",
						                  					item = || "elixirOfLife",
															text = || __R(7, "Heal her."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitKnight"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(8, "We gave her one of our potions and waited until she felt better.\n\n\"Thanks! Let me protect you as you finish your quest.\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														},

														{
															type = DialogType.Custom,
															subtype = "item",
						                  					item = || "bandage",
															text = || __R(9, "Heal her."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitKnight"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(10, "We gave her one of our bandages and waited until she felt better.\n\n\"Thanks! Let me protect you as you finish your quest.\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														},

														{
						                                    type = DialogType.Response,
						                                    text = || __R(11, "Keep going."),
						                                    who = || "mapCinematicId",
														   	children = {
																{
																	type = DialogType.Dialog,
																	id = "keepGoing",
							                                    	text = || __D(12, "We didn't know what we could do for the wounded hero, so we wished them the best and focused on our quest."),
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
										            text = || __D(13, "As we got closer, we found a ranger with grievous (although not mortal) wounds.\n\n\"Help ... I foolishly tried going alone....\""),
										    		who = || "mapCinematicId",
										            children = {
										    			{
															type = DialogType.Custom,
															subtype = "item",
						                  					item = || "healthPotion",
															text = || __R(14, "Heal him."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitRanger"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(15, "We gave him one of our potions and waited until he felt better.\n\n\"Thanks! Let me join your team and let's take them down, shall we?\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														},

														{
															type = DialogType.Custom,
															subtype = "item",
						                  					item = || "elixirOfLife",
															text = || __R(16, "Heal him."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitRanger"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(17, "We gave him one of our potions and waited until he felt better.\n\n\"Thanks! Let me join your team and let's take them down, shall we?\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														},

														{
															type = DialogType.Custom,
															subtype = "item",
						                  					item = || "bandage",
															text = || __R(18, "Heal him."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitRanger"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(19, "We gave him one of our bandages and waited until he felt better.\n\n\"Thanks! Let me join your team and let's take them down, shall we?\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														},

														{
											            	type = DialogType.Response,
											            	text = || __R(20, "Keep going."),
											            	jumpTo = "keepGoing"
										            	}
										    		}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.recruit == "mage",
										            text = || __D(21, "As we got closer, we found an arcane mage with grievous (although not mortal) wounds.\n\n\"Help ... my spells weren't enough against the cult....\""),
										    		who = || "mapCinematicId",
										            children = {
										    			{
															type = DialogType.Custom,
															subtype = "item",
						                  					item = || "healthPotion",
															text = || __R(22, "Heal him."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitMage"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(23, "We gave him one of our potions and waited until he felt better.\n\n\"Marvelous! Please, let me help you in your quest with my arcane skills.\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														},

														{
															type = DialogType.Custom,
															subtype = "item",
						                  					item = || "elixirOfLife",
															text = || __R(24, "Heal him."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitMage"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(25, "We gave him one of our potions and waited until he felt better.\n\n\"Marvelous! Please, let me help you in your quest with my arcane skills.\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														},

														{
															type = DialogType.Custom,
															subtype = "item",
						                  					item = || "bandage",
															text = || __R(26, "Heal him."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitMage"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(27, "We gave him one of our bandages and waited until he felt better.\n\n\"Marvelous! Please, let me help you in your quest with my arcane skills.\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														},

														{
											            	type = DialogType.Response,
											            	text = || __R(28, "Keep going."),
											            	jumpTo = "keepGoing"
										            	}
										    		}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.recruit == "barbarian",
										            text = || __D(29, "As we got closer, we found a barbarian with grievous (although not mortal) wounds.\n\n\"Grrr ... they too powerful for me ... need help....\""),
										    		who = || "mapCinematicId",
										            children = {
										    			{
															type = DialogType.Custom,
															subtype = "item",
						                  					item = || "healthPotion",
															text = || __R(30, "Heal him."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitBarbarian"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(31, "We gave him one of our potions and waited until he felt better.\n\n\"Thanks. They made me angry. Let me go with you and show them!\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														},

														{
															type = DialogType.Custom,
															subtype = "item",
						                  					item = || "elixirOfLife",
															text = || __R(32, "Heal him."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitBarbarian"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(33, "We gave him one of our potions and waited until he felt better.\n\n\"Thanks. They made me angry. Let me go with you and show them!\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														},

														{
															type = DialogType.Custom,
															subtype = "item",
						                  					item = || "bandage",
															text = || __R(34, "Heal him."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitBarbarian"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(35, "We gave him one of our bandages and waited until he felt better.\n\n\"Thanks. They made me angry. Let me go with you and show them!\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														},

														{
											            	type = DialogType.Response,
											            	text = || __R(36, "Keep going."),
											            	jumpTo = "keepGoing"
										            	}
										    		}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.recruit == "bombardier",
										            text = || __D(37, "As we got closer, we found a dwarf bombardier with grievous (although not mortal) wounds.\n\n\"Help ... my bombs weren't enough for them....\""),
										    		who = || "mapCinematicId",
										            children = {
										    			{
															type = DialogType.Custom,
															subtype = "item",
						                  					item = || "healthPotion",
															text = || __R(38, "Heal her."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitBombardier"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(39, "We gave her one of our potions and waited until she felt better.\n\n\"Thank you! Let me join you and let's blast them away!\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														},

														{
															type = DialogType.Custom,
															subtype = "item",
						                  					item = || "elixirOfLife",
															text = || __R(40, "Heal her."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitBombardier"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(41, "We gave her one of our potions and waited until she felt better.\n\n\"Thank you! Let me join you and let's blast them away!\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														},

														{
															type = DialogType.Custom,
															subtype = "item",
						                  					item = || "bandage",
															text = || __R(42, "Heal her."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitBombardier"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(43, "We gave her one of our bandages and waited until she felt better.\n\n\"Thank you! Let me join you and let's blast them away!\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														},

														{
											            	type = DialogType.Response,
											            	text = || __R(44, "Keep going."),
											            	jumpTo = "keepGoing"
										            	}
										    		}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.recruit == "darkKnight",
										            text = || __D(45, "As we got closer, we found a Dark Knight with grievous (although not mortal) wounds.\n\n\"... I have to ... continue....\""),
										    		who = || "mapCinematicId",
										            children = {
										    			{
															type = DialogType.Custom,
															subtype = "item",
						                  					item = || "healthPotion",
															text = || __R(46, "Heal him."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitDarkKnight"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(47, "We gave him one of our potions and waited until he felt better.\n\n\"... Thanks. Let's go.\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														},

														{
															type = DialogType.Custom,
															subtype = "item",
						                  					item = || "elixirOfLife",
															text = || __R(48, "Heal him."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitDarkKnight"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(49, "We gave him one of our potions and waited until he felt better.\n\n\"... Thanks. Let's go.\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														},

														{
															type = DialogType.Custom,
															subtype = "item",
						                  					item = || "bandage",
															text = || __R(50, "Heal him."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitDarkKnight"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(51, "We gave him one of our bandages and waited until he felt better.\n\n\"... Thanks. Let's go.\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														},

														{
											            	type = DialogType.Response,
											            	text = || __R(52, "Keep going."),
											            	jumpTo = "keepGoing"
										            	}
										    		}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.recruit == "witchDoctor",
										            text = || __D(53, "As we got closer, we found a witch doctor with grievous (although not mortal) wounds.\n\n\"It's not my time yet....\""),
										    		who = || "mapCinematicId",
										            children = {
										    			{
															type = DialogType.Custom,
															subtype = "item",
						                  					item = || "healthPotion",
															text = || __R(54, "Heal him."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitWitchDoctor"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(55, "We gave him one of our potions and waited until he felt better.\n\n\"Wicked! Thank you, believers.... Now, let me repay you by joining you.\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														},

														{
															type = DialogType.Custom,
															subtype = "item",
						                  					item = || "elixirOfLife",
															text = || __R(56, "Heal him."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitWitchDoctor"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(57, "We gave him one of our potions and waited until he felt better.\n\n\"Wicked! Thank you, believers.... Now, let me repay you by joining you.\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														},

														{
															type = DialogType.Custom,
															subtype = "item",
						                  					item = || "bandage",
															text = || __R(58, "Heal him."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitWitchDoctor"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(59, "We gave him one of our bandages and waited until he felt better.\n\n\"Wicked! Thank you, believers.... Now, let me repay you by joining you.\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														},

														{
											            	type = DialogType.Response,
											            	text = || __R(60, "Keep going."),
											            	jumpTo = "keepGoing"
										            	}
										    		}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.recruit == "sasquatch",
										            text = || __D(61, "As we got closer, we found a sasquatch with grievous (although not mortal) wounds.\n\n\"Things have gotten too hairy for me....\""),
										    		who = || "mapCinematicId",
										            children = {
										    			{
															type = DialogType.Custom,
															subtype = "item",
						                  					item = || "healthPotion",
															text = || __R(62, "Heal him."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitSasquatch"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(63, "We gave him one of our potions and waited until he felt better.\n\n\"Whooa! That's grrreeeat, friends. Here, let me come with you!\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														},

														{
															type = DialogType.Custom,
															subtype = "item",
						                  					item = || "elixirOfLife",
															text = || __R(64, "Heal him."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitSasquatch"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(65, "We gave him one of our potions and waited until he felt better.\n\n\"Whooa! That's grrreeeat, friends. Here, let me come with you!\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														},

														{
															type = DialogType.Custom,
															subtype = "item",
						                  					item = || "bandage",
															text = || __R(66, "Heal him."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitSasquatch"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(67, "We gave him one of our bandages and waited until he felt better.\n\n\"Whooa! That's grrreeeat, friends. Here, let me come with you!\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														},

														{
											            	type = DialogType.Response,
											            	text = || __R(68, "Keep going."),
											            	jumpTo = "keepGoing"
										            	}
										    		}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.recruit == "zapper",
										            text = || __D(69, "As we got closer, we found a dwarven zapper with grievous (although not mortal) wounds.\n\n\"I ... I need to be reanimated.\""),
										    		who = || "mapCinematicId",
										            children = {
										    			{
															type = DialogType.Custom,
															subtype = "item",
						                  					item = || "healthPotion",
															text = || __R(70, "Heal him."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitZapper"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(71, "We gave him one of our potions and waited until he felt better.\n\n\"Mmm.... Electrifying! Ready to go, fellas!\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														},

														{
															type = DialogType.Custom,
															subtype = "item",
						                  					item = || "elixirOfLife",
															text = || __R(72, "Heal him."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitZapper"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(73, "We gave him one of our potions and waited until he felt better.\n\n\"Mmm.... Electrifying! Ready to go, fellas!\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														},

														{
															type = DialogType.Custom,
															subtype = "item",
						                  					item = || "bandage",
															text = || __R(74, "Heal him."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitZapper"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(75, "We gave him one of our bandages and waited until he felt better.\n\n\"Mmm.... Electrifying! Ready to go, fellas!\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														},

														{
											            	type = DialogType.Response,
											            	text = || __R(76, "Keep going."),
											            	jumpTo = "keepGoing"
										            	}
										    		}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.recruit == "orcCleaver",
										            text = || __D(77, "As we got closer, we found an orc cleaver with grievous (although not mortal) wounds.\n\n\"Arrghh ... this is a pretty big flesh wound.\""),
										    		who = || "mapCinematicId",
										            children = {
										    			{
															type = DialogType.Custom,
															subtype = "item",
						                  					item = || "healthPotion",
															text = || __R(78, "Heal him."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitOrcCleaver"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(79, "We gave him one of our potions and waited until he felt better.\n\n\"See, told you it was just a flesh wound. Let's go!\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														},

														{
															type = DialogType.Custom,
															subtype = "item",
						                  					item = || "elixirOfLife",
															text = || __R(80, "Heal him."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitOrcCleaver"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(81, "We gave him one of our potions and waited until he felt better.\n\n\"See, told you it was just a flesh wound. Let's go!\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														},

														{
															type = DialogType.Custom,
															subtype = "item",
						                  					item = || "bandage",
															text = || __R(82, "Heal him."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitOrcCleaver"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(83, "We gave him one of our bandages and waited until he felt better.\n\n\"See, told you it was just a flesh wound. Let's go!\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														},

														{
											            	type = DialogType.Response,
											            	text = || __R(84, "Keep going."),
											            	jumpTo = "keepGoing"
										            	}
										    		}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.recruit == "sorceress",
										            text = || __D(85, "As we got closer, we found a sorceress with grievous (although not mortal) wounds.\n\n\"Ooof ... my bones ache like craaaaazy!\""),
										    		who = || "mapCinematicId",
										            children = {
										    			{
															type = DialogType.Custom,
															subtype = "item",
						                  					item = || "healthPotion",
															text = || __R(86, "Heal her."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitSorceress"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(87, "We gave her one of our potions and waited until she felt better.\n\n\"Ha! Thought I was done for? Nonsense! Let's get going, sweeties.\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														},

														{
															type = DialogType.Custom,
															subtype = "item",
						                  					item = || "elixirOfLife",
															text = || __R(88, "Heal her."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitSorceress"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(89, "We gave her one of our potions and waited until she felt better.\n\n\"Ha! Thought I was done for? Nonsense! Let's get going, sweeties.\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														},

														{
															type = DialogType.Custom,
															subtype = "item",
						                  					item = || "bandage",
															text = || __R(90, "Heal her."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitSorceress"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(91, "We gave her one of our bandages and waited until she felt better.\n\n\"Ha! Thought I was done for? Nonsense! Let's get going, sweeties.\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														},

														{
											            	type = DialogType.Response,
											            	text = || __R(92, "Keep going."),
											            	jumpTo = "keepGoing"
										            	}
										    		}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.recruit == "sylvanElf",
										            text = || __D(94, "As we got closer, we found a sylvan elf with grievous (although not mortal) wounds.\n\n\"I guess ... I wasn't ... fast enough....\""),
										    		who = || "mapCinematicId",
										            children = {
										    			{
															type = DialogType.Custom,
															subtype = "item",
						                  					item = || "healthPotion",
															text = || __R(95, "Heal him."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitSylvanElf"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(96, "We gave him one of our potions and waited until he felt better.\n\n\"Thanks for lending me a hand. I will return the favor now, if you don't mind.\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														},

														{
															type = DialogType.Custom,
															subtype = "item",
						                  					item = || "elixirOfLife",
															text = || __R(97, "Heal him."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitSylvanElf"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(98, "We gave him one of our potions and waited until he felt better.\n\n\"Thanks for lending me a hand. I will return the favor now, if you don't mind.\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														},

														{
															type = DialogType.Custom,
															subtype = "item",
						                  					item = || "bandage",
															text = || __R(99, "Heal him."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitSylvanElf"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(100, "We gave him one of our bandages and waited until he felt better.\n\n\"Thanks for lending me a hand. I will return the favor now, if you don't mind.\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														},

														{
											            	type = DialogType.Response,
											            	text = || __R(101, "Keep going."),
											            	jumpTo = "keepGoing"
										            	}
										    		}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.recruit == "enchantress",
										            text = || __D(94, "As we got closer, we found an an ashervan enchantress with grievous (although not mortal) wounds.\n\n\"The Soil will take me....\""),
										    		who = || "mapCinematicId",
										            children = {
										    			{
															type = DialogType.Custom,
															subtype = "item",
						                  					item = || "healthPotion",
															text = || __R(95, "Heal her."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitEnchantress"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(96, "We gave her one of our potions and waited until she felt better.\n\n\"Your kindness is appreciated. I will show my deepest sincerity and loyalty to you.\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														},

														{
															type = DialogType.Custom,
															subtype = "item",
						                  					item = || "elixirOfLife",
															text = || __R(97, "Heal her."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitEnchantress"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(98, "We gave her one of our potions and waited until she felt better.\n\n\"Your kindness is appreciated. I will show my deepest sincerity and loyalty to you.\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														},

														{
															type = DialogType.Custom,
															subtype = "item",
						                  					item = || "bandage",
															text = || __R(99, "Heal her."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitEnchantress"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(100, "We gave her one of our bandages and waited until she felt better.\n\n\"Your kindness is appreciated. I will show my deepest sincerity and loyalty to you.\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														},

														{
											            	type = DialogType.Response,
											            	text = || __R(101, "Keep going."),
											            	jumpTo = "keepGoing"
										            	}
										    		}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.recruit == "necromancer",
										            text = || __D(94, "As we got closer, we found an a necromancer with grievous (although not mortal) wounds.\n\n\"Perhaps death is a mercy....\""),
										    		who = || "mapCinematicId",
										            children = {
										    			{
															type = DialogType.Custom,
															subtype = "item",
						                  					item = || "healthPotion",
															text = || __R(95, "Heal it."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitNecromancer"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(96, "We gave it one of our potions and waited until it felt better.\n\n\"Thanks to you, I have not found my grave today. Allow me to repay you.\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														},

														{
															type = DialogType.Custom,
															subtype = "item",
						                  					item = || "elixirOfLife",
															text = || __R(97, "Heal it."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitNecromancer"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(98, "We gave it one of our potions and waited until it felt better.\n\n\"Thanks to you, I have not found my grave today. Allow me to repay you.\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														},

														{
															type = DialogType.Custom,
															subtype = "item",
						                  					item = || "bandage",
															text = || __R(99, "Heal it."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitNecromancer"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(100, "We gave it one of our bandages and waited until it felt better.\n\n\"Thanks to you, I have not found my grave today. Allow me to repay you.\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														},

														{
											            	type = DialogType.Response,
											            	text = || __R(101, "Keep going."),
											            	jumpTo = "keepGoing"
										            	}
										    		}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.recruit == "cleric",
										            text = || __D(94, "As we got closer, we found an a cleric with grievous (although not mortal) wounds.\n\n\"... I see ... the light ...\""),
										    		who = || "mapCinematicId",
										            children = {
										    			{
															type = DialogType.Custom,
															subtype = "item",
						                  					item = || "healthPotion",
															text = || __R(95, "Heal him."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitCleric"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(96, "We gave him one of our potions and waited until he felt better.\n\n\"My prayers have been answered! Allow me to repay you for you kindness.\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														},

														{
															type = DialogType.Custom,
															subtype = "item",
						                  					item = || "elixirOfLife",
															text = || __R(97, "Heal it."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitCleric"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(98, "We gave him one of our potions and waited until he felt better.\n\n\"My prayers have been answered! Allow me to repay you for you kindness.\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														},

														{
															type = DialogType.Custom,
															subtype = "item",
						                  					item = || "bandage",
															text = || __R(99, "Heal it."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitCleric"),
															children = {
																{
																	type = DialogType.Dialog,
							                                    	text = || __D(100, "We gave him one of our bandages and waited until he felt better.\n\n\"My prayers have been answered! Allow me to repay you for you kindness.\""),
														    		who = || "mapCinematicId",
														    		exit = true
																}
													        }
														},

														{
											            	type = DialogType.Response,
											            	text = || __R(101, "Keep going."),
											            	jumpTo = "keepGoing"
										            	}
										    		}
										        }
										    }
										},
										{
							            	type = DialogType.Response,
							            	text = || __R(93, "Keep going."),
							            	jumpTo = "keepGoing"
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
																				{"MinionFemaleKnightLvl2"}
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitRanger", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionRangerLvl2"}
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitMage", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionArcaneMageLvl2"}
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitBarbarian", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionBarbarianLvl2"}
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitBombardier", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionDwarfBombardierLvl2"}
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitDarkKnight", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionDarkKnightLvl2"}
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitWitchDoctor", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionWitchDoctorLvl2"}
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitSasquatch", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionSasquatchLvl2"}
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitZapper", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionTeslaLvl2"}
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitOrcCleaver", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionOrcCleaverLvl2"}
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitSorceress", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionSorceressLvl2"}
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitSylvanElf", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionSylvanElfLvl2"}
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitEnchantress", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionEnchantressLvl2"}
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitNecromancer", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionNecromancerLvl2"}
																				)
																				}
																			)),
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitCleric", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionClericLvl2"}
																				)
																				}
																			))		
								}))
	helper.AddQuest(quest)
	quest.revealDistance = 0
	do
		local quest = helper.CloneQuestDefinition("SecondWind")
		quest.id = "SecondWind2"
		helper.AddQuest(quest)
	end
	do
		local quest = helper.CloneQuestDefinition("SecondWind")
		quest.id = "SecondWind3"
		helper.AddQuest(quest)
	end
end
