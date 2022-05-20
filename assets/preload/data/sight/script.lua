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
	setPropertyFromClass('GameOverSubstate', 'characterName', 'slenderdeath');
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx');
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver');
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd');
	setProperty("static.alpha", 0);
	setProperty("jumpywumpy.alpha", 0);
	setProperty("rain.alpha", 0);
	precacheImage("maskyboo")
	addCharacterToList('slenderSKETCH', 'dad')
	addCharacterToList('Trep_bfSKETCH', 'boyfriend')
end
function onStepHit()
    if curStep == 1 then
		doTweenX('slender3', 'slender3', 0, 0.5, "quartInOut")
	end
	if curStep == 18 then
		doTweenAlpha('slender3', 'slender3', 0, 1, "quartInOut")
    end
	if curStep == 240 then
		setProperty("jumpywumpy.alpha", 1);
    end
	if curStep == 249 then
		setProperty("jumpywumpy.alpha", 0);
    end
	if curStep == 824 then
		makeAnimatedLuaSprite('boo', 'maskyboo', 690, 0);
		addAnimationByPrefix('boo', 'loop', 'maskyboo0', 24, false);
		setObjectCamera('boo','hud')
		addLuaSprite('boo', true);
		objectPlayAnimation('boo', 'loop');
	end
	if curStep == 835 then
		noteTweenY("NoteMove8", 7, 138, 0.08, cubeIn)
	end
	if curStep == 1024 then
		noteTweenY("NoteMove8", 7, 50, 0.08, cubeIn)
	end
	if curStep == 870 then
		removeLuaSprite('boo', true);
	end
	if curStep == 1264 then
		setProperty("gf.visible", false)
		setProperty("lefttree.visible", false)
		setProperty("righttree.visible", false)
		setProperty("stage.visible", false)
		setProperty("forest.visible", false)
		setProperty("sky.visible", false)
    end
	if curStep == 1265 then
		setProperty("gf.visible", true)
		setProperty("lefttree.visible", true)
		setProperty("righttree.visible", true)
		setProperty("stage.visible", true)
		setProperty("forest.visible", true)
		setProperty("sky.visible", true)
    end
	if curStep == 1266 then
		setProperty("gf.visible", false)
		setProperty("lefttree.visible", false)
		setProperty("righttree.visible", false)
		setProperty("stage.visible", false)
		setProperty("forest.visible", false)
		setProperty("sky.visible", false)
    end
	if curStep == 1267 then
		setProperty("gf.visible", true)
		setProperty("lefttree.visible", true)
		setProperty("righttree.visible", true)
		setProperty("stage.visible", true)
		setProperty("forest.visible", true)
		setProperty("sky.visible", true)
    end
	if curStep == 1268 then
		setProperty("gf.visible", false)
		setProperty("lefttree.visible", false)
		setProperty("righttree.visible", false)
		setProperty("stage.visible", false)
		setProperty("forest.visible", false)
		setProperty("sky.visible", false)
    end
	if curStep == 1269 then
		setProperty("gf.visible", true)
		setProperty("lefttree.visible", true)
		setProperty("righttree.visible", true)
		setProperty("stage.visible", true)
		setProperty("forest.visible", true)
		setProperty("sky.visible", true)
    end
	if curStep == 1270 then
		setProperty("gf.visible", false)
		setProperty("lefttree.visible", false)
		setProperty("righttree.visible", false)
		setProperty("stage.visible", false)
		setProperty("forest.visible", false)
		setProperty("sky.visible", false)
    end
	if curStep == 1271 then
		setProperty("gf.visible", true)
		setProperty("lefttree.visible", true)
		setProperty("righttree.visible", true)
		setProperty("stage.visible", true)
		setProperty("forest.visible", true)
		setProperty("sky.visible", true)
    end
	if curStep == 1272 then
		setProperty("gf.visible", false)
		setProperty("lefttree.visible", false)
		setProperty("righttree.visible", false)
		setProperty("stage.visible", false)
		setProperty("forest.visible", false)
		setProperty("sky.visible", false)
    end
	if curStep == 1273 then
		setProperty("gf.visible", true)
		setProperty("lefttree.visible", true)
		setProperty("righttree.visible", true)
		setProperty("stage.visible", true)
		setProperty("forest.visible", true)
		setProperty("sky.visible", true)
    end
	if curStep == 1274 then
		setProperty("gf.visible", false)
		setProperty("lefttree.visible", false)
		setProperty("righttree.visible", false)
		setProperty("stage.visible", false)
		setProperty("forest.visible", false)
		setProperty("sky.visible", false)
    end
	if curStep == 1275 then
		setProperty("gf.visible", true)
		setProperty("lefttree.visible", true)
		setProperty("righttree.visible", true)
		setProperty("stage.visible", true)
		setProperty("forest.visible", true)
		setProperty("sky.visible", true)
    end
	if curStep == 1276 then
		setProperty("gf.visible", false)
		setProperty("lefttree.visible", false)
		setProperty("righttree.visible", false)
		setProperty("stage.visible", false)
		setProperty("forest.visible", false)
		setProperty("sky.visible", false)
    end
	if curStep == 1277 then
		setProperty("gf.visible", true)
		setProperty("lefttree.visible", true)
		setProperty("righttree.visible", true)
		setProperty("stage.visible", true)
		setProperty("forest.visible", true)
		setProperty("sky.visible", true)
    end
	if curStep == 1278 then
		setProperty("gf.visible", false)
		setProperty("lefttree.visible", false)
		setProperty("righttree.visible", false)
		setProperty("stage.visible", false)
		setProperty("forest.visible", false)
		setProperty("sky.visible", false)
    end
	if curStep == 1279 then
		setProperty("gf.visible", true)
		setProperty("lefttree.visible", true)
		setProperty("righttree.visible", true)
		setProperty("stage.visible", true)
		setProperty("forest.visible", true)
		setProperty("sky.visible", true)
    end
	if curStep == 1280 then
		setProperty("gf.visible", false)
		setProperty("lefttree.visible", false)
		setProperty("righttree.visible", false)
		setProperty("stage.visible", false)
		setProperty("forest.visible", false)
		setProperty("sky.visible", false)
		setProperty("iconP2.visible", false);
        setProperty("iconP1.visible", false);
		setProperty("healthBar.visible", false)
		setProperty("healthBarBG.visible", false)
		setProperty("scoreTxt.visible", false)
    end
	if curStep == 1536 then
		setProperty("gf.visible", true)
		setProperty("lefttree.visible", true)
		setProperty("righttree.visible", true)
		setProperty("stage.visible", true)
		setProperty("forest.visible", true)
		setProperty("sky.visible", true)
		setProperty("iconP2.visible", true);
        setProperty("iconP1.visible", true);
		setProperty("healthBar.visible", true)
		setProperty("healthBarBG.visible", true)
		setProperty("scoreTxt.visible", true)
    end
	if curStep == 1552 then
		doTweenAlpha('game', 'camGame', 0, 3, "quartInOut")
		doTweenAlpha('hud', 'camHUD', 0, 3, "quartInOut")
    end
	if curStep == 1562 then
		doTweenAlpha('jumpywumpy', 'jumpywumpy', 0.5, 1, "quartInOut")
		doTweenAlpha('hud', 'camHUD', 0.6, 1, "quartInOut")
    end
	if curStep == 1568 then
		setProperty("gf.visible", false)
		setProperty("lefttree.visible", false)
		setProperty("righttree.visible", false)
		setProperty("stage.visible", false)
		setProperty("forest.visible", false)
		setProperty("sky.visible", false)
		setProperty("iconP2.visible", false);
        setProperty("iconP1.visible", false);
		setProperty("healthBar.visible", false)
		setProperty("healthBarBG.visible", false)
		setProperty("scoreTxt.visible", false)
    end
	if curStep == 1908 then
		doTweenAlpha('jumpywumpy', 'jumpywumpy', 0, 1, "quartInOut")
		doTweenAlpha('hud', 'camHUD', 0, 1, "quartInOut")
    end
end
function goodNoteHit(id)
	setProperty('static.alpha', getProperty('static.alpha', 0.8)-0.05)
end
function noteMiss(id)
	setProperty('static.alpha', getProperty('static.alpha')+0.07)
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