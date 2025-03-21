


local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.init = function ()
	cinematicHelper.InstantiateDynamicSoundGroup("DynamicSoundGroupHUDMusicTutorialFight")
end

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	  
		 

		 cinematicHelper.CameraStartsAtPosition(|| cinematicHelper.FindCinematicPos("startCameraPos")),
		 cinematicHelper.Parallel({
		 	cinematicHelper.Sequence({
		 		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager"), || "Fear"),	
				cinematicHelper.MoveCinematicUnit("Legend","legendPos", true),
			}),
			
			cinematicHelper.Sequence({	
				cinematicHelper.SetCinematicBarsVisibility(true),
		 		cinematicHelper.SetCurtain(true),
			}),
			cinematicHelper.Sequence({	
				cinematicHelper.Sleep(2),	
				cinematicHelper.CameraLooksAtPositions(|| {cinematicHelper.FindCinematicPos("cameraPos1")}, || 2.5),
			}),
			cinematicHelper.Sequence({	
				cinematicHelper.MoveCinematicUnit("hero1","heroPos1", true),
			}),
			cinematicHelper.Sequence({	
				cinematicHelper.MoveCinematicUnit("hero2","heroPos2", true),
			}),

	 	}),

		 cinematicHelper.Sequence({	
	 		
			cinematicHelper.Sleep(0.5),
			cinematicHelper.ShowComment(|| "guard2", || __C(1, "That's far enough!"), 2), 
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("guard2"),"Speak")),
			cinematicHelper.Sleep(2),
			cinematicHelper.ShowComment(|| "guard2", || __C(2, "Vez'nan will be\ndispleased if we\nlet you go."), 3), 
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("guard2"),"Speak")),
			cinematicHelper.Sleep(3.3),
			cinematicHelper.ShowComment(|| "Legend", || __C(3, "Step aside, Oloch!\nWe're not going back!"), 2), 
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Legend"),"Speak")),
			cinematicHelper.Sleep(2.5),
			cinematicHelper.ShowComment(|| "Ranger", || __C(4, "Don't worry, chum!"), 2), 
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Ranger"),"Speak")),
			cinematicHelper.Sleep(2),
			cinematicHelper.ShowComment(|| "Ranger", || __C(5, "You'll save\nloads on\nscarves."), 2.5), 
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("Ranger"),"Speak")),
			cinematicHelper.Sleep(3),
			cinematicHelper.ShowComment(|| "guard", || __C(6, "..."), 1.5), 
			
			cinematicHelper.Sleep(1.8),
			cinematicHelper.ShowComment(|| "guard2", || __C(7, "Because..."), 1.5), 
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("guard2"),"Speak")),
			cinematicHelper.Sleep(1.8),
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("guard")}, || "Right"), 
			cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("guard2"), || "Angry"),
			cinematicHelper.ShowComment(|| "guard2", || __C(8, "Vez'nan will have your head!"), 2.5),
			cinematicHelper.Sleep(1.4),
			cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("guard2")),
			cinematicHelper.Sleep(1.4),
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("guard"),"Speak")),
			cinematicHelper.ShowComment(|| "guard", || __C(9, "Oh..."), 1), 
			cinematicHelper.Sleep(2.4),
			cinematicHelper.ShowComment(|| "guard2", || __C(10, "Now, let us\nsettle this!"), 2.5), 
			cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("guard2"),"Speak")),
			cinematicHelper.Sleep(2.8),
			cinematicHelper.LookAt(|| {cinematicHelper.FindCinematicUnit("guard")}, || "Left"),
		}),


		cinematicHelper.Sequence({
				cinematicHelper.Sleep(0.3),				
				cinematicHelper.SetCinematicBarsVisibility(false),
				cinematicHelper.SetIngameHudVisibility(true);
				cinematicHelper.StartFight(),

		}),

	}))

encounterLogic.AddCinematic("OnEnd",cinematicHelper.Cinematic({
		
		cinematicHelper.RemoveOverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager")),
		cinematicHelper.OverrideAnimation(|| cinematicHelper.FindCinematicUnit("villager"), || "Victory"),
		cinematicHelper.Instant(|| cinematicHelper.PlayInstantAnimation(cinematicHelper.FindCinematicUnit("HeroUnit"),"Victory")),
		
		cinematicHelper.CameraFollowGroup(UnitGroup.GoodSide),
		cinematicHelper.ShowFightResume(),
		cinematicHelper.Sleep(0.3),
		cinematicHelper.SetCurtainOverWorld(false),
		cinematicHelper.ShowComic("ComicTutorialOutro"),
		cinematicHelper.StopPlayListMusic(),
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
		cinematicHelper.CameraLooksAtAllUnits(),
		cinematicHelper.Sleep(1),
		cinematicHelper.PlayAnimation(|| cinematicHelper.GetViewComponentsByGroup(UnitGroup.BadSide), || {"Victory"}),
		cinematicHelper.ShowDefeated(),
	}))

return encounterLogic;
