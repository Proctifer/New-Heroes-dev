


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateGenericPrefab(nil, "MountainBossFightDebugPanel")
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicMountainFightBoss")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	
		 cinematicHelper.Instant(function ()
			abilitiesHelper.ApplyModifier(cinematicHelper.FindCinematicUnit("TURNMARKER").GetUnit(), "no_glare_mbf_win_achievement_trait_modifier")
		 end),
		   cinematicHelper.Instant(function ()
		 	local spawnPosition = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("cinSpawnPos03"))
			local unit = cinematicHelper.SpawnUnitI(
				{
				unitId = "MBFCrystalMinion",
				position = spawnPosition,
				unitGroup = UnitGroup.BadSide,
				isAI = true,
				initiativeOrder = 1,
				tags = {"cinCrystal03"}
				})
		end),

		 
		 cinematicHelper.SetAutoShowHud(false),
		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		 cinematicHelper.CameraZoom("IN_GAME"),
	   cinematicHelper.SetCinematicBarsVisibility(true),
		 cinematicHelper.SetCurtain(true),
		 cinematicHelper.Sleep(1),

		
		
		
		
		
		
		
		
		
		 


		
		
		
		
		
		
		
		
		
		
		

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

		
		
		
		
		
		
		
		
			

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
				
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

		
		
		






		
	     cinematicHelper.SetCinematicBarsVisibility(true),

		 cinematicHelper.SetCurtain(true),
		
		 
		
		 
		 cinematicHelper.Sleep(2),
		 cinematicHelper.Parallel({
			cinematicHelper.Sequence({	
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("CameraPosIntro")}, || 1),
			}),	
			cinematicHelper.Sequence({	
				cinematicHelper.CameraZoom("IN_GAME"),
			}),	
		}),
		 cinematicHelper.Sleep(0.3),
		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("HarbingerBoss"),"Speak")),
		 cinematicHelper.ShowComment(|| "HarbingerBoss", || __C(1, "Yes!\nThe tower is ready\nat last!"), 2.5), 
		cinematicHelper.Sleep(2.8),
		 
		 
		 
		 cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("HarbingerBoss")}, || "Right"),
		 cinematicHelper.Sleep(0.3),
		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("HarbingerBoss"),"Speak")),
		 cinematicHelper.ShowComment(|| "HarbingerBoss", || __C(2, "See that, Chief?"), 1.5), 
		cinematicHelper.Sleep(1.8),
		
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("HarbingerBoss"), || "Victory"),
		 cinematicHelper.ShowComment(|| "HarbingerBoss", || __C(3, "Stormcloud\nis finally ours!"), 2), 
		cinematicHelper.Sleep(2.3),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("HarbingerBoss")),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("HarbingerBoss"),"Speak")),
		 cinematicHelper.ShowComment(|| "HarbingerBoss", || __C(4, "I mean..."), 1), 
		cinematicHelper.Sleep(1.3),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("HarbingerBoss"),"Speak")),
		 cinematicHelper.ShowComment(|| "HarbingerBoss", || __C(5, "Yours..."), 1), 
		cinematicHelper.Sleep(1.3),
		cinematicHelper.Parallel({
			cinematicHelper.Sequence({	
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("CameraPosIntro2")}, || 1),
			}),	
			cinematicHelper.Sequence({	
				cinematicHelper.CameraZoom("cinematic"),
			}),	
		}),

		 cinematicHelper.Instant(function ()
		 	local spawnPosition = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("introPos01"))
			local unit = cinematicHelper.SpawnUnitI(
				{
				unitId = "CultistPriest",
				position = spawnPosition,
				unitGroup = UnitGroup.BadSide,
				isAI = true,
				initiativeOrder = 1,
				spawnFX = "SummonCultistSmokeFXMega",
				isFlipped=true,
				tags = {"enemy06"}
				})
		end),
		 cinematicHelper.Instant(function ()
		 	local spawnPosition = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("introPos02"))
			local unit = cinematicHelper.SpawnUnitI(
				{
				unitId = "CultistPriest",
				position = spawnPosition,
				unitGroup = UnitGroup.BadSide,
				isAI = true,
				initiativeOrder = 1,
				spawnFX = "SummonCultistSmokeFXMega",
				isFlipped=true,
				tags = {"enemy07"}
				})
		end),
		 cinematicHelper.Sleep(1.5),
		 cinematicHelper.Parallel({
			cinematicHelper.Sequence({	
				
				cinematicHelper.MoveCinematicUnit("enemy06", "cinPos01", true),
			}),
			cinematicHelper.Sequence({	
				cinematicHelper.Sleep(0.2),
				cinematicHelper.MoveCinematicUnit("enemy07", "cinPos02", true),
			}),	
			cinematicHelper.Sequence({	
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("CameraPosIntro4")}, || 1.5),
			}),	
			cinematicHelper.Sequence({	
				cinematicHelper.Sleep(0.2),
				cinematicHelper.CameraZoom("IN_GAME"),
			}),
		}),
		 
		 cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("enemy06")}, || "Right"),
		 cinematicHelper.Sleep(0.5),
		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("HarbingerBoss"),"Speak")),
		cinematicHelper.ShowComment(|| "HarbingerBoss", || __C(6, "Just in time!\n"), 1.5), 
		cinematicHelper.Sleep(1.8),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("HarbingerBoss"),"Speak")),
		cinematicHelper.ShowComment(|| "HarbingerBoss", || __C(7, "You come to marvel\nat the new tower?"), 2.5), 
		cinematicHelper.Sleep(2.8),
		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("enemy07"),"Speak")),
		cinematicHelper.ShowComment(|| "enemy07", || __C(8, "Silence!\n"), 1), 
		cinematicHelper.Sleep(1.3),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("enemy06"),"Speak")),
		cinematicHelper.ShowComment(|| "enemy06", || __C(9, "Your trolls have\nfailed to stop them."), 2), 
		cinematicHelper.Sleep(2.3),
		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("HarbingerBoss"),"Speak")),
		cinematicHelper.ShowComment(|| "HarbingerBoss", || __C(10, "W-what?\n"), 1),  
		cinematicHelper.Sleep(1.3),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("enemy06"),"Speak")),
		cinematicHelper.ShowComment(|| "enemy06", || __C(11, "Iriza demands\ntheir sacrifice."), 2.2), 
		cinematicHelper.Sleep(2.5),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("HarbingerBoss"),"Speak")),
		cinematicHelper.ShowComment(|| "HarbingerBoss", || __C(12, "Grrr!!!\nI'll do it myself."), 2), 
		cinematicHelper.Sleep(2.2),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("enemy07"),"Speak")),
		cinematicHelper.ShowComment(|| "enemy07", || __C(13, "Here they come!"), 1.5), 
		cinematicHelper.Sleep(1.8),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("enemy07"),"Speak")),
		cinematicHelper.ShowComment(|| "enemy07", || __C(14, "Do not fail us ...\nagain!"), 2), 
		cinematicHelper.Sleep(1.5),
		cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("enemy06")}, || "Left"),
		cinematicHelper.Sleep(0.7),
	
		 cinematicHelper.Parallel({	
		 	cinematicHelper.Sequence({	
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("CameraPosIntro3")}, || 1),
			}),	
			cinematicHelper.Sequence({	
				cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("HarbingerBoss")}, || "Left"),
			}),	
			cinematicHelper.Sequence({	
				cinematicHelper.CameraZoom("cinematic"),
				
			}),	
		 	cinematicHelper.Sequence({
		 		cinematicHelper.Sleep(1),
				cinematicHelper.MoveTeamToTarget(|| cinematicHelper.GetHeroTeam(), 
											 	 || {cinematicHelper.FindCinematicPos("heroPos01"), 
											 	     cinematicHelper.FindCinematicPos("heroPos02"), 
											 	     cinematicHelper.FindCinematicPos("heroPos03"), 
											 	     cinematicHelper.FindCinematicPos("heroPos04")},
											 	 || true),
			}),
			cinematicHelper.Sequence({
					
				cinematicHelper.MoveCinematicUnit("enemy06", "enemyPos07", true),
				cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("enemy06")}, || "Left"),
			}),	
		}),
		 
		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
		 cinematicHelper.ShowComment(|| "Legend", || __C(15, "Stop!"), 1), 
		cinematicHelper.Sleep(1.2),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
		 cinematicHelper.ShowComment(|| "Legend", || __C(16, "Stormcloud does\nnot belong to you!"), 1), 
		cinematicHelper.Sleep(0.8),
		cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("enemy07")}, || "Left"),
		cinematicHelper.Sleep(0.2),
		cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("enemy06")}, || "Left"),
		cinematicHelper.Sleep(0.2),
		cinematicHelper.ConditionalIf(|| cinematicHelper.UnitExists("Gerald"),
			cinematicHelper.Sequence({
				 
				 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("enemy06"),"Speak")),
				cinematicHelper.ShowComment(|| "enemy06", || __C(17, "Sir Gerald...\n"), 1), 
				cinematicHelper.Sleep(1.2),
				cinematicHelper.ShowComment(|| "enemy06", || __C(18, "...\n\n"), 1), 
				cinematicHelper.Sleep(1.2),
				 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("enemy06"),"Speak")),
				cinematicHelper.ShowComment(|| "enemy06", || __C(19, "You should have\nretired already."), 2.3), 
				cinematicHelper.Sleep(2.5),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Gerald"),"Speak")),
				cinematicHelper.ShowComment(|| "Gerald", || __C(20, "I'll make you\nwish I had."), 2), 
				cinematicHelper.Sleep(2.3),
			 })),
		cinematicHelper.ConditionalIf(|| cinematicHelper.UnitExists("Asra"),
			cinematicHelper.Sequence({
				 
				 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("enemy06"),"Speak")),
				cinematicHelper.ShowComment(|| "enemy06", || __C(21, "Asra...\n"), 1), 
				cinematicHelper.Sleep(1.2),
				cinematicHelper.ShowComment(|| "enemy06", || __C(22, "...\n\n"), 1), 
				cinematicHelper.Sleep(1.2),
				 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("enemy06"),"Speak")),
				cinematicHelper.ShowComment(|| "enemy06", || __C(23, "So the\nshadow assassin\nis a hero now?"), 2.3), 
				cinematicHelper.Sleep(2.5),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Asra"),"Speak")),
				cinematicHelper.ShowComment(|| "Asra", || __C(24, "When it comes\nto you..."), 2), 
				cinematicHelper.Sleep(2.2),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Asra"),"Speak")),
				cinematicHelper.ShowComment(|| "Asra", || __C(25, "still an assassin."), 2), 
				cinematicHelper.Sleep(2.3),
			 })),
		cinematicHelper.ConditionalIf(|| cinematicHelper.UnitExists("Oloch"),
			cinematicHelper.Sequence({
				 
				 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("enemy06"),"Speak")),
				cinematicHelper.ShowComment(|| "enemy06", || __C(26, "The Demon Lord!\n"), 1), 
				cinematicHelper.Sleep(1.2),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("enemy06"),"Speak")),
				cinematicHelper.ShowComment(|| "enemy06", || __C(27, "I wouldn't have\npictured you here..."), 2.3), 
				cinematicHelper.Sleep(2.3),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("enemy06"),"Speak")),
				cinematicHelper.ShowComment(|| "enemy06", || __C(28, "even in my\nwildest dreams."), 2.3), 
				cinematicHelper.Sleep(2.5),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Oloch"),"Speak")),
				cinematicHelper.ShowComment(|| "Oloch", || __C(29, "How about..."), 1.5), 
				cinematicHelper.Sleep(1.5),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Oloch"),"Speak")),
				cinematicHelper.ShowComment(|| "Oloch", || __C(30, "your wildest nightmares?"), 2), 
				cinematicHelper.Sleep(2.3),
			 })),
			 cinematicHelper.ConditionalIf(|| cinematicHelper.UnitExists("Bravebark"),
				 cinematicHelper.Sequence({
					  
					  cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("enemy06"),"Speak")),
					 cinematicHelper.ShowComment(|| "enemy06", || __C(26, "Bravebark!\n"), 1), 
					 cinematicHelper.Sleep(1.5),
					 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("enemy06"),"Speak")),
					 cinematicHelper.ShowComment(|| "enemy06", || __C(27, "I thought you\nfaded away..."), 2.3), 
					 cinematicHelper.Sleep(2.3),
					 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("enemy06"),"Speak")),
					 cinematicHelper.ShowComment(|| "enemy06", || __C(28, "just like the rest\nof your people."), 2.3), 
					 cinematicHelper.Sleep(2.5),
					 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Bravebark"),"Speak")),
					 cinematicHelper.ShowComment(|| "Bravebark", || __C(29, "They live on in me,"), 2), 
					 cinematicHelper.Sleep(2.2),
					 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Bravebark"),"Speak")),
					 cinematicHelper.ShowComment(|| "Bravebark", || __C(30, "but you\nwill die today."), 2), 
					 cinematicHelper.Sleep(2.3),
				  })),
			 cinematicHelper.ConditionalIf(|| cinematicHelper.UnitExists("Regson"),
				 cinematicHelper.Sequence({
					  
					  cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("enemy06"),"Speak")),
					 cinematicHelper.ShowComment(|| "enemy06", || __C(26, "Regson...\n"), 1.3), 
					 cinematicHelper.Sleep(1.4),
					 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("enemy06"),"Speak")),
					 cinematicHelper.ShowComment(|| "enemy06", || __C(27, "The false\nTwilight King..."), 2.3), 
					 cinematicHelper.Sleep(2.4),
					 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("enemy06"),"Speak")),
					 cinematicHelper.ShowComment(|| "enemy06", || __C(28, "Did your kind\nabandon you?"), 2.3), 
					 cinematicHelper.Sleep(2.5),
					 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Regson"),"Speak")),
					 cinematicHelper.ShowComment(|| "Regson", || __C(29, "I saved my\nkingdom once,"), 2), 
					 cinematicHelper.Sleep(2.2),
					 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Regson"),"Speak")),
					 cinematicHelper.ShowComment(|| "Regson", || __C(30, "I will save the\nworld from you."), 2), 
					 cinematicHelper.Sleep(2.2)
				  })),
		cinematicHelper.ConditionalIf(|| cinematicHelper.UnitExists("Bruxa"),
			cinematicHelper.Sequence({
				 
				 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("enemy06"),"Speak")),
				cinematicHelper.ShowComment(|| "enemy06", || __C(31, "The famed Bruxa!\n"), 1.5),  
				cinematicHelper.Sleep(1.8),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("enemy06"),"Speak")),
				cinematicHelper.ShowComment(|| "enemy06", || __C(32, "What a blessing...."), 2), 
				cinematicHelper.Sleep(2.3),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Bruxa"),"Speak")),
				cinematicHelper.ShowComment(|| "Bruxa", || __C(33, "Don't you mean a curse?"), 2), 
				cinematicHelper.Sleep(2.3),
			 })),
		cinematicHelper.Parallel({
			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("CameraPosIntro4")}, || 0.4),
			cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("HarbingerBoss"), || "Angry"),
		}),
		cinematicHelper.ShowComment(|| "HarbingerBoss", || __C(34, "Arrrgggh ...\nthis ends here!"), 1.5), 
		cinematicHelper.Sleep(1.7),
		
		
		 cinematicHelper.Parallel({
			cinematicHelper.Sequence({	
				cinematicHelper.ShowComment(|| "HarbingerBoss", || __C(35, "Charge up the\ntowerrr!!!"), 2), 
				cinematicHelper.Sleep(2.3),
				cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("HarbingerBoss")),
			}),	
			cinematicHelper.Sequence({	
				cinematicHelper.MoveCinematicUnit("enemy01", "enemyPos01", true),
			}),	
			cinematicHelper.Sequence({	
				cinematicHelper.MoveCinematicUnit("enemy02", "enemyPos02", true),
			}),		
			cinematicHelper.Sequence({	
				cinematicHelper.MoveCinematicUnit("enemy03", "enemyPos03", true),
			}),		
			cinematicHelper.Sequence({	
				cinematicHelper.MoveCinematicUnit("enemy04", "enemyPos04", true),
			}),
			cinematicHelper.Sequence({	
				cinematicHelper.MoveCinematicUnit("enemy05", "enemyPos05", true),
			}),	
			
			cinematicHelper.Sequence({	
				cinematicHelper.MoveCinematicUnit("enemy07", "enemyPos06", true),
			}),	
		}),


		 cinematicHelper.Sequence({
				cinematicHelper.Sleep(0.5),
				
				
				

		}),
		
	}))

