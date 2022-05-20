local keepScroll = false

function onCreate()
	setProperty('camHUD.alpha', 0);
	addCharacterToList('pikachu', 'dad')
	addCharacterToList('celebi', 'boyfriend')
	makeAnimatedLuaSprite('gold', 'characters/goldback', 180, 120);
	addAnimationByPrefix('gold', 'loop', 'idle', 24, true);
	addLuaSprite('gold', false);
	scaleObject('gold', 0.8, 0.8);
	setProperty("gold.visible", false);

	makeAnimatedLuaSprite('red', 'characters/nohedred', 1023, 6);
	addAnimationByPrefix('red', 'loop', 'idle', 24, true);
	addLuaSprite('red', false);
	scaleObject('red', 0.6, 0.6);
	setProperty("red.visible", false);
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bonusdeath');
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx');
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', '');
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd');
	setProperty("cyndaquil.visible", false);
	setProperty("celebi.visible", false);
end
function onUpdate()
    if curStep == 0 then
	doTweenAlpha('hud', 'camHUD', 1, 0.5, "quartInOut")
	end
end
function onStepHit()
	if curStep == 1 then
		setPropertyFromGroup('opponentStrums', 0, 'x', defaultOpponentStrumX0 - 700)
		setPropertyFromGroup('opponentStrums', 1, 'x', defaultOpponentStrumX1 - 700)
		setPropertyFromGroup('opponentStrums', 2, 'x', defaultOpponentStrumX2 - 700)
		setPropertyFromGroup('opponentStrums', 3, 'x', defaultOpponentStrumX3 - 700)
		setPropertyFromGroup('playerStrums', 0, 'x', defaultOpponentStrumX0)
		setPropertyFromGroup('playerStrums', 1, 'x', defaultOpponentStrumX1)
		setPropertyFromGroup('playerStrums', 2, 'x', defaultOpponentStrumX2)
		setPropertyFromGroup('playerStrums', 3, 'x', defaultOpponentStrumX3)
		doTweenX('redlol', 'redlol', 0, 0.5, "quartInOut")
	end
	if curStep == 18 then
		doTweenAlpha('redlol', 'redlol', 0, 1, "quartInOut")
	end
	if curStep == 1560 then
	setProperty("gold.visible", true)
	setProperty("red.visible", true)
	cameraFlash(game, 0xFFFFFFFF, 2,false)
	end
	if curStep == 2016 then
	setProperty("gold.visible", false)
	setProperty("red.visible", false)
	cameraFlash(game, 0xFFFFFFFF, 2,false)
	end
end
function onBeatHit()
	if curBeat % 2 == 0 then 
	   objectPlayAnimation('red', 'loop', true);
	end
	if curBeat % 2 == 0 then 
	   objectPlayAnimation('gold', 'loop', true);
	end
end
function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.4 then
        setProperty('health', health- 0.017);
    end
end