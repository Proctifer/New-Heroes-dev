

do 
	local quest = helper.QuestDefinition();
	quest.id = 'GreaterHornItemEphemeral'
	
	
	quest.encounters = {}
	quest.tags = {}

	local theDialog =  dialogs.CreateDialog("intro",  
						    {
						        {
						        	type = DialogType.Dialog,
						            narrator = || __N(1, "Greater Horn of Heroes"),
						            text = || __D(2, "We hold the Greater Horn of Heroes, ready to blow it and see who shows up to answer the call to adventure."),
						    		icon = || "Asst_MercenaryCamp",
						    		who = || "mapCinematicId",
						            children = {
								        {
		                                    type = DialogType.Response,
		                                    text = || __R(3, "Blow the horn!"),
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
		                                    	if( cinematicMapHelper.HeroByTag("OrcCleaver") == nil ) then
		                                    		table.insert(heroesAvailable, "orcCleaver")
		                                    	end
		                                    	if( cinematicMapHelper.HeroByTag("WitchDoctor") == nil ) then
		                                    		table.insert(heroesAvailable, "witchDoctor")
		                                    	end
		                                    	if( cinematicMapHelper.HeroByTag("Sasquatch") == nil ) then
		                                    		table.insert(heroesAvailable, "sasquatch")
		                                    	end
		                                    	if( cinematicMapHelper.HeroByTag("Tesla") == nil ) then
		                                    		table.insert(heroesAvailable, "tesla")
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
										            text = || __D(4, "A few minutes after blowing the horn, a knight approached us."),
										    		who = || "mapCinematicId",
										            children = {
										    			{
															type = DialogType.Response,
															text = || __R(5, "Talk to the knight."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitKnight"),
															exit = true
														}
													}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.recruit == "ranger",
										            text = || __D(6, "A few minutes after blowing the horn, a ranger approached us."),
										    		who = || "mapCinematicId",
										            children = {
										    			{
															type = DialogType.Response,
															text = || __R(7, "Talk to the ranger."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitRanger"),
															exit = true
														}
													}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.recruit == "mage",
										            text = || __D(8, "A few minutes after blowing the horn, a wizard approached us."),
										    		who = || "mapCinematicId",
										            children = {
										    			{
															type = DialogType.Response,
															text = || __R(9, "Talk to the wizard."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitMage"),
															exit = true
														}
													}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.recruit == "barbarian",
										            text = || __D(10, "A few minutes after blowing the horn, a barbarian approached us."),
										    		who = || "mapCinematicId",
										            children = {
										    			{
															type = DialogType.Response,
															text = || __R(11, "Talk to the barbarian."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitBarbarian"),
															exit = true
														}
													}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.recruit == "bombardier",
										            text = || __D(12, "A few minutes after blowing the horn, a bombardier approached us."),
										    		who = || "mapCinematicId",
										            children = {
										    			{
															type = DialogType.Response,
															text = || __R(13, "Talk to the bombardier."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitBombardier"),
															exit = true
														}
													}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.recruit == "darkKnight",
										            text = || __D(14, "A few minutes after blowing the horn, a Dark Knight approached us."),
										    		who = || "mapCinematicId",
										            children = {
										    			{
															type = DialogType.Response,
															text = || __R(15, "Talk to the Dark Knight."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitDarkKnight"),
															exit = true
														}
													}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.recruit == "orcCleaver",
										            text = || __D(16, "A few minutes after blowing the horn, an orc cleaver approached us."),
										    		who = || "mapCinematicId",
										            children = {
										    			{
															type = DialogType.Response,
															text = || __R(17, "Talk to the orc cleaver."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitOrcCleaver"),
															exit = true
														}
													}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.recruit == "witchDoctor",
										            text = || __D(18, "A few minutes after blowing the horn, a witch doctor approached us."),
										    		who = || "mapCinematicId",
										            children = {
										    			{
															type = DialogType.Response,
															text = || __R(19, "Talk to the witch doctor."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitWitchDoctor"),
															exit = true
														}
													}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.recruit == "sasquatch",
										            text = || __D(20, "A few minutes after blowing the horn, a sasquatch approached us."),
										    		who = || "mapCinematicId",
										            children = {
										    			{
															type = DialogType.Response,
															text = || __R(21, "Talk to the sasquatch."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitSasquatch"),
															exit = true
														}
													}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.recruit == "tesla",
										            text = || __D(22, "A few minutes after blowing the horn, a zapper approached us."),
										    		who = || "mapCinematicId",
										            children = {
										    			{
															type = DialogType.Response,
															text = || __R(23, "Talk to the zapper."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitTesla"),
															exit = true
														}
													}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.recruit == "sorceress",
										            text = || __D(24, "A few minutes after blowing the horn, a sorceress approached us."),
										    		who = || "mapCinematicId",
										            children = {
										    			{
															type = DialogType.Response,
															text = || __R(25, "Talk to the sorceress."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitSorceress"),
															exit = true
														}
													}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.recruit == "sylvanElf",
										            text = || __D(24, "A few minutes after blowing the horn, a sylvan elf approached us."),
										    		who = || "mapCinematicId",
										            children = {
										    			{
															type = DialogType.Response,
															text = || __R(25, "Talk to the elf."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitSylvanElf"),
															exit = true
														}
													}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.recruit == "enchantress",
										            text = || __D(24, "A few minutes after blowing the horn, an ashervan enchantress approached us."),
										    		who = || "mapCinematicId",
										            children = {
										    			{
															type = DialogType.Response,
															text = || __R(25, "Talk to the High Enchantress."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitEnchantress"),
															exit = true
														}
													}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.recruit == "necromancer",
										            text = || __D(24, "A few minutes after blowing the horn, a necromancer approached us."),
										    		who = || "mapCinematicId",
										            children = {
										    			{
															type = DialogType.Response,
															text = || __R(25, "Talk to the necromancer."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitNecromancer"),
															exit = true
														}
													}
										        },
										        {
										            type = DialogType.Dialog,
										            condition = |d| d.data.recruit == "cleric",
										            text = || __D(24, "A few minutes after blowing the horn, a cleric approached us."),
										    		who = || "mapCinematicId",
										            children = {
										    			{
															type = DialogType.Response,
															text = || __R(25, "Talk to the cleric."),
															onChoose = || cinematicMapHelper.CurrentQuestStatus().context.SetObject("option", "recruitCleric"),
															exit = true
														}
													}
										        }
										    }
										}
										
		        
		        
										
		        
									}
								}
							})

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
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitOrcCleaver", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionOrcCleaverLvl2"}
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
										cinematicMapHelper.ConditionalIf(|| cinematicMapHelper.CurrentQuestStatus().context.GetObject("option") == "recruitTesla", 
																			cinematicMapHelper.Sequence({
																					cinematicMapHelper.ShowTeamManage(||"Team Manage",|| 
																				{"MinionTeslaLvl2"}
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

	quest.results = {
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

	}

	quest.consumesDay = || false

	helper.AddQuest(quest)
	quest.revealDistance = 1
end
