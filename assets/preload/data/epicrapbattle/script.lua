local keepScroll = false

function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bonusdeath');
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx');
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', '-');
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd');
	setProperty('camHUD.alpha', 0);
	setProperty('camGame.alpha', 0);
	setProperty('rap.alpha', 0);
	setProperty('vs.alpha', 0);
	setProperty('box1.alpha', 0);
	setProperty('box2.alpha', 0);
	setProperty('epic.alpha', 0);
end
function onStepHit()
    if curStep == 128 then
		doTweenX('epic', 'epic', 0, 0.5, "quartInOut")
		setProperty('epic.alpha', 1);
	end
	if curStep == 4 then
		setProperty('rap.alpha', 1);
		cameraFlash('other', 0xff000000, 1,false)
	end
	if curStep == 33 then
		doTweenAlpha('rap', 'rap', 0, 3, "quartInOut")
    end
	if curStep == 64 then
		setProperty('camGame.alpha', 1);
		setProperty('box1.alpha', 1);
    end
	if curStep == 76 then
		setProperty('camGame.alpha', 1);
		setProperty('vs.alpha', 1);
		setProperty('box1.alpha', 0);
    end
	if curStep == 90 then
		setProperty('camGame.alpha', 1);
		setProperty('box2.alpha', 1);
		setProperty('vs.alpha', 0);
    end
	if curStep == 112 then
		setProperty('box2.alpha', 0);
		setProperty('camGame.alpha', 0);
    end
	if curStep == 141 then
		doTweenAlpha('epic', 'epic', 0, 1, "quartInOut")
    end
end
function onUpdate()
    if curStep == 128 then
	setProperty('camHUD.alpha', 1);
	setProperty('camGame.alpha', 1);
	end
end