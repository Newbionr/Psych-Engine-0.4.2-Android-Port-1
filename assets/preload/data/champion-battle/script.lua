local keepScroll = false
local allowCountdown = false

function onCreate()
	setProperty('camHUD.alpha', 0);
	addCharacterToList('gold2', 'dad')
	precacheImage("mods/images/titles/gold1")
	setPropertyFromClass('GameOverSubstate', 'characterName', 'golddeath');
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx');
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver');
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd');
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
function onUpdate()
    if curStep == 0 then
	doTweenAlpha('hud', 'camHUD', 1, 1, "quartInOut")
	end
end
function onNextDialogue(count)
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end
function onStepHit()
	if curStep == 1 then
		doTweenX('gold1', 'gold1', 0, 0.5, "quartInOut")
		setPropertyFromGroup('opponentStrums', 0, 'x', defaultOpponentStrumX0 - 700)
		setPropertyFromGroup('opponentStrums', 1, 'x', defaultOpponentStrumX1 - 700)
		setPropertyFromGroup('opponentStrums', 2, 'x', defaultOpponentStrumX2 - 700)
		setPropertyFromGroup('opponentStrums', 3, 'x', defaultOpponentStrumX3 - 700)
		setPropertyFromGroup('playerStrums', 0, 'x', defaultOpponentStrumX0)
		setPropertyFromGroup('playerStrums', 1, 'x', defaultOpponentStrumX1)
		setPropertyFromGroup('playerStrums', 2, 'x', defaultOpponentStrumX2)
		setPropertyFromGroup('playerStrums', 3, 'x', defaultOpponentStrumX3)
	end
	if curStep == 18 then
		doTweenAlpha('gold1', 'gold1', 0, 1, "quartInOut")
	end
	if curStep == 856 then
	setProperty("h.visible",true)
	setProperty('camHUD.alpha', 0);
	end
	if curStep == 858 then
	setProperty("e.visible",true)
	setProperty('camHUD.alpha', 0);
	end
	if curStep == 860 then
	setProperty("l.visible",true)
	setProperty('camHUD.alpha', 0);
	end
	if curStep == 862 then
	setProperty("p.visible",true)
	setProperty('camHUD.alpha', 0);
	end
	if curStep == 864 then
	setProperty("h.visible",false)
	setProperty("e.visible",false)
	setProperty("l.visible",false)
	setProperty("p.visible",false)
	setProperty('camHUD.alpha', 1);
	end
	if curStep == 1126 then
	setProperty('camHUD.alpha', 0);
	setProperty('camGame.alpha', 0);
	end
	if curStep == 1127 then
	setProperty('camHUD.alpha', 1);
	setProperty('camGame.alpha', 1);
	end
	if curStep == 1129 then
	setProperty('camHUD.alpha', 0);
	setProperty('camGame.alpha', 0);
	end
	if curStep == 1131 then
	setProperty('camHUD.alpha', 1);
	setProperty('camGame.alpha', 1);
	end
	if curStep == 1132 then
	setProperty('camHUD.alpha', 0);
	setProperty('camGame.alpha', 0);
	end
	if curStep == 1131 then
	setProperty('camHUD.alpha', 1);
	setProperty('camGame.alpha', 1);
	end
	if curStep == 1138 then
	setProperty('camHUD.alpha', 0);
	setProperty('camGame.alpha', 0);
	end
end
function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.4 then
        setProperty('health', health- 0.017);
    end
end
function onEndSong()
	if not allowEnd and isStoryMode then
		setProperty('inCutscene', true);
		startDialogue('post-dialogue', '');
		allowEnd = true;
		return Function_Stop;
	end
	return Function_Continue;
end