encounterLogic.AddCinematic("OnEnd",cinematicHelper.Cinematic({

	

		cinematicHelper.FinishCinematicSkip(),
		cinematicHelper.ConditionalIf(|| cinematicHelper.UnitExists("HighSorcerer"),
			cinematicHelper.Sequence({
				cinematicHelper.AddFxToPosition(|| "SummonCultistSmokeFXMega", ||  cinematicHelper.FindCinematicUnitPos("HighSorcerer")),
				cinematicHelper.TeleportUnit(|| cinematicHelper.FindCinematicUnit("HighSorcerer"),|| cinematicHelper.FixedPosition(1000,1000, 0)),
		})),
		cinematicHelper.ConditionalIf(|| cinematicHelper.UnitExists("SummonedSorcerer"),
			cinematicHelper.Sequence({
				cinematicHelper.AddFxToPosition(|| "SummonCultistSmokeFXMega", ||  cinematicHelper.FindCinematicUnitPos("SummonedSorcerer")),
				cinematicHelper.TeleportUnit(|| cinematicHelper.FindCinematicUnit("SummonedSorcerer"),|| cinematicHelper.FixedPosition(1000,1000, 0)),
		})),		
		
		cinematicHelper.SetAutoShowHud(true),
		cinematicHelper.NextMusicInPlayList(),
		 cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicUnitPos("Legend")}, || 1),
		 cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
		 cinematicHelper.ShowComment(|| "Legend", || __C(36, "Ulguk'Hai\nis dead for good!"), 2), 
		cinematicHelper.Sleep(2.3),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
		 cinematicHelper.ShowComment(|| "Legend", || __C(37, "Time to get to the\nbottom of this!"), 2.5), 
		cinematicHelper.Sleep(2.8),
		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicUnitPos("ct_minion")}, || 1),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("ct_minion"),"Speak")),
		 cinematicHelper.ShowComment(|| "ct_minion", || __C(38, "But ... how do we\nget there?"), 2), 
		cinematicHelper.Sleep(2.3),

		 cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("outroCam")}, || 1),
		cinematicHelper.Instant(function ()
		 	local spawnPosition = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("outroPos1"))
			local unit = cinematicHelper.SpawnUnitI(
				{
				unitId = "StormcloudHighSorcerer",
				position = spawnPosition,
				unitGroup = UnitGroup.GoodSide,
				isAI = true,
				spawnFX = "SummonCultistSmokeFXMega",
				tags = {"outroHighSorcerer"},
				})
		end),
		cinematicHelper.Instant(function ()
		 	local spawnPosition = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("outroPos2"))
			local unit = cinematicHelper.SpawnUnitI(
				{
				unitId = "StormcloudSorcerer",
				position = spawnPosition,
				unitGroup = UnitGroup.GoodSide,
				isAI = true,
				spawnFX = "SummonCultistSmokeFXMega",
				tags = {"outroSorcerer1"},
				})
		end),
		cinematicHelper.Instant(function ()
		 	local spawnPosition = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("outroPos3"))
			local unit = cinematicHelper.SpawnUnitI(
				{
				unitId = "StormcloudSorcerer",
				position = spawnPosition,
				unitGroup = UnitGroup.GoodSide,
				isAI = true,
				spawnFX = "SummonCultistSmokeFXMega",
				isFlipped= true,
				tags = {"outroSorcerer2"},
				})
		end),
		cinematicHelper.Sleep(2),
		cinematicHelper.Parallel({
			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicUnitPos("outroHighSorcerer")}, || 0.8),
			cinematicHelper.Sleep(0.5),
			
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("outroHighSorcerer"),"Speak")),
			cinematicHelper.ShowComment(|| "outroHighSorcerer", || __C(39, "We can help\nwith that!"), 2), 
		}),
		cinematicHelper.Sleep(2.5),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("outroHighSorcerer"),"Speak")),
		cinematicHelper.ShowComment(|| "outroHighSorcerer", || __C(40, "Get in the portal!"), 1.5), 
		cinematicHelper.Sleep(2),

		cinematicHelper.Parallel({
			cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("portalPos")}, || 0.5),
			cinematicHelper.Sleep(1),
			cinematicHelper.Sequence({
				cinematicHelper.ConditionalIf(|| cinematicHelper.UnitExists("Legend"),
					cinematicHelper.Sequence({
						cinematicHelper.Sleep(1.2),
						cinematicHelper.MoveCinematicUnit("Legend", "portalPos", true),
						cinematicHelper.AddFxToPosition(|| "PortalSorceressInFXMega", ||  cinematicHelper.FindCinematicUnitPos("Legend")),
						cinematicHelper.TeleportUnit(|| cinematicHelper.FindCinematicUnit("Legend"),|| cinematicHelper.FixedPosition(1000,1000, 0)),
					 })),
			}),	
			cinematicHelper.Sequence({
				cinematicHelper.ConditionalIf(|| cinematicHelper.UnitExists("hero02"),
					cinematicHelper.Sequence({
						cinematicHelper.Sleep(1.2),
						cinematicHelper.MoveCinematicUnit("hero02", "portalPos", true),
						cinematicHelper.AddFxToPosition(|| "PortalSorceressInFXMega", ||  cinematicHelper.FindCinematicUnitPos("hero02")),
						cinematicHelper.TeleportUnit(|| cinematicHelper.FindCinematicUnit("hero02"),|| cinematicHelper.FixedPosition(1000,1000, 0)),
					 })),
			}),	
			cinematicHelper.Sequence({
				cinematicHelper.ConditionalIf(|| cinematicHelper.UnitExists("hero03"),
					cinematicHelper.Sequence({
						cinematicHelper.Sleep(1.2),
						cinematicHelper.MoveCinematicUnit("hero03", "portalPos", true),
						cinematicHelper.AddFxToPosition(|| "PortalSorceressInFXMega", ||  cinematicHelper.FindCinematicUnitPos("hero03")),
						cinematicHelper.TeleportUnit(|| cinematicHelper.FindCinematicUnit("hero03"),|| cinematicHelper.FixedPosition(1000,1000, 0)),
					 })),
			}),	
			cinematicHelper.Sequence({
				cinematicHelper.ConditionalIf(|| cinematicHelper.UnitExists("hero01"),
					cinematicHelper.Sequence({
						cinematicHelper.Sleep(1.2),
						cinematicHelper.MoveCinematicUnit("hero01", "portalPos", true),
						cinematicHelper.AddFxToPosition(|| "PortalSorceressInFXMega", ||  cinematicHelper.FindCinematicUnitPos("hero01")),
						cinematicHelper.TeleportUnit(|| cinematicHelper.FindCinematicUnit("hero01"),|| cinematicHelper.FixedPosition(1000,1000, 0)),
					 })),
			}),
			cinematicHelper.Sequence({
				
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("outroHighSorcerer"),"PortalCastIn", "PortalSorceressCastingFXMega")),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("outroSorcerer1"),"PortalCastIn", "PortalSorceressCastingFXMega")),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("outroSorcerer2"),"PortalCastIn", "PortalSorceressCastingFXMega")),
				cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("outroHighSorcerer"), || "PortalCastLoop"),
				cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("outroSorcerer1"), || "PortalCastLoop"),
				cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("outroSorcerer2"), || "PortalCastLoop"),
				cinematicHelper.Sleep(1),
				
				cinematicHelper.AddFxToPosition(|| "PortalSorceressFXMega", || cinematicHelper.FindCinematicPos("portalPos")),
			}),	
		}),
		cinematicHelper.Sleep(0.5),
		cinematicHelper.SendEventToFXMega(|| cinematicHelper.FindCinematicGO("portal_sorceress_fx_mega"), || "stop"),
	
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("outroHighSorcerer"),"PortalCastOut")),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("outroSorcerer1"),"PortalCastOut")),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("outroSorcerer2"),"PortalCastOut")),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("outroHighSorcerer")),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("outroSorcerer1")),
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("outroSorcerer2")),
		cinematicHelper.Sleep(1),
		
		cinematicHelper.Sleep(1),

		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("HeroUnit"),"Victory")),
		cinematicHelper.Sequence({
			cinematicHelper.Sleep(1),
			cinematicHelper.Parallel({
				cinematicHelper.FadeScreenFX(false),
				cinematicHelper.Sleep(1)
			}),
			cinematicHelper.GoToVictoryScreen(),
			cinematicHelper.WaitUntil(|| false) 

			
		}),

	}))

