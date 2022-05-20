function onCreate()
	
	makeAnimatedLuaSprite('DAambience', 'ambience', -135, -26);
	addAnimationByPrefix('DAambience', 'loop', 'ambience0', 24, true);
	setObjectCamera('DAambience','hud')
	addLuaSprite('DAambience', true);
	objectPlayAnimation('DAambience', 'loop');
	
	makeLuaSprite('jeff1', 'titles/jeff1', -400, 220);
	setScrollFactor('jeff1', 0, 0);
	setObjectCamera('jeff1','hud')
	scaleObject('jeff1', 0.4, 0.4)
	addLuaSprite('jeff1', true);

	makeLuaSprite('jeff2', 'titles/jeff2', -400, 220);
	setScrollFactor('jeff2', 0, 0);
	setObjectCamera('jeff2','hud')
	scaleObject('jeff2', 0.4, 0.4)
	addLuaSprite('jeff2', true);

	makeLuaSprite('jeff3', 'titles/jeff3', -400, 220);
	setScrollFactor('jeff3', 0, 0);
	setObjectCamera('jeff3','hud')
	scaleObject('jeff3', 0.4, 0.4)
	addLuaSprite('jeff3', true);

	makeLuaSprite('jeffbg', 'jeffbg/normaljeffbg', -800.2, -338);
	setScrollFactor('jeffbg', 1, 1);
	addLuaSprite('jeffbg', false);

	makeLuaSprite('warning1', 'warningPages/jeff', 0, 0);
	setObjectCamera('warning1','other')
	addLuaSprite('warning1', true);

	makeLuaSprite('treeoverlay', 'jeffbg/treeoverlay', -960.35, -438);
	setScrollFactor('treeoverlay', 0.7, 0.7);
	addLuaSprite('treeoverlay', true);

	scaleObject('jeffbg', 1, 1)
	scaleObject('treeoverlay', 1, 1)

	close(true)
end

function onCreatePost()--this thing happens once the characters are spawned

setProperty("warning1.visible", false);
end