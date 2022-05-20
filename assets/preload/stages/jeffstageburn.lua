function onCreate()

	makeAnimatedLuaSprite('DAambience', 'ambience', -135, -26);
	addAnimationByPrefix('DAambience', 'loop', 'ambience0', 24, true);
	setObjectCamera('DAambience','hud')
	addLuaSprite('DAambience', true);
	objectPlayAnimation('DAambience', 'loop');

	makeLuaSprite('jeff4', 'titles/jeff4', -400, 220);
	setScrollFactor('jeff4', 0, 0);
	setObjectCamera('jeff4','hud')
	scaleObject('jeff4', 0.4, 0.4)
	addLuaSprite('jeff4', true);

	makeLuaSprite('jeffbg', 'jeffbg/normaljeffbg', -800.2, -338);
	setScrollFactor('jeffbg', 1, 1);
	addLuaSprite('jeffbg', false);

	makeLuaSprite('treeoverlay', 'jeffbg/treeoverlay', -960.35, -438);
	setScrollFactor('treeoverlay', 0.7, 0.7);
	addLuaSprite('treeoverlay', true);

	scaleObject('jeffbg', 1, 1)
	scaleObject('treeoverlay', 1, 1)

	makeAnimatedLuaSprite('burn', 'jeffbg/jefffirebg', -800.2, -378);
	addAnimationByPrefix('burn', 'loop', 'fire', 30, true);
	addLuaSprite('burn', false);
	objectPlayAnimation('burn', 'loop');

	makeLuaSprite('treeoverlayfire', 'jeffbg/firejefftrees', -960.35, -438);
	setScrollFactor('treeoverlayfire', 0.7, 0.7);
	addLuaSprite('treeoverlayfire', true);
end

function onCreatePost()--this thing happens once the characters are spawned

	setProperty("burn.visible", false);
	setProperty("treeoverlayfire.visible", false);
end
