function onCreate()
	-- background shit
	makeLuaSprite('blackbg', 'blackbg', -650, -600);
	setLuaSpriteScrollFactor('blackbg', 0.2, 0.2);
	
	addLuaSprite('blackbg', false);
	
	close(false); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end