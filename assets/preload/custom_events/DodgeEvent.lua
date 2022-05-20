function onCreate()
    --variables
	Dodged = false;
    canDodge = false;
    DodgeTime = 0;
	
    precacheImage('DODGE');
end

function onEvent(name, value1, value2)
    if name == "DodgeEvent" then
    --Get Dodge time
    DodgeTime = (value1);
	
    --Make Dodge Sprite
	makeLuaSprite('DODGE', 'DODGE', 0, 0);
	setObjectCamera('DODGE','other')
	addLuaSprite('DODGE', true);
    playSound("dodge", 0.7)
	
	--Set values so you can dodge
	canDodge = true;
	runTimer('Died', DodgeTime);
	
	end
end

function onUpdate()
   if canDodge == true and keyJustPressed('accept') then
   
   Dodged = true;
   
   setProperty('boyfriend.specialAnim', true);
   removeLuaSprite('DODGE');
   canDodge = false
   
   end
end

function onTimerCompleted(tag, loops, loopsLeft)
   if tag == 'Died' and Dodged == false then
   setProperty('health', 0);
   
   elseif tag == 'Died' and Dodged == true then
   characterPlayAnim('boyfriend', 'dodge', true);
   characterPlayAnim('dad', 'stab', true);
   cameraShake(game, 0.05, 0.5)
   Dodged = false
   
   end
end