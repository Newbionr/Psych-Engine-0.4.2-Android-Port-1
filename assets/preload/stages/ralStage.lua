function onCreate()

	makeLuaSprite('BGcity', 'BG', -1750, -1500);
	setLuaSpriteScrollFactor('BGcity', 0.9, 0.9);
	addLuaSprite('BGcity', false);
	
	-- Sea Shit
   	makeAnimatedLuaSprite('sea','sea', -1750, -1500)
    addAnimationByPrefix('sea','sea','sea idle',4,true);
    objectPlayAnimation('sea','sea',false);
	addLuaSprite('sea', false);
	
	makeLuaSprite('FG', 'FG', -1750, -1500);
	setLuaSpriteScrollFactor('FG', 0.9, 0.9);
	addLuaSprite('FG', false);

end