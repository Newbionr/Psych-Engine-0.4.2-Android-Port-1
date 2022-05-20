function onCreate()
    --variables
	Dodged = false;
    canDodge = false;
    DodgeTime = 0;
    precacheImage('warning');
end

function onEvent(name, value1, value2)
    if name == "DodgeEventCyndaquil" then
    --Get Dodge time
    DodgeTime = (value1);
	
    --Make Dodge Sprite
	makeAnimatedLuaSprite('spacebar', 'warning', 10.35, -3.45);
    luaSpriteAddAnimationByPrefix('spacebar', 'spacebar', 'warning', 25, true);
	luaSpritePlayAnimation('spacebar', 'spacebar');
	setObjectCamera('spacebar', 'other');
    addLuaSprite('spacebar', true); 
    setProperty('spacebar.alpha', 0.7);
	playSound("warning", 0.7)
	--Set values so you can dodge
	canDodge = true;
	runTimer('Died', DodgeTime);
	
	end
end

function onUpdate()
   if canDodge == true and keyJustPressed('accept') then
   
   Dodged = true;
   
   setProperty('boyfriend.specialAnim', true);
   removeLuaSprite('spacebar');
   canDodge = false
   
   end
end

function onTimerCompleted(tag, loops, loopsLeft)
   if tag == 'Died' and Dodged == false then
   setProperty('health', 0);
   
   elseif tag == 'Died' and Dodged == true then
   objectPlayAnimation('cyndaquil', 'attack', true);
   makeAnimatedLuaSprite('fire', 'explosion', 135, -26);
   addAnimationByPrefix('fire', 'loop', 'EXPLOSION0', 24, false);
   setObjectCamera('fire','game')
   addLuaSprite('fire', false);
   objectPlayAnimation('fire', 'loop');
   scaleObject('fire', 1.6, 1.6)
   playSound("boom", 0.7)
   characterPlayAnim('boyfriend', 'dodge', false);
   cameraShake(game, 0.05, 0.4)

   Dodged = false
   
   end
end