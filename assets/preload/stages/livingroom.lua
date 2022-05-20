function onCreate()
	makeAnimatedLuaSprite('DAambience', 'jeffbg/candles', 778.25, 1010.5);
	addAnimationByPrefix('DAambience', 'loop', 'candles', 24, true);
	addLuaSprite('DAambience', true);
	objectPlayAnimation('DAambience', 'loop');

	makeLuaSprite('jeffbg', 'jeffbg/ambience', 0, 0);
	setObjectCamera('jeffbg','hud')
	setScrollFactor('jeffbg', 1, 1);
	addLuaSprite('jeffbg', false);

	makeLuaSprite('treeoverlay', 'jeffbg/livingroom', 0, 0);
	setScrollFactor('treeoverlay', 1, 1);
	addLuaSprite('treeoverlay', false);

	makeAnimatedLuaSprite('sleep', 'sleep', 230.8, 315.95);
	addAnimationByPrefix('sleep', 'loop', 'go to sleep', 24, true);
	setObjectCamera('sleep','other')
	addLuaSprite('sleep', true);
	objectPlayAnimation('sleep', 'loop');

	makeLuaSprite('gfjeff', 'titles/gfjeff', -400, 220);
	setScrollFactor('gfjeff', 0, 0);
	setObjectCamera('gfjeff','other')
	scaleObject('gfjeff', 0.4, 0.4)
	addLuaSprite('gfjeff', true);

	makeLuaSprite('title', 'titles/lullaby', 0, 0);
	setObjectCamera('title','other')
	setScrollFactor('title', 1, 1);
	addLuaSprite('title', true);

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
function onCreatePost()
setProperty("gf.visible", false);
setProperty("iconP2.visible", false);
setProperty("iconP1.visible", false);
setProperty("healthBar.visible", false);
setProperty("healthBarBG.visible", false);
setProperty("scoreTxt.visible", false);
end