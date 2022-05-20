local defaultNotePos = {};
local spin = false;
local arrowMoveX = 0;
local arrowMoveY = 5;
local xx = 520;
local yy = 320;
local xx2 = 840;
local yy2 = 320;
local ofs = 0;
local followchars = true;
local del = 0;
local del2 = 0;
local keepScroll = false

function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'slenderdeath');
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx');
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver');
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd');
	setProperty("static.alpha", 0);
	setProperty("jumpywumpy.alpha", 0);
    setProperty('smiley.alpha', 0);
    setProperty('camGame.alpha', 0);
	setProperty('camHUD.alpha', 0);
    if getPropertyFromClass('ClientPrefs', 'middleScroll') == true then
		keepScroll = true;
	elseif getPropertyFromClass('ClientPrefs', 'middleScroll') == false then
		setPropertyFromClass('ClientPrefs', 'middleScroll', true);
	end
    setProperty("healthbar.visible", false);
    setProperty("timeBar.visible", false);
    setProperty("timeBarBG.visible", false);
    setProperty("iconP1.visible", false);
    setProperty("iconP2.visible", false);
    setProperty("iconP1.visible", false);
    setProperty("healthBar.visible", false);
    setProperty("healthBarBG.visible", false);
    setProperty("timeTxt.visible", false);

    makeAnimatedLuaSprite('damngf', 'characters/bop', 480, 120);
    addAnimationByIndices('damngf', 'danceLeft', 'bop', '30,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14')
    addAnimationByIndices('damngf', 'danceRight', 'bop', '15,16,17,18,19,20,21,22,23,24,25,26,27,28,29')
	addLuaSprite('damngf', false);
	scaleObject('damngf', 0.8, 0.8);
end
function onBeatHit()
	if curBeat % 1 == 0 then 
	   objectPlayAnimation('damngf', 'danceLeft', true);
	end
    if curBeat % 2 == 0 then 
        objectPlayAnimation('damngf', 'danceRight', true);
     end
end
function onDestroy()
	if keepScroll == false then
		setPropertyFromClass('ClientPrefs', 'middleScroll', false);
	elseif keepScroll == true then
		keepScroll = false;
	end
end
function onUpdate()
    if curStep == 2 then
        doTweenAlpha('smiley', 'smiley', 1, 2, "quartOut")
    end
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
	    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
end
function onStepHit()
	if curStep == 13 then
		doTweenAlpha('smiley', 'smiley', 0, 5, "quartInOut")
		doTweenAlpha('game', 'camGame', 1, 5, "quartInOut")
		doTweenAlpha('hud', 'camHUD', 1, 5, "quartInOut")
	end

    if curStep == 30 then
		doTweenX('masky', 'masky', 0, 0.5, "quartInOut")
		makeLuaText('continue', "Don't Miss", 0.99, 580, 560)
		setObjectCamera('continue', 'hud')
		addLuaText('continue', true)
	end
	if curStep == 50 then
		doTweenAlpha('masky', 'masky', 0, 1, "quartInOut")
    end

    if curStep == 60 then
		doTweenAlpha('continue', 'continue', 0, 1, "quartInOut")
    end

    if curStep == 1344 then
		doTweenAlpha('game', 'camGame', 0, 3.5, "quartInOut")
		doTweenAlpha('hud', 'camHUD', 0, 3.5, "quartInOut")
	end
end
function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.4 then
        setProperty('health', health- 0.017);
    end
end
function noteMiss(id, noteData, noteType, isSustainNote)
    if getProperty('health') > 0.4 then
        setProperty('health', health- 1.017);
    end
end