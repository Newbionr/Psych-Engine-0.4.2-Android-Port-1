local keepScroll = false
local allowCountdown = false
function onCreate()
	setProperty('camHUD.alpha', 0);
	setPropertyFromClass('GameOverSubstate', 'characterName', 'golddeath');
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx');
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver');
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd');
	setProperty("blurrybgred.visible",false)
	setProperty("platforms.visible",false)
	setProperty("timeTxt.visible",false)
	setProperty("scoreTxt.visible",false)
	setProperty("healthBar.visible",false)
	setProperty("healthBarBG.visible",false)
	setProperty("uibars.visible",false)
	setProperty("celebi.visible", false);
	setProperty("cyndaquil.visible", false);
end
function onUpdate()
    if curStep == 0 then
	doTweenAlpha('hud', 'camHUD', 0.6, 0.5, "quartInOut")
	end
end
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end
function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', '');
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
		doTweenX('gold4', 'gold4', 0, 0.5, "quartInOut")
	end
	if curStep == 18 then
		doTweenAlpha('gold4', 'gold4', 0, 1, "quartInOut")
    end
	if curStep == 815 then
		doTweenAlpha('game', 'camGame', 0, 3, "quartInOut")
		doTweenAlpha('hud', 'camHUD',  0, 3, "quartInOut")
    end
end
function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.4 then
        setProperty('health', health- 0.017);
    end
end
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Psychic Note' then
		objectPlayAnimation('celebi', 'attack', false)
		cameraFlash('hud', 0xFFFFFFFF, 5,false)
		playSound("confusion", 0.7)
	end
end
function onEndSong()
	if not allowEnd and isStoryMode then
		startVideo('gold2');
		allowEnd = true;
		return Function_Stop;
	end
	return Function_Continue;
end