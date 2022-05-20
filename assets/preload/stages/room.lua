function onCreate()
	-- background shit
	makeLuaSprite('roomback', 'background_questionmark', -325, -125);
	setLuaSpriteScrollFactor('roomback', 0.9, 0.9);
	scaleLuaSprite('roomback', 2.3, 2.3);
	addLuaSprite('roomback', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end