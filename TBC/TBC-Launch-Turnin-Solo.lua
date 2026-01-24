if RXPGuides == nil then
	return
end

RXPGuides.RegisterGuide([[
#classic
#tbc
#version 3
#group Consita Classic/TBC Launch Guide
#subgroup 4 - TBC Launch - Turnin
#name 3-Solo Route Turnin
#displayname Solo Route Turnin
#next 5 - TBC Dungeon Grind

step
+test 2


	step
		#completewith next
		.goto Feralas,59.1,45.3,15,0
		.goto Kalimdor,43.0,69.2,15,0
		.goto Kalimdor,43.5,68.4,15,0
		.subzone 2577>>Enter |cFFfa9602Dire Maul East|r


	step
		+test


]])