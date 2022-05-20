local allowCountdown = false
local waitThing = false
local confirmed = 0

function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'jeffdeath');
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx');
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver');
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd');
	setProperty('camGame.alpha', 0)
	setProperty('camHUD.alpha', 0)
	setProperty('boyfriend.alpha', 0)
	setProperty('gf.alpha', 0)
	setProperty('dad.alpha', 0)
	setProperty('DAambience.alpha', 0)
	setProperty('jeffbg.alpha', 0)
	setProperty('treeoverlay.alpha', 0)
	
end
function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
		startVideo('jeff1');
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end
function onStepHit()
	if curStep == 29 then
		doTweenAlpha('bf', 'boyfriend', 1, 2, "quartInOut")
		doTweenAlpha('game', 'camGame', 1, 2, "quartInOut")
		doTweenAlpha('ded', 'DAambience', 1, 2, "quartInOut")
		doTweenAlpha('hud', 'camHUD', 1, 2, "quartInOut")
    end
	if curStep == 44 then
		doTweenAlpha('gf', 'gf', 1, 2, "quartInOut")
    end
	if curStep == 76 then
		doTweenAlpha('bg', 'jeffbg', 1, 2, "quartInOut")
    end
	if curStep == 94 then
		doTweenAlpha('tree', 'treeoverlay', 1, 2, "quartInOut")
    end
	if curStep == 128 then
		cameraFlash('game', 0xFFFFFFFF, 2, false)
		doTweenAlpha('dad', 'dad', 1, 0.01, "quartInOut")
    end
end