encounterLogic.AddCinematic("OnLose",cinematicHelper.Cinematic({
		

		cinematicHelper.ConditionalIfElse(|| cinematicHelper.UnitExists("HarbingerBoss"),
			cinematicHelper.Sequence({
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicUnitPos("HarbingerBoss")}, || 1.5),
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("HarbingerBoss"),"Speak")),
				 cinematicHelper.ShowComment(|| "HarbingerBoss", || __C(41, "I knew this\nwas a job for\nthe Ha'Kraj!"), 2.5), 
				cinematicHelper.Sleep(2.8),
			 }),
			cinematicHelper.Sequence({
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicUnitPos("UlgukHaiBoss")}, || 1.5),
				
				
				cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("UlgukHaiBoss"),"AngrySpecial")),
				 cinematicHelper.ShowComment(|| "UlgukHaiBoss", || __C(42, "Revenge is\na dish best served\nfreezing cold.\n"), 2.9), 
				cinematicHelper.Sleep(3),
				cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("UlgukHaiBoss")),
			 })),
		cinematicHelper.Sleep(0.5),
		cinematicHelper.CameraLooksAtAllUnits(),
		cinematicHelper.ShowDefeated(),
	}))


encounterLogic.AddCinematic("GlareTowerFocus",cinematicHelper.Cinematic({
		cinematicHelper.FinishCinematicSkip(),
		cinematicHelper.Sequence({
			cinematicHelper.ConditionalIf(|| not(cinematicHelper.UnitStat("HarbingerBoss","turnsPlayed",0) == 0),
				cinematicHelper.Sequence({
					cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("TowerGlareCameraCenter")}, || 1),
			}))
		}),
			
		

		
		cinematicHelper.ConditionalIf(|| cinematicHelper.UnitStat("HarbingerBoss","turnsPlayed",0) == 0,
			cinematicHelper.Sequence({
				cinematicHelper.SetCinematicBarsVisibility(true),
				cinematicHelper.SetIngameHudVisibilityFixed(false),
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("heroPos03")}, || 1),
				cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("hero02")}, || "Left"),
				cinematicHelper.Sleep(0.5),
				cinematicHelper.Parallel({
					cinematicHelper.Sequence({	
						cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("Legend")}, || "Left"),
						cinematicHelper.Sleep(0.2),
						cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
						cinematicHelper.ShowComment(|| "Legend", || __C(43, "Watch out!!!"), 1.52),  
						cinematicHelper.Sleep(1.8),
					}),	
					cinematicHelper.Sequence({	
						cinematicHelper.Sleep(0.3),
						cinematicHelper.MoveCinematicUnit("hero02", "heroPos05", true),

					}),		
				}),
				
				
				
		})),
		cinematicHelper.ReleaseCameraControl(),
		
		
	}))

