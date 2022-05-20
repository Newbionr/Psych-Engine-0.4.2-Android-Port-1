local keepScroll = false
local skipCountdown = true

function onCreate() 
	setProperty('title.alpha', 0);
	setProperty('camGame.alpha', 0);
	setProperty('camHUD.alpha', 0);
	setProperty('sleep.alpha', 0);
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bonusdeath');
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx');
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', '');
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd');
end
function onUpdate()
    if curStep == 4 then
	doTweenAlpha('title', 'title', 1, 3, "quartInOut")
	noteTweenAlpha("NoteAlpha5", 4, 0.4, transitionTime, linear)
	noteTweenAlpha("NoteAlpha6", 5, 0.4, transitionTime, linear)
	noteTweenAlpha("NoteAlpha7", 6, 0.4, transitionTime, linear)
	noteTweenAlpha("NoteAlpha8", 7, 0.4, transitionTime, linear)
	end
end
function onStepHit()
    if curStep == 30 then
		doTweenX('gfjeff', 'gfjeff', 0, 0.5, "quartInOut")
	end
	if curStep == 50 then
		doTweenAlpha('gfjeff', 'gfjeff', 0, 1, "quartInOut")
    end
	if curStep == 20 then
		doTweenAlpha('title', 'title', 0, 5, "quartInOut")
		doTweenAlpha('game', 'camGame', 1, 5, "quartInOut")
		doTweenAlpha('hud', 'camHUD', 1, 5, "quartInOut")
	end
	if curStep == 1151 then
		doTweenAlpha('title', 'title', 0, 0.8, "quartInOut")
		doTweenAlpha('game', 'camGame', 0, 0.8, "quartInOut")
		doTweenAlpha('hud', 'camHUD', 0, 0.8, "quartInOut")
	end
	if curStep == 1166 then
		setProperty('sleep.alpha', 1);
	end
end
