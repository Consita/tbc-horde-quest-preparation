if RXPGuides == nil then
	return
end


---Stratholme
---Main Door:
---Eastern Plaguelands,30.9,20.2
---Stratholme,55.0,17.4

RXPGuides.RegisterGuide([[
#classic
#tbc
#version 3
#group Consita Classic/TBC Launch Guide
#subgroup 4 - TBC Launch - Turnin
#name 1-Strat Route Turnin
#displayname Strat Route Turnin
#next 5 - TBC Dungeon Grind

--- Kargath

	step	
		#completewith Kargathlast
		.fly Badlands >> Travel to |cFFfa9602Kargath|r
		.zoneskip Badlands

	step
		.goto Badlands,3.0,47.6
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Shadowmage Vivian Lagrave|r
		.turnin -4768
		.turnin -4134
		.target Shadowmage Vivian Lagrave

	step
		.goto Badlands,5.8,47.6
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Warlord Goretooth|r
		.turnin -4132
		.turnin -4903
		.target Warlord Goretooth

	step
		.goto Badlands,5.8,47.6
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Warlord Goretooth|r
		.accept 4941
		.target Warlord Goretooth
		.isQuestTurnedIn 4903	

	step
		.goto Badlands,5.8,47.6
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Galamav the Marksman|r. He is up on the Tower.
		.turnin -4724
		.target Galamav the Marksman

	step
		#label Kargathlast
		.goto Badlands,25.8,45.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Lotwil Veriatus|r
		.turnin -4063
		.target Lotwil Veriatus

--- Flame Crest, Burning Steppes

	step
		#completewith BurningLast
		.goto Badlands,3.98,44.76
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Gorrik|r
		.fly Flame Crest >> Fly to |cFFfa9602Flame Crest|r
		.target Gorrik
		.zoneskip Burning Steppes
				
	step
		.goto Burning Steppes,65.2,24.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tinkee Steamboil|r
		.turnin -4735
		.target Tinkee Steamboil

	step
		.goto Burning Steppes,65.2,24.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Tinkee Steamboil|r
		.accept 5522
		.target Tinkee Steamboil	
		.isQuestTurnedIn 4735
		
	step
		.goto Burning Steppes,65.0,23.8
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Ragged John|r
		.turnin -4866	
		.target Ragged John	
		
	step
		.goto Burning Steppes,65.2,23.8
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Maxwort Uberglint|r
		.turnin -4123	
		.target Maxwort Uberglint		
		
	step
		.goto Burning Steppes,65.9,21.9
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Kibler|r
		.turnin -4729	
		.turnin -4862
		.target Kibler

step
		.goto Burning Steppes,95.061,31.563
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Cyrus Therepentous|r
		.itemcount 10575,1
		.accept 4022
		.turnin 4022
		.target Cyrus Therepentous
		.isQuestAvailable 4022
		.skipgossip			

step
		#label BurningLast
		.goto Burning Steppes,95.061,31.563
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Cyrus Therepentous|r
		.itemcount 10575,1
		.accept 4023
		.turnin 4023
		.target Cyrus Therepentous
		.isQuestAvailable 4023
		.skipgossip	

--- Silithus		

	step
		#completewith Silithuslast
		.zone Silithus >> Get summon to |cFFfa9602Silithus|r
		.zoneskip Silithus

	step
		.goto Silithus,81.87,18.93
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Layo|r
		.accept 1126
		.target Layo Starstrike	

	step
		.goto Silithus,51.34,38.2
		>>Click the |cRXP_PICK_Wanted Poster|r
		.accept 8283

	step
		.goto Silithus,51.9,39.1
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Calandrath|r
		.target Calandrath
		.accept 8307
		.skill cooking,<285,1

	step
		.goto Silithus,67,69.6
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hermit Ortell|r
		.turnin -8279
		.accept 8287
		.target Hermit Ortell	

	step
		.goto Silithus,67,69.6
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Hermit Ortell|r
		.accept 8323
		.turnin 8323
		.target Hermit Ortell	
		.itemcount 20404,10	

	step
		.use 20461 >> Click |T133463:0|t[Brann Bronzebeard's Lost Letter] and accept |cRXP_LOOT_Brann Bronzebeard's Lost Letter|r
		.accept 8308
		.itemcount 20461,1

	step
		.goto Silithus,62.7,75.1,20,0
		.goto Silithus,53.2,88.1,20,0
		.goto Silithus,40.80,88.80
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Frankal|r
		.turnin -8310
		.target Frankal Stonebridge

	step
		.goto Silithus,41.3,88.5
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Rutgar|r
		.turnin -8308
		.turnin -8309
		.accept 8314
		.target Rutgar Glyphshaper
		
	step
		.goto Silithus,45.00,92.20
		>>Kill |cRXP_ENEMY_Deathclasp|r an loot him for his |cRXP_LOOT_Pincer|r.
		.complete 8283,1 
		.unitscan Deathclasp

	step	
		#label TwilightCook2
		.goto Silithus,38.0,45.3,5,0
		>>Interact with |cRXP_PICK_Sandy Cookbook|r
		.skipgossip
		.turnin -8307
		.accept 8313
		.skill cooking,<285,1	

	step	
		.use 21220
		.accept 8791
		.itemcount 21220,1

	step	
		.use 21220
		.goto Silithus,49.2,34.2
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Commander Mar'alith|r	
		.turnin -8791
		.turnin -8306
		.turnin -8287
		.target Commander Mar'alith

	step
		.goto Silithus,49.45,36.44
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Baristolth of the Shifting Sands|r
		.turnin -8288
		.target Baristolth of the Shifting Sands	

	step
		.goto Silithus,49.45,36.44
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Baristolth of the Shifting Sands|r
		.accept 8301
		.turnin 8301
		.target Baristolth of the Shifting Sands	
		.itemcount 20384,200
		.isQuestTurnedIn 8288

	step	
		.goto Silithus,48.6,37.9
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Huum Wildmane|r	
		.turnin -8321
		.accept 8343
		.accept 8331
		.target Huum Wildmane

	step	
		.goto Silithus,51.0,38.8
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Warden Haro|r	
		.accept 8711 << Paladin
		.turnin 8711 << Paladin
		.accept 8709 << Rogue
		.turnin 8709 << Rogue
		.accept 8706 << Shaman
		.turnin 8706 << Shaman
		.accept 8712 << Hunter
		.turnin 8712 << Hunter
		.accept 8558 << Warrior
		.turnin 8558 << Warrior
		.target Warden Haro
		.itemcount 20886,1
		.reputation 609,exalted,<0,1 

	step	
		.goto Silithus,51.0,38.8
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Warden Haro|r	
		.accept 8707 << Mage
		.turnin 8707 << Mage
		.accept 8705 << Priest
		.turnin 8705 << Priest
		.accept 8710 << Warlock
		.turnin 8710 << Warlock
		.accept 8708 << Druid
		.turnin 8708 << Druid
		.target Warden Haro
		.itemcount 20890,1
		.reputation 609,exalted,<0,1 		

	step
		.goto Silithus,51.9,39.1
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Calandrath|r
		.target Calandrath
		.turnin -8313	

	step	
		.goto Silithus,51.8,39.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Calandrath|r	
		.accept 8317
		.turnin 8317
		.itemcount 20452,10
		.skill cooking,<285,1
		.target Calandrath
		.isQuestTurnedIn 8313


	step	
		.goto Silithus,51.8,39.4
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Keyl Swiftclaw|r	
		.accept 8691 << Mage
		.turnin 8691 << Mage
		.accept 8693 << Rogue
		.turnin 8693 << Rogue
		.accept 8689 << Priest
		.turnin 8689 << Priest
		.accept 8557 << Warrior
		.turnin 8557 << Warrior
		.target Keyl Swiftclaw
		.itemcount 20885,1
		.reputation 609,revered,<0,1 	

	step	
		.goto Silithus,51.8,39.4
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Keyl Swiftclaw|r	
		.accept 8695 << Paladin
		.turnin 8695 << Paladin
		.accept 8690 << Shaman
		.turnin 8690 << Shaman
		.accept 8694 << Warlock
		.turnin 8694 << Warlock
		.accept 8692 << Druid
		.turnin 8692 << Druid
		.accept 8696 << Hunter
		.turnin 8696 << Hunter
		.target Keyl Swiftclaw
		.itemcount 20889,1
		.reputation 609,revered,<0,1 
		
	step	
		.goto Silithus,52.0,39.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Dirk Thunderwood|r	
		.turnin -9023	
		.target Dirk Thunderwood

	step	
		.goto Silithus,51.8,38.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aurel Goldleaf|r	
		.turnin -8343
		.turnin -8331
		.target Aurel Goldleaf	
					
	step	
		.goto Silithus,51.8,38.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aurel Goldleaf|r	
		.accept 8341
		.turnin 8341
		.target Aurel Goldleaf	
		.reputation 609,revered,<0,1
		.itemcount 14344,5
		.itemcount 20514,3

	step	
		.goto Silithus,51.8,38.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aurel Goldleaf|r	
		.accept 8332
		.turnin 8332
		.target Aurel Goldleaf	
		.reputation 609,friendly,<0,1
		.itemcount 14344,1
		.itemcount 20513,3

	step	
		.goto Silithus,51.8,38.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aurel Goldleaf|r	
		.accept 9248
		.turnin 9248
		.target Aurel Goldleaf	
		.reputation 609,honored,<0,1
		.itemcount 20515,1	

	step	
		.goto Silithus,51.8,38.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aurel Goldleaf|r	
		.accept 8351
		.target Aurel Goldleaf	
		.isQuestTurnedIn 8341

	step	
		.goto Silithus,51.8,38.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Aurel Goldleaf|r	
		.accept 8349
		.target Aurel Goldleaf	
		.isQuestTurnedIn 8332

	step	
		.goto Silithus,52.0,38.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Windcaller Yessendra|r	
		.accept 8701 << Rogue
		.turnin 8701 << Rogue
		.accept 8697 << Priest
		.turnin 8697 << Priest
		.accept 8702 << Warlock
		.turnin 8702 << Warlock
		.accept 8704 << Hunter
		.turnin 8704 << Hunter
		.target Windcaller Yessendra
		.itemcount 20888,1
		.reputation 609,honored,<0,1 

	step	
		.goto Silithus,52.0,38.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Windcaller Yessendra|r	
		.accept 8703 << Paladin
		.turnin 8703 << Paladin
		.accept 8699 << Mage
		.turnin 8699 << Mage
		.accept 8698 << Shaman
		.turnin 8698 << Shaman
		.accept 8700 << Druid
		.turnin 8700 << Druid
		.accept 8556 << Warrior
		.turnin 8555 << Warrior
		.target Windcaller Yessendra
		.itemcount 20884,1
		.reputation 609,honored,<0,1 

	step	
		.goto Silithus,48.58,37.78
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bor Wildmane|r	
		.accept 8318
		.turnin 8318
		.target Bor Wildmane	
		.itemcount 20404,10	

	step	
		.goto Silithus,48.58,37.78
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bor Wildmane|r	
		.turnin -8349
		.turnin -8351
		.target Bor Wildmane		

	step	
		.goto Silithus,48.58,37.78
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bor Wildmane|r	
		.accept 8361
		.turnin 8361
		.target Bor Wildmane	
		.itemcount 20513,1
		.reputation 609,honored,<0,1 	

	step	
		.goto Silithus,48.58,37.78
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bor Wildmane|r	
		.accept 8348
		.turnin 8348
		.target Bor Wildmane	
		.itemcount 20514,1
		.reputation 609,revered,<0,1 	

	step	
		.goto Silithus,48.58,37.78
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Bor Wildmane|r	
		.accept 8352
		.turnin 8352
		.target Bor Wildmane	
		.itemcount 20515,1
		.reputation 609,revered,<0,1 		

	step
		.goto Silithus,49.7,37.5
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Geologist Larksbane|r
		.turnin -8314
		.target Geologist Larksbane

	step
		.goto Silithus,49.7,37.5
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Geologist Larksbane|r
		.accept 8315
		.target Geologist Larksbane		
		.isQuestTurnedIn 8314

	step
		.goto Silithus,48,56
		.use 15875 >>Once you get close to |cFFfa9602Bones of Grakkarond|r use the |T136192:0|t[Glyphs of Calling] to start the event
		>>Kill |cRXP_ENEMY_Emissary Roman'khan|r and loot him for |cRXP_LOOT_Crystal Unlocking Mechanism|r
		.complete -8315,1	
		.mob Emissary Roman'khan

	step
		.goto Silithus,49.7,37.5
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Geologist Larksbane|r
		.turnin -8315
		.target Geologist Larksbane		
		.isQuestTurnedIn 8314

	step	
		.goto Silithus,49.7,37.5
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Geologist Larksbane|r
		.accept 8376 << Paladin
		.turnin 8376 << Paladin
		.accept 8381 << Mage
		.turnin 8381 << Mage
		.accept 8378 << Rogue
		.turnin 8378 << Rogue
		.accept 8379 << Priest
		.turnin 8379 << Priest
		.accept 8380 << Shaman
		.turnin 8380 << Shaman
		.accept 8381 << Warlock
		.turnin 8381 << Warlock
		.accept 8382 << Druid
		.turnin 8382 << Druid
		.accept 8377 << Hunter
		.turnin 8377 << Hunter
		.accept 8316 << Warrior
		.turnin 8316 << Warrior
		.target Geologist Larksbane		
		.isQuestTurnedIn 8315

	step	
		.goto Silithus,50.8,33.6
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Vish Kozus|r	
		.turnin -8283
		.target Vish Kozus

	step
		.goto Silithus,81.87,18.93
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Layo|r
		.turnin -1126
		.target Layo Starstrike	

	step
		#label Silithuslast
		.goto Silithus,81.87,18.93
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Layo|r
		.accept 6844
		.target Layo Starstrike	
		.isQuestTurnedIn 1126	

--- Un'Goro

	step
		.goto Un'Goro Crater,30.94,50.44
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Krakle|r
		.accept 974
		.target Krakle

--- Orgrimmar
	
	step
		.goto Orgrimmar,34.27,39.35
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Eitrigg|r
		.complete 4941,1
		.target Eitrigg
		.skipgossip

	step
		.goto Orgrimmar,31.74,37.82
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Thrall|r
		.turnin -4941
		.target Thrall
		
--- Tarren Mill

	step
		#completewith Hillsbradlast
		.zone Hillsbrad Foothills >> Get summon to |cFFfa9602Hillsbrad Foothills|r
		.zoneskip Hillsbrad Foothills

	step
		.goto Hillsbrad Foothills,61.4,19.2
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Lydon|r
		.turnin -2937
		.target Apothecary Lydon	

	step
		.goto Hillsbrad Foothills,61.4,19.2
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Apothecary Lydon|r
		.accept 2938
		.target Apothecary Lydon	
		.isQuestTurnedIn 2937
	
	step
		#completewith next
		.zone Alterac Mountains >>Travel to |cFFfa9602Alterac Mountains|r
		.zoneskip Alterac Mountains

	step
		.goto Alterac Mountains,62.2,59.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Warmaster Laggrond|r
		.accept 7163
		.turnin 7163
		.target Warmaster Laggrond
		.reputation 729,friendly,<0,1 
		.isQuestTurnedIn 7161

	step
		.goto Alterac Mountains,62.2,59.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Warmaster Laggrond|r
		.accept 7164
		.turnin 7164
		.target Warmaster Laggrond
		.reputation 729,honored,<0,1 
		.isQuestTurnedIn 7161

	step
		.goto Alterac Mountains,62.2,59.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Warmaster Laggrond|r
		.accept 7165
		.turnin 7165
		.target Warmaster Laggrond
		.reputation 729,revered,<0,1 
		.isQuestTurnedIn 7161

	step
		.goto Alterac Mountains,62.2,59.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Warmaster Laggrond|r
		.accept 7166
		.turnin 7166
		.target Warmaster Laggrond
		.reputation 729,exalted,<0,1 
		.isQuestTurnedIn 7161

	step
		#label Hillsbradlast
		.goto Alterac Mountains,62.2,59.0
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Warmaster Laggrond|r
		.accept 7167
		.turnin 7167
		.target Warmaster Laggrond
		.reputation 729,exalted,<0,1 
		.isQuestTurnedIn 7161

--- Go through Portal

	step
		+test

	step <<tbc
		.goto Blasted Lands,58.0,55.8
		>>|Tinterface/worldmap/chatbubble_64grey.blp:20|tTalk to |cRXP_FRIENDLY_Warlord Dar'toon|r
		.accept 9407
		.target Warlord Dar'toon

	step <<tbc
		#completewith next
		.zone Hellfire Peninsula >> Travel to |cFFfa9602Hellfire Peninsula|r
		.zoneskip Hellfire Peninsula

	step <<tbc
		.zone Hellfire Peninsula >> Go through the Portal to |cFFfa9602Hellfire Peninsula|r and enjoy leveling! :)


]])