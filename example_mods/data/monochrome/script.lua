function onCreate()
	setProperty('boyfriend.alpha', 0)
	setProperty('gf.alpha', 0)
	setProperty('healthBar.alpha', 0)
	setProperty('timeBar.alpha', 0)
	setProperty('healthBarBG.alpha', 0)
	setProperty('timeBarBG.alpha', 0)
	setProperty('iconP1.alpha', 0)
	setProperty('iconP2.alpha', 0)
	setProperty('scoreTxt.alpha', 0)
	makeLuaSprite('jumpScare', '2', 0, 0)
	screenCenter('jumpScare')
	addLuaSprite('jumpScare', true)
	makeLuaSprite('jumpScare2', '1', 0, 0)
	screenCenter('jumpScare2')
	addLuaSprite('jumpScare2', true)
	setProperty('jumpScare.visible', false)
	setObjectCamera('jumpScare', 'camHUD')
	setProperty('jumpScare2.visible', false)
	setObjectCamera('jumpScare2', 'camHUD')
	makeLuaSprite('text', 'text', 0, 0)
	setGraphicSize('text', screenWidth, screenHeight)
	screenCenter('text')
	setProperty('text.visible', false)
	setObjectCamera('text', 'camHUD')
	addLuaSprite('text', true)
end

function onCreatePost()
	noteTweenX('note0xpos', 0, defaultOpponentStrumX0 - 4000, 0.001, 'linear')
	noteTweenX('note1xpos', 1, defaultOpponentStrumX1 - 4000, 0.001, 'linear')
	noteTweenX('note2xpos', 2, defaultOpponentStrumX2 - 4000, 0.001, 'linear')
	noteTweenX('note3xpos', 3, defaultOpponentStrumX3 - 4000, 0.001, 'linear')
end

function onStepHit()
	if curStep == 5 then
		noteTweenAlpha('note4alpha', 4, 0, 0.001, 'linear')
		noteTweenAlpha('note5alpha', 5, 0, 0.001, 'linear')
		noteTweenAlpha('note6alpha', 6, 0, 0.001, 'linear')
		noteTweenAlpha('note7alpha', 7, 0, 0.001, 'linear')
		noteTweenAlpha('note0alpha', 0, 0, 0.001, 'linear')
		noteTweenAlpha('note1alpha', 1, 0, 0.001, 'linear')
		noteTweenAlpha('note2alpha', 2, 0, 0.001, 'linear')
		noteTweenAlpha('note3alpha', 3, 0, 0.001, 'linear')
	end

	if curStep == 10 then
		setProperty('camHUD.visible', true)
	end

	if curStep == 120 then
		setProperty('dad.visible', true)
		triggerEvent('Play Animation', 'spawnIn', 'dad')
	end

	if curStep == 256 then
		setProperty('text.visible', true)
		runTimer('textvanish', 5.625)
	end

	if curStep == 512 then
		setProperty('text.visible', true)
		runTimer('textvanish', 4.5)
	end

	if curStep == 896 then
		setProperty('text.visible', true)
		runTimer('textvanish', 3.75)
	end

	if curStep == 1280 then
		setProperty('text.visible', true)
		runTimer('textvanish', 3.75)
	end

	if curStep == 1408 then
		setProperty('text.visible', true)
		runTimer('textvanish', 3)
	end

	if curStep == 504 or curStep == 952 then
		jumpscare(0.75, true, 1)
	end

	if curStep == 964 or curStep == 972 or curStep == 980 then
		jumpscare(0.38, true, 1)
	end

	if curStep == 1116 then
		jumpscare(0.38, false, 1)
	end

	if curStep == 1208 then
		jumpscare(0.75, false, 1)
	end

	if curStep == 1536 then
		jumpscare(1.11, false, 1)
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'textvanish' then
		setProperty('text.visible', false)
	end
	
	if tag == 'jumpscarevanish' then
		setProperty('jumpScare.alpha', 0)
		setProperty('jumpScare2.alpha', 0)
	end
	
	if tag == 'jumpscarevanishtype2' then
		setProperty('jumpScare.alpha', 0)
	end
	
	if tag == 'ripdad' then
		setProperty('dad.visible', false)
		setProperty('blakShit.visible', true)
	end
end

function jumpscare(duration, chance, tirelol) 
	if tirelol == 1 then
		if chance == true then
			randomchancestatus = getRandomInt(0, 100)
			if randomchancestatus > 50 then
				if randomchancestatus > 50 then
					setProperty('jumpScare.visible', true)
					setProperty('jumpScare.alpha', 100)
				else
					setProperty('jumpScare2.visible', true)
					setProperty('jumpScare2.alpha', 100)
				end
				runTimer('jumpscarevanish', duration)
			end
		else
			randomchancestatus = getRandomInt(0, 100)
			if randomchancestatus > 50 then
				setProperty('jumpScare.visible', true)
				setProperty('jumpScare.alpha', 100)
			else
				setProperty('jumpScare2.visible', true)
				setProperty('jumpScare2.alpha', 100)
			end
			runTimer('jumpscarevanish', duration)
		end
	end

	if tirelol == 2 then
		setProperty('jumpScare.visible', true)
		setProperty('jumpScare.alpha', 100)
		runTimer('jumpscarevanishtype2', duration)
	end
end

function onBeatHit()
	if curBeat == 28 then
		doTweenAlpha('heathbaralpha', 'healthBar', 0.4, 3, 'linear')
		doTweenAlpha('healthbarbgalpha', 'healthBarBG', 0.4, 3, 'linear')
		doTweenAlpha('scoretxtalpha', 'scoreTxt', 0.4, 3, 'linear')
		doTweenAlpha('iconp1alpha', 'iconP1', 1, 3, 'linear')
		doTweenAlpha('iconp2alpha', 'iconP2', 1, 3, 'linear')
		noteTweenAlpha('note4alpha', 4, 0.7, 3, 'linear')
		noteTweenAlpha('note5alpha', 5, 0.7, 3, 'linear')
		noteTweenAlpha('note6alpha', 6, 0.7, 3, 'linear')
		noteTweenAlpha('note7alpha', 7, 0.7, 3, 'linear')
	end

	if curBeat == 392 then
		triggerEvent('Play Animation', 'spawnOut', 'dad')
		runTimer('ripdad', 0.75)
		doTweenAlpha('healthbaralpha', 'healthBar', 0, 1, 'linear')
		doTweenAlpha('timebaralpha', 'healthBar', 0, 1, 'linear')
		doTweenAlpha('healthbarbgalpha', 'healthBarBG', 0, 1, 'linear')
		doTweenAlpha('timebarbgalpha', 'healthBarBG', 0, 1, 'linear')
		doTweenAlpha('scoretxtalpha', 'scoreTxt', 0, 1, 'linear')
		doTweenAlpha('iconp1alpha', 'iconP1', 0, 1, 'linear')
		doTweenAlpha('iconp2alpha', 'iconP2', 0, 1, 'linear')
		noteTweenAlpha('note4alpha', 4, 0, 1, 'linear')
		noteTweenAlpha('note5alpha', 5, 0, 1, 'linear')
		noteTweenAlpha('note6alpha', 6, 0, 1, 'linear')
		noteTweenAlpha('note7alpha', 7, 0, 1, 'linear')
	end
end