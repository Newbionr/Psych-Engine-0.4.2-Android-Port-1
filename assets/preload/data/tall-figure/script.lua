local allowCountdown = false
local waitThing = false
local confirmed = 0

function onCreate()
	addCharacterToList('yeet', 'gf')
	precacheImage('mods/images/characters/yeet')
	setPropertyFromClass('GameOverSubstate', 'characterName', 'slenderdeath');
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx');
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver');
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd');
	setProperty("static.alpha", 0);
	setProperty("jumpywumpy.alpha", 0);
	if isStoryMode then
		makeLuaSprite('warningimage', 'warningPages/slender', 0, 0)
		screenCenter('warningimage', 'xy')
		setObjectCamera('warningimage', 'other')
		
		addLuaSprite('warningimage', true)

		makeLuaText('continue', "Press SHIFT to Continue", 0.8, 1020, 20)
		setObjectCamera('continue', 'other')
		addLuaText('continue', true)
	end
end
function onStartCountdown()
	if not waitThing and isStoryMode and not seenCutscene then --Block the first countdown
		startVideo('slender');
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
function onUpdate()
	if 	isStoryMode and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SHIFT') and confirmed == 0 then
		allowCountdown = true
		startCountdown();
		doTweenAlpha('warningimage', 'warningimage', 0, 1, sineOut);
		doTweenAlpha('continue', 'continue', 0, 1, sineOut);
		playSound('confirmMenu');
		confirmed = 1
	end
end
function onStepHit()
    if curStep == 1 then
		doTweenX('slender1', 'slender1', 0, 0.5, "quartInOut")
	end
	if curStep == 18 then
		doTweenAlpha('slender1', 'slender1', 0, 1, "quartInOut")
    end
end