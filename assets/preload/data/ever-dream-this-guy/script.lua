local keepScroll = false

function onCreate()
	setProperty('camHUD.alpha', 0);
	setProperty('camGame.alpha', 0);
	setProperty('dad.alpha', 0);
	setProperty('boyfriend.alpha', 0);
	setProperty('lastscene.alpha', 0);
end
function onStepHit()
    if curStep == 1 then
		doTweenX('guy', 'guy', 0, 0.5, "quartInOut")
	end
	if curStep == 18 then
		doTweenAlpha('guy', 'guy', 0, 1, "quartInOut")
    end
end
function onUpdate()
    if curStep == 0 then
	cameraFlash(game, 0xff000000, 5,false)
	end
    if curStep == 15 then
	doTweenAlpha('game', 'camGame', 1, 4, "quartInOut")
	end
    if curStep == 50 then
	doTweenAlpha('dad', 'dad', 1, 4, "quartInOut")
	end
    if curStep == 75 then
	doTweenAlpha('bf', 'boyfriend', 1, 4, "quartInOut")
	end
    if curStep == 100 then
	doTweenAlpha('hud', 'camHUD', 0.89, 4, "quartInOut")
	end
    if curStep == 1151 then
	doTweenAlpha('hud', 'camHUD', 0, 4, "quartInOut")
	end
    if curStep == 1185 then
	doTweenAlpha('bf', 'boyfriend', 0, 4, "quartInOut")
	doTweenAlpha('dad', 'dad', 0, 4, "quartInOut")
	doTweenAlpha('dream', 'dream', 0, 4, "quartInOut")
	end
    if curStep == 1189 then
	doTweenAlpha('lastscene', 'lastscene', 1, 4, "quartInOut")
	cameraFade(game, 0xFFFFFFFF, 8,false)
	end
end
function goodNoteHit(id)
  setProperty('camHUD.alpha', getProperty('camHUD.alpha', 0.8)+0.01)
end
function noteMiss(id)
  setProperty('camHUD.alpha', getProperty('camHUD.alpha')-0.08)
end