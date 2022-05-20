function onCreate()
	makeLuaSprite('lastscene', 'borderthing', 73, 0);
	addLuaSprite('lastscene', true);

	makeLuaSprite('rap', 'rapthing', 0, 0);
	setScrollFactor('rap', 0, 0);
	setObjectCamera('rap','other')
	addLuaSprite('rap', true);

	makeLuaSprite('epic', 'titles/epic', -390, 220);
	setScrollFactor('epic', 0, 0);
	scaleObject('epic', 0.9, 0.9)
	setObjectCamera('epic','other')
	addLuaSprite('epic', true);

	makeAnimatedLuaSprite('burn', 'fireloop', -600, -300);
	addAnimationByPrefix('burn', 'loop', 'fire', 24, true);
	addLuaSprite('burn', false);
	scaleObject('burn', 5.3, 5.3)
	objectPlayAnimation('burn', 'loop');

	makeLuaSprite('bg', 'eminembg', 79, -22);
	addLuaSprite('bg', false);

	makeLuaSprite('box1', 'black 1', 0, 0);
	setObjectCamera('box1','other')
	addLuaSprite('box1', true);

	makeLuaSprite('box2', 'black 2', 0, 0);
	setObjectCamera('box2','other')
	addLuaSprite('box2', true);

	makeLuaSprite('vs', 'vs', 0, 0);
	setObjectCamera('vs','other')
	addLuaSprite('vs', true);

	makeLuaSprite('bartop','',0,0)
	makeGraphic('bartop',1280,77,'000000')
	addLuaSprite('bartop',true)

	makeLuaSprite('barbot','',0,644)
	makeGraphic('barbot',1280,77,'000000')
	addLuaSprite('barbot',true)
	setScrollFactor('bartop',0,0)
	setScrollFactor('barbot',0,0)
	setObjectCamera('bartop','hud')
	setObjectCamera('barbot','hud')
end
function onCreatePost()--this thing happens once the characters are spawned

setProperty("gf.visible", false);
setProperty("opponentStrums.visible", false);
end
