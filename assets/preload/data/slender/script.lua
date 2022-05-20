local defaultNotePos = {};
local spin = false;
local arrowMoveX = 0;
local arrowMoveY = 5;
local xx = 520;
local yy = -520;
local xx2 = 840;
local yy2 = 150;
local ofs = 60;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
	addCharacterToList('yeet', 'gf')
	precacheImage('mods/images/characters/yeet')
	setPropertyFromClass('GameOverSubstate', 'characterName', 'slenderdeath');
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx');
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver');
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd');
	setProperty("static.alpha", 0);
	setProperty("camGame.alpha", 0);
	setProperty("camHUD.alpha", 0);
	setProperty("jumpywumpy.alpha", 0);
    setProperty("rain.alpha", 0);
end
function onStepHit()
    if curStep == 1 then
		doTweenX('slender2', 'slender2', 0, 0.5, "quartInOut")
	end
	if curStep == 7 then
		setProperty("jumpywumpy.alpha", 1);
    end
	if curStep == 10 then
		setProperty("jumpywumpy.alpha", 0);
    end
	if curStep == 18 then
		doTweenAlpha('slender2', 'slender2', 0, 1, "quartInOut")
    end
	if curStep == 40 then
		doTweenAlpha('jumpywumpy', 'jumpywumpy', 1, 1.8, "quartInOut")
    end
	if curStep == 52 then
		doTweenAlpha('game', 'camGame', 1, 1.8, "quartInOut")
		doTweenAlpha('hud', 'camHUD', 1, 1.8, "quartInOut")
	end
	if curStep == 64 then
		setProperty("jumpywumpy.alpha", 0);
		doTweenAlpha('jumpywumpy', 'jumpywumpy', 0, 0.01, "quartInOut")
    end
	if curStep == 576 then
		doTweenAlpha('jumpywumpy', 'jumpywumpy', 1, 3.8, "quartInOut")
		doTweenAlpha('game', 'camGame', 0, 3.8, "quartInOut")
		doTweenAlpha('hud', 'camHUD', 0, 3.8, "quartInOut")
	end
	if curStep == 608 then
		setProperty("jumpywumpy.alpha", 0);
		doTweenAlpha('jumpywumpy', 'jumpywumpy', 0, 0.01, "quartInOut")
		doTweenAlpha('game', 'camGame', 1, 0.01, "quartInOut")
		doTweenAlpha('hud', 'camHUD', 1, 0.01, "quartInOut")
    end
	if curStep == 832 then
		doTweenAlpha('game', 'camGame', 0, 1, "quartInOut")
		doTweenAlpha('hud', 'camHUD', 0, 1, "quartInOut")
	end
	if curStep == 848 then
		setProperty("jumpywumpy.alpha", 1);
    end
	if curStep == 849 then
		setProperty("jumpywumpy.alpha", 0);
    end
	if curStep == 850 then
		setProperty("jumpywumpy.alpha", 1);
    end
	if curStep == 851 then
		setProperty("jumpywumpy.alpha", 0);
    end
	if curStep == 852 then
		setProperty("jumpywumpy.alpha", 1);
    end
	if curStep == 853 then
		setProperty("jumpywumpy.alpha", 0);
    end
	if curStep == 855 then
		setProperty("jumpywumpy.alpha", 1);
    end
	if curStep == 860 then
		setProperty("jumpywumpy.alpha", 0);
    end
	if curStep == 861 then
		setProperty("jumpywumpy.alpha", 1);
    end
	if curStep == 862 then
		setProperty("jumpywumpy.alpha", 0);
    end
	if curStep == 863 then
		setProperty("jumpywumpy.alpha", 1);
    end
	if curStep == 864 then
		setProperty("jumpywumpy.alpha", 0);
		doTweenAlpha('game', 'camGame', 1, 0.01, "quartInOut")
		doTweenAlpha('hud', 'camHUD', 1, 0.01, "quartInOut")
    end
end

function onUpdate()
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
function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.4 then
        setProperty('health', health- 0.017);
    end
end