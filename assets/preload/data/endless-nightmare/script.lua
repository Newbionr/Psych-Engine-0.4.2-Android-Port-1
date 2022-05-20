local allowCountdown = false
local waitThing = false
local confirmed = 0
local keepScroll = false
local defaultNotePos = {};
local spin = false;
local arrowMoveX = 0;
local arrowMoveY = 5;
local xx = 520;
local yy = 520;
local xx2 = 940;
local yy2 = 700;
local ofs = 60;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
	addCharacterToList('jeffrey', 'dad')
	addCharacterToList('Trep_bfBLOOD', 'boyfriend')
    precacheImage("mods/images/jeffrey")
    addCharacterToList('scaredgf', 'gf')
	setPropertyFromClass('GameOverSubstate', 'characterName', 'jeffdeath');
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx');
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver');
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd');
	if isStoryMode then
		makeLuaSprite('warningimage', 'warningPages/jeff', 0, 0)
		screenCenter('warningimage', 'xy')
		setObjectCamera('warningimage', 'other')
		
		addLuaSprite('warningimage', true)

		makeLuaText('continue', "Press SHIFT to Continue", 0.8, 1030, 688)
		setObjectCamera('continue', 'other')
		addLuaText('continue', true)
	end
end
function onStartCountdown()
	if not waitThing and isStoryMode and not seenCutscene then --Block the first countdown
		startVideo('jeff3');
		waitThing = true
		return Function_Stop;
	end

	if isStoryMode and not allowCountdown then
		return Function_Stop
	end
	if isStoryMode and allowCountdown then
		return Function_Continue
	end
	return Function_Continue;
end
function onStepHit()
    if curStep == 1 then
		doTweenX('jeff4', 'jeff4', 0, 0.5, "quartInOut")
	end
	if curStep == 18 then
		doTweenAlpha('jeff4', 'jeff4', 0, 1, "quartInOut")
    end
    if curStep == 64 then
	cameraFlash('game', 0xFFFF0000, 2,false)
	setProperty('burn.visible', true);
	setProperty("treeoverlayfire.visible", true);
	setProperty('jeffbg.visible', false);
	setProperty('treeoverlay.visible', false);
	end
	if curStep == 788 then
		doTweenAlpha('game', 'camGame', 0, 4, "quartInOut")
	end
	if curStep == 816 then
	doTweenAlpha('game', 'camGame', 1, 4, "quartInOut")
	setProperty('burn.visible', false);
	setProperty("treeoverlayfire.visible", false);
	setProperty('jeffbg.visible', false);
	setProperty('treeoverlay.visible', false);
	setProperty('gf.visible', false);
	end
	if curStep == 1088 then
	cameraFlash('game', 0xFFFF0000, 2,false)
	setProperty('gf.visible', true);
	setProperty('burn.visible', true);
	setProperty("treeoverlayfire.visible", true);
	setProperty('jeffbg.visible', false);
	setProperty('treeoverlay.visible', false);
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
    if 	isStoryMode and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SHIFT') and confirmed == 0 then
		allowCountdown = true
		startCountdown();
		doTweenAlpha('warningimage', 'warningimage', 0, 1, sineOut);
		doTweenAlpha('continue', 'continue', 0, 1, sineOut);
		playSound('confirmMenu');
		confirmed = 1
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
		startVideo('jeff4');
		allowEnd = true;
		return Function_Stop;
	end
	return Function_Continue;
end