encounterLogic.AddCinematic("HarbingerFocus",cinematicHelper.Cinematic({

		
		cinematicHelper.Sequence({
			cinematicHelper.FinishCinematicSkip(),
			cinematicHelper.ConditionalIf(|| cinematicHelper.UnitStat("HarbingerBoss","turnsPlayed",0) == 1 ,
				cinematicHelper.Sequence({
					cinematicHelper.SetCinematicBarsVisibility(false),
					cinematicHelper.SetIngameHudVisibilityFixed(true),
				})),
			cinematicHelper.ConditionalIf(|| cinematicHelper.UnitStat("HarbingerBoss","turnsPlayed",0) == 2 ,
				cinematicHelper.Sequence({
					cinematicHelper.Wrap(function ()
						local spawnPosition01 = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("spawnPos01"))
						return cinematicHelper.Sequence({
							
							cinematicHelper.CameraLooksAtPositions(|| {spawnPosition01}, || 1),

							cinematicHelper.Instant(function ()
								local unit = cinematicHelper.SpawnUnitI(
									{
									unitId = "CultistExalted",
									position = spawnPosition01,
									unitGroup = UnitGroup.BadSide,
									isAI = true,
									initiativeOrder = 1,
									spawnFX = "SummonCultistSmokeFXMega",
									tags = {"cultist01"}
									})
							end),
							cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("cultist01")}, || "Right"),
							cinematicHelper.Sleep(0.4),
							cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("cultist01"),"Speak")),
							cinematicHelper.ShowComment(|| "cultist01", || __C(44, "No one expects\nthe unblinded\ninquisition!"), 2.5), 
							cinematicHelper.Sleep(2.8),
						})
					end),
			})),
			cinematicHelper.ConditionalIf(|| cinematicHelper.UnitStat("HarbingerBoss","turnsPlayed",0) == 4 or cinematicHelper.UnitStat("HarbingerBoss","turnsPlayed",0) == 8 or cinematicHelper.UnitStat("HarbingerBoss","turnsPlayed",0) == 12,
				cinematicHelper.Sequence({
					cinematicHelper.Wrap(function ()
						local spawnPosition = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"spawnPos04", "spawnPos05"})))
						return cinematicHelper.Sequence({
							cinematicHelper.CameraLooksAtPositions(|| {spawnPosition, cinematicHelper.FindCinematicPos("cameraPos2")}, || 1),
							cinematicHelper.Instant(function ()
								local unit = cinematicHelper.SpawnUnitI(
									{
									unitId = "CultistPriest",
									position = spawnPosition,
									unitGroup = UnitGroup.BadSide,
									isAI = true,
									isFlipped = true,
									initiativeOrder = 1
									})
								cinematicHelper.AddFxToPositionI("SummonCultistSmokeFXMega", spawnPosition)
								
							end),
							cinematicHelper.Sleep(0.5),
						})
					end),
			})),
			cinematicHelper.ConditionalIf(|| cinematicHelper.UnitStat("HarbingerBoss","turnsPlayed",0) == 6 or cinematicHelper.UnitStat("HarbingerBoss","turnsPlayed",0) == 10 or cinematicHelper.UnitStat("HarbingerBoss","turnsPlayed",0) == 14,
				cinematicHelper.Sequence({
					cinematicHelper.Wrap(function ()
						local spawnPosition = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"spawnPos01", "spawnPos02","spawnPos03"})))
						return cinematicHelper.Sequence({
							cinematicHelper.CameraLooksAtPositions(|| {spawnPosition, cinematicHelper.FindCinematicPos("cameraPos2")}, || 1),
							cinematicHelper.Instant(function ()
								local unit = cinematicHelper.SpawnUnitI(
									{
									unitId = "CultistPriest",
									position = spawnPosition,
									unitGroup = UnitGroup.BadSide,
									isAI = true,
									isFlipped = false,
									spawnFX = "SummonCultistSmokeFXMega",
									initiativeOrder = 1
									})
							end),
							cinematicHelper.Sleep(0.5),
						})
					end),
			}))
		}),
		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicUnitPos("HarbingerBoss")}, || 1),
		cinematicHelper.ReleaseCameraControl()
	}))

