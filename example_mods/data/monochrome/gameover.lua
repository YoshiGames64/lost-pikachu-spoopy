function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'brain'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'egh'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'heeeeeeeeehee'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'IM DEAAAD'); --put in mods/music/
end