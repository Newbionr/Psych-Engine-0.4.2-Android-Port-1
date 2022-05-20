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
local allowCountdown = false;

function onCreate()
	setProperty('camGame.alpha', 0);
    setProperty('camHUD.alpha', 0);
	setPropertyFromClass('GameOverSubstate', 'characterName', 'jeffdeath');
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx');
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver');
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd');
end
function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
		startVideo('jeff2');
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end
function onSongStart()
    for i = 0,7 do 
        x = getPropertyFromGroup('strumLineNotes', i, 'x')

        y = getPropertyFromGroup('strumLineNotes', i, 'y')

        table.insert(defaultNotePos, {x,y})
    end
end

function onUpdate(elapsed)

    songPos = getPropertyFromClass('Conductor', 'songPosition');

    currentBeat = (songPos / 1000) * (bpm / 60)

    if spin == true then 
        for i = 0,7 do 
            setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + arrowMoveX * math.sin((currentBeat + i*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + arrowMoveY * math.cos((currentBeat + i*0.25) * math.pi))
        end
    end
end

function onStepHit()
    if curStep == 1 then
		doTweenX('jeff2', 'jeff2', 0, 0.5, "quartInOut")
	end
	if curStep == 18 then
		doTweenAlpha('jeff2', 'jeff2', 0, 1, "quartInOut")
    end
    stepdev = curStep % 16;
    if stepdev == 0 then 
        section = curStep / 16;
    end
--if stepdev == 768 or stepdev == 1088 then
    if section >= 48 and section <= 70 then  
        spin = true;
    end

    if stepdev == 1 then 
	doTweenAlpha('game', 'camGame', 1, 2, "quartInOut")
    doTweenAlpha('hud', 'camHUD', 1, 2, "quartInOut")
    end
end

function coolresetStrums(time)
    for i = 4,7 do
        noteTweenX("movementX " .. i, i, defaultNotePos[i + 1][1], time, "linear")
        noteTweenY("movementY " .. i, i, defaultNotePos[i + 1][2], time, "linear")
        noteTweenAngle("movementAngle " .. i, i, 360, time, "linear")
    end
end

function randomNote()
    for i = 4,7 do 
        setPropertyFromGroup('strumLineNotes', i, 'x', 
        defaultNotePos[i + 1][1] + math.floor(math.random(-150,150)))

        if downscroll == true then 
            ylowest = 50;
            yhighest = -150;
        else 
            ylowest = -150
            yhighest = 150;
        end

        setPropertyFromGroup('strumLineNotes', i, 'y', 
        defaultNotePos[i + 1][2] + math.floor(math.random(ylowest,yhighest)))
    end
end

function bumpArrows(time, amount, smallamount)
    for i = 0,7 do
        shit = 0;
        if i % 4 == 0 then
            shit = -amount
        end
        if i % 4 == 1 then
            shit = -smallamount
        end
        if i % 4 == 2 then
            shit = smallamount
        end
        if i % 4 == 3 then
            shit = amount
        end
        setPropertyFromGroup('strumLineNotes', i, 'x', getPropertyFromGroup('strumLineNotes', i, 'x') + shit)
        noteTweenX("movementXbump " .. i, i, getPropertyFromGroup('strumLineNotes', i, 'x') - shit, time, "linear")
    end
end

function fadeStrums(alpha,time,movebf,movedad)
    if time <= 0 then
        if movebf == true then
            for i = 4,7 do 
                setPropertyFromGroup('strumLineNotes', i, 'alpha', alpha)
            end
        end
        if movedad == true then
            for i = 0,3 do 
                setPropertyFromGroup('strumLineNotes', i, 'alpha', alpha)
            end
        end
    else
        if movebf == true then
            for i = 4,7 do 
                noteTweenAlpha("movementAlpha " .. i, i, alpha, time, "linear")
            end
        end
        if movedad == true then
            for i = 0,3 do 
                noteTweenAlpha("movementAlpha " .. i, i, alpha, time, "linear")
            end
        end
    end
end

function movebyStrumLine(x,y,time,movebf,movedad) --based on left arrow postion -lunar
    if y == nil then 
        if downscroll == true then -- acounts for scrolling - lunar
            y = 570
        else
            y = 50
        end
    end

    if time <= 0 then
        if movebf == true then
            for i = 4,7 do 
                setPropertyFromGroup('strumLineNotes', i, 'x', x + ((i - 4) * 112))
                setPropertyFromGroup('strumLineNotes', i, 'y', y)
            end
        end
        if movedad == true then
            for i = 0,3 do 
                setPropertyFromGroup('strumLineNotes', i, 'x', x + (i * 112))
                setPropertyFromGroup('strumLineNotes', i, 'y', y)
            end
        end
    else
        if movebf == true then
            for i = 4,7 do 
                noteTweenX("movementX " .. i, i, x + ((i - 4) * 112), time, "linear")
                noteTweenY("movementY " .. i, i, y, time, "linear")
            end
        end
        if movedad == true then
            for i = 0,3 do 
                noteTweenX("movementX " .. i, i, x + (i * 112), time, "linear")
                noteTweenY("movementY " .. i, i, y, time, "linear")
            end
        end
    end
end

function resetStrums()
    for i = 0,7 do
        setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1])
        setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2])
        setPropertyFromGroup('strumLineNotes', i, 'alpha', 1)
        setPropertyFromGroup('strumLineNotes', i, 'angle', 0)
    end
end 

function moveAllStrums(x,y,time,movebf,movedad)
    if time <= 0 then
        if movebf == true then
            for i = 4,7 do 
                setPropertyFromGroup('strumLineNotes', i, 'x', x)
                setPropertyFromGroup('strumLineNotes', i, 'y', y)
            end
        end
        if movedad == true then
            for i = 0,3 do 
                setPropertyFromGroup('strumLineNotes', i, 'x', x)
                setPropertyFromGroup('strumLineNotes', i, 'y', y)
            end
        end
    else
        if movebf == true then
            for i = 4,7 do 
                noteTweenX("movementX " .. i, i, x, time, "linear")
                noteTweenY("movementY " .. i, i, y, time, "linear")
            end
        end
        if movedad == true then
            for i = 0,3 do 
                noteTweenX("movementX " .. i, i, x, time, "linear")
                noteTweenY("movementY " .. i, i, y, time, "linear")
            end
        end
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