encounterLogic.AddCinematic("UlgukHaiFocus",cinematicHelper.Cinematic({
		cinematicHelper.Sequence({
			cinematicHelper.FinishCinematicSkip(),
			cinematicHelper.ConditionalIf(|| cinematicHelper.UnitStat("UlgukHaiBoss","turnsPlayed",0) == 2 ,
				cinematicHelper.Sequence({
					cinematicHelper.Wrap(function ()
						local spawnPosition02 = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("spawnPos09"))
						return cinematicHelper.Sequence({
							cinematicHelper.CameraLooksAtPositions(|| {spawnPosition02, cinematicHelper.FindCinematicPos("cameraPos2")}, || 2),
							cinematicHelper.Instant(function ()
								local unit = cinematicHelper.SpawnUnitI(
									{
									unitId = "TrollWarrior",
									position = spawnPosition02,
									unitGroup = UnitGroup.BadSide,
									isAI = true,
									spawnFX = "SummonCultistSmokeFXMega",
									initiativeOrder = 1
									})
							end),
							cinematicHelper.Sleep(0.4),
						})
					end),
				cinematicHelper.Wrap(function ()
						local spawnPosition03 = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("spawnPos08"))
						return cinematicHelper.Sequence({
							cinematicHelper.CameraLooksAtPositions(|| {spawnPosition03, cinematicHelper.FindCinematicPos("cameraPos2")}, || 1.5),
							cinematicHelper.Instant(function ()
								local unit = cinematicHelper.SpawnUnitI(
									{
									unitId = "TrollWarrior",
									position = spawnPosition03,
									unitGroup = UnitGroup.BadSide,
									isAI = true,
									initiativeOrder = 1,
									spawnFX = "SummonCultistSmokeFXMega",
									tags = {"warrior01"}
									})
							end),
							cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("warrior01")}, || "Right"),
							cinematicHelper.Sleep(0.4),
							cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("warrior01"),"Speak")),
							cinematicHelper.ShowComment(|| "warrior01", || __C(45, "We got you, chief!"), 1.6), 
							cinematicHelper.Sleep(1.8),
						})
					end),
			})),
			cinematicHelper.ConditionalIf(|| cinematicHelper.UnitStat("UlgukHaiBoss","turnsPlayed",0) == 3 ,
				cinematicHelper.Sequence({
				cinematicHelper.Wrap(function ()
						local spawnPosition03 = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("spawnPos07"))
						return cinematicHelper.Sequence({
							cinematicHelper.CameraLooksAtPositions(|| {spawnPosition03, cinematicHelper.FindCinematicPos("cameraPos2")}, || 1),
							cinematicHelper.Instant(function ()
								local unit = cinematicHelper.SpawnUnitI(
									{
									unitId = "StormcloudHighSorcerer",
									position = spawnPosition03,
									unitGroup = UnitGroup.GoodSide,
									isAI = false,
									spawnFX = "SummonCultistSmokeFXMega",
									tags = {"HighSorcerer"}
									})
							end),
							cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("HighSorcerer")}, || "Right"),
							cinematicHelper.Sleep(0.4),
							cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("HighSorcerer"),"Speak")),
							cinematicHelper.ShowComment(|| "HighSorcerer", || __C(46, "Stormcloud\nwill be ours\nonce more!"), 2.6), 
							cinematicHelper.Sleep(2.8),
						})
					end),
			})),
			cinematicHelper.ConditionalIf(|| cinematicHelper.UnitStat("UlgukHaiBoss","turnsPlayed",0) == 5 ,
				cinematicHelper.Sequence({
					cinematicHelper.Wrap(function ()
						local spawnPosition02 = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("spawnPos06"))
						return cinematicHelper.Sequence({
							cinematicHelper.CameraLooksAtPositions(|| {spawnPosition02, cinematicHelper.FindCinematicPos("cameraPos2")}, || 1.5),
							cinematicHelper.Instant(function ()
								local unit = cinematicHelper.SpawnUnitI(
									{
									unitId = "StormcloudSorcerer",
									position = spawnPosition02,
									unitGroup = UnitGroup.GoodSide,
									isAI = false,
									spawnFX = "SummonCultistSmokeFXMega",
									tags = {"SummonedSorcerer"}
									})
							end),
							cinematicHelper.Sleep(0.4),
						})
					end),
			})),
			cinematicHelper.ConditionalIf(|| cinematicHelper.UnitStat("UlgukHaiBoss","turnsPlayed",0) == 4 or cinematicHelper.UnitStat("UlgukHaiBoss","turnsPlayed",0) == 9 or cinematicHelper.UnitStat("UlgukHaiBoss","turnsPlayed",0) == 13 or cinematicHelper.UnitStat("UlgukHaiBoss","turnsPlayed",0) == 16,
				cinematicHelper.Sequence({
					cinematicHelper.Wrap(function ()
						local spawnPosition = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"spawnPos01", "spawnPos02","spawnPos03"})))
						return cinematicHelper.Sequence({
							cinematicHelper.CameraLooksAtPositions(|| {spawnPosition, cinematicHelper.FindCinematicPos("cameraPos2")}, || 1.5),
							cinematicHelper.Instant(function ()
								local unit = cinematicHelper.SpawnUnitI(
									{
									unitId = "TrollBreaker",
									position = spawnPosition,
									unitGroup = UnitGroup.BadSide,
									isAI = true,
									isFlipped = false,
									spawnFX = "SummonCultistSmokeFXMega",
									initiativeOrder = 1
									})
							end),
							cinematicHelper.Sleep(0.4),
						})
					end),
			})),
			cinematicHelper.ConditionalIf(|| cinematicHelper.UnitStat("UlgukHaiBoss","turnsPlayed",0) == 6 or cinematicHelper.UnitStat("UlgukHaiBoss","turnsPlayed",0) == 8 or cinematicHelper.UnitStat("UlgukHaiBoss","turnsPlayed",0) == 11 or cinematicHelper.UnitStat("UlgukHaiBoss","turnsPlayed",0) == 14,
				cinematicHelper.Sequence({
					cinematicHelper.Wrap(function ()
						local spawnPosition = cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos(cinematicHelper.RandomItem({"spawnPos04", "spawnPos05"})))
						return cinematicHelper.Sequence({
							cinematicHelper.CameraLooksAtPositions(|| {spawnPosition, cinematicHelper.FindCinematicPos("cameraPos2")}, || 1.5),

							cinematicHelper.Instant(function ()
								local unit = cinematicHelper.SpawnUnitI(
									{
									unitId = "TrollWarrior",
									position = spawnPosition,
									unitGroup = UnitGroup.BadSide,
									isAI = true,
									isFlipped = true,
									spawnFX = "SummonCultistSmokeFXMega",
									initiativeOrder = 1
									})
							end),
							cinematicHelper.Sleep(0.4),
						})
					end),
			}))
		}),
		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicUnitPos("UlgukHaiBoss")}, || 1),
		cinematicHelper.ReleaseCameraControl()
	}))

encounterLogic.AddCinematic("HarbingerDiedCast",cinematicHelper.Cinematic({
		
		cinematicHelper.PlaySound(||"krl_sfx_combatMBF_harbingerDeath_fullCinematic"),
		cinematicHelper.Instant(function ()
			cinematicHelper.PlayUnitAnimationComplexI({
				unit = cinematicHelper.FindCinematicUnit("HarbingerBoss"),
				animId = "Morph",
				
				
				events = {
					
					AbilityEnd = function (u)
						cinematicHelper.FireProjectileI({
							projectile = "MBFHarbingerMorphProjectile",
							source = cinematicHelper.UnitAttachPos(u,"CastPoint"),
							target = cinematicHelper.UnitAttachPos(cinematicHelper.FindCinematicUnit("GlareTower"),"GemPos"),
							onReached = || encounterLogic.encounterContext.SetFloat("harbingerReachedTower", 1)
						})
						if encounterLogic.encounterContext.GetFloat("harbingerShouldDie") == 1.0  then
							cinematicHelper.InstaKillUnitI("HarbingerBoss")
						end
					end
				}
			})
		end),
	}))

encounterLogic.AddCinematic("UlgukUnfreeze",cinematicHelper.Cinematic({
		
		cinematicHelper.Wrap(function ()
			
			local spawnPosition = cinematicHelper.FindCinematicUnitPos("UlgukHaiOnIce")
			local isFlipped = cinematicHelper.UnitIsFlipped("UlgukHaiOnIce")
			return cinematicHelper.Sequence({
				cinematicHelper.Sequence({
					cinematicHelper.PlaySound(||"krl_sfx_combatMBF_ulgukIceShatter"),
					cinematicHelper.Instant(|| encounterLogic.encounterContext.SetFloat("breakIce", 0)),
					cinematicHelper.UseSkillOnUnit(
						||cinematicHelper.FindCinematicUnit("UlgukHaiOnIce"),
						|| "mbf_ulgukhai_break_crystal" ,
						||cinematicHelper.FindCinematicUnit("UlgukHaiOnIce"),
						function ()
							return {
								onAction = function ()
									cinematicHelper.InstaKillUnitI("UlgukHaiOnIce")
									local unit = cinematicHelper.SpawnUnitI(
										{
										unitId = "MBFUlgukHai",
										position = spawnPosition,
										unitGroup = UnitGroup.BadSide,
										tags = {"UlgukHaiBoss"},
										spawnFX = "MBFIceBreakExplosionFXMega",
										isFlipped = isFlipped,
										animId = "Spawn",
										events = {
											AbilityEnd = function (u)
												encounterLogic.encounterContext.SetFloat("breakIce", 1)
											end
										}
									})
								end
							}
						end
					),
					
				}),
				cinematicHelper.Parallel({
						cinematicHelper.Sequence({	
							cinematicHelper.CameraZoom("IN_GAME"),
						}),
						cinematicHelper.Sequence({	
							cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("CameraPosTransition")}, || 1),
						}),
				}),
				cinematicHelper.WaitUntil(|| encounterLogic.encounterContext.GetFloat("breakIce") == 1.0),
			})
		end)
	}))

