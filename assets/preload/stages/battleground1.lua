function onCreate()

	makeLuaSprite('gold1', 'titles/gold1', -400, 220);
	setScrollFactor('gold1', 0, 0);
	setObjectCamera('gold1','hud')
	scaleObject('gold1', 0.4, 0.4)
	addLuaSprite('gold1', true);

	makeLuaSprite('h', 'h', 0, 0);
	setScrollFactor('h', 0, 0);
	setObjectCamera('h','game')
	setObjectCamera('h','game')
	addLuaSprite('h', true);

	makeLuaSprite('e', 'e', 0, 0);
	setScrollFactor('e', 0, 0);
	setObjectCamera('e','game')
	setObjectCamera('e','game')
	addLuaSprite('e', true);

	makeLuaSprite('l', 'l', 0, 0);
	setScrollFactor('l', 0, 0);
	setObjectCamera('l','game')
	setObjectCamera('l','game')
	addLuaSprite('l', true);

	makeLuaSprite('p', 'p', 0, 0);
	setScrollFactor('p', 0, 0);
	setObjectCamera('p','game')
	setObjectCamera('p','game')
	addLuaSprite('p', true);

	makeLuaSprite('uibars', 'uibars', 56, -31.4);
	setScrollFactor('uibars', 0, 0);
	setObjectCamera('uibars','hud')
	setObjectCamera('uibars','hud')
	addLuaSprite('uibars', true);

	makeLuaSprite('blurrybg', 'blurrybg', 0,-710);
	setScrollFactor('blurrybg', 0.6, 0.6);
	addLuaSprite('blurrybg', false);

	makeLuaSprite('platforms', 'platforms', 170, 400);
	setScrollFactor('platforms', 1, 1);
	addLuaSprite('platforms', false);
end
function onCreatePost()--this thing happens once the characters are spawned
setProperty("gf.visible", false);
setProperty("iconP2.visible", false);
setProperty("iconP1.visible", false);
setProperty("healthBar.y", 660)
setProperty("healthBar.x", 660)
setProperty("timeTxt.x", 970)
setProperty("timeTxt.y", 590)
setProperty("timeTxt.width", 0.8)
setProperty("timeBar.visible",false)
setProperty("timeBarBG.visible",false)
setProperty("h.visible",false)
setProperty("e.visible",false)
setProperty("l.visible",false)
setProperty("p.visible",false)
end
