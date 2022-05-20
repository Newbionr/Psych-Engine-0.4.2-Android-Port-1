function onCreate()
	makeLuaSprite('lastscene', 'lastscene', -10, 480);
	setScrollFactor('lastscene', 1, 1);
	addLuaSprite('lastscene', false);

	makeLuaSprite('dream', 'dream', -350, 300);
	setScrollFactor('dream', 1, 1);
	addLuaSprite('dream', false);

	makeLuaSprite('guy', 'titles/guy', -400, 220);
	setScrollFactor('guy', 0, 0);
	setObjectCamera('guy','other')
	scaleObject('guy', 0.4, 0.4)
	addLuaSprite('guy', true);
end
function onCreatePost()--this thing happens once the characters are spawned

setProperty("gf.visible", false);
setProperty("healthbar.visible", false);
setProperty("timeBar.visible", false);
setProperty("timeBarBG.visible", false);
setProperty("iconP1.visible", false);
setProperty("iconP2.visible", false);
setProperty("iconP1.visible", false);
setProperty("healthBar.visible", false);
setProperty("healthBarBG.visible", false);
setProperty("timeTxt.visible", false);
setProperty("opponentStrums.visible", false);
end