encounterLogic.AddCinematic("HarbingerDied",cinematicHelper.Cinematic({

		
		cinematicHelper.SetCinematicBarsVisibility(true),
		cinematicHelper.SetIngameHudVisibilityFixed(false),
		
		cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("CameraTransitionPosition")}, || 1),
		
		cinematicHelper.Sequence({
			cinematicHelper.TeleportUnit(|| cinematicHelper.FindCinematicUnit("HarbingerBoss"),||cinematicHelper.FindCinematicPos("HarbingerTransitionPosition")),
			cinematicHelper.AddFxToPosition(|| "MBFTeleportFXMega" ,||cinematicHelper.FindCinematicPos("HarbingerTransitionPosition")),
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("HarbingerBoss")}, || "Left"),
			cinematicHelper.Sleep(0.5),
			cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("HarbingerBoss"), || "Angry"),
			cinematicHelper.Sleep(0.2),
			cinematicHelper.ShowComment(|| "HarbingerBoss",|| __C(47, "So you think the\ntemple is yours?"), 2), 
			cinematicHelper.Sleep(2.2),
			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("HarbingerBoss")),
			cinematicHelper.Instant(|| encounterLogic.encounterContext.SetFloat("harbingerReachedTower", 0)),
			cinematicHelper.Instant(|| encounterLogic.encounterContext.SetFloat("harbingerShouldDie", 1)),
			cinematicHelper.NestCinematic(|| cinematicHelper.EncounterLogic().GetCinematic("HarbingerDiedCast")),
			cinematicHelper.WaitUntil(|| encounterLogic.encounterContext.GetFloat("harbingerReachedTower") == 1.0),
		}),
		cinematicHelper.Sequence({
			cinematicHelper.Instant(|| encounterLogic.encounterContext.SetFloat("shootIce", 0)),
			cinematicHelper.UseSkillOnUnit(
				||cinematicHelper.FindCinematicUnit("GlareTower"),
				|| "mbf_glare_tower_break_ice_attack" ,
				||cinematicHelper.FindCinematicUnit("UlgukHaiOnIce"),
				|| { onHit = || encounterLogic.encounterContext.SetFloat("shootIce", 1) }
			),
			cinematicHelper.WaitUntil(|| encounterLogic.encounterContext.GetFloat("shootIce") == 1.0),
		}),

		cinematicHelper.Sleep(0.3),
		cinematicHelper.NestCinematic(|| cinematicHelper.EncounterLogic().GetCinematic("UlgukUnfreeze")),

		cinematicHelper.Sleep(0.5),
		cinematicHelper.Parallel({
			cinematicHelper.Sequence({	
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("CameraPosIntro4")}, || 6),
			}),
			cinematicHelper.Sequence({	
				cinematicHelper.MoveCinematicUnitF(|| cinematicHelper.FindCinematicUnit("UlgukHaiBoss"), || cinematicHelper.GetFreePosition(cinematicHelper.FindCinematicPos("UlgukHaiSpawnPos")), || true),
			}),
		}),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("UlgukHaiBoss"),"AngrySpecial")),
		
		
		cinematicHelper.ShowComment(|| "UlgukHaiBoss", || __C(48,"Over my undead body!"), 1.7), 
		cinematicHelper.Sleep(2),
		
		cinematicHelper.Sleep(0.3),
		cinematicHelper.CameraZoom("cinematic"),
		cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.SetIngameHudVisibilityFixed(true),
	}))


encounterLogic.AddCinematic("OnEndTester",cinematicHelper.Cinematic({

		cinematicHelper.SetAutoShowHud(false),
		cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		cinematicHelper.SetCinematicBarsVisibility(true),
		cinematicHelper.SetCurtain(true),
		cinematicHelper.Sleep(1),
		cinematicHelper.NestCinematic(|| cinematicHelper.EncounterLogic().GetCinematic("OnEnd")),
	}))

return encounterLogic;

					
