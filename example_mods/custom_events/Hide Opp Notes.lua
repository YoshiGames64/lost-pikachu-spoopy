function onEvent(elapsed)
 for i=0,3 do
noteTweenAlpha(i+0, i, math.floor(curStep/9000), 0.3)
end
end