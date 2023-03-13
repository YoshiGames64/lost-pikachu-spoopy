-- Event notes hooks
function onEvent(name, value1, value2)
	if name == 'Rip Headphone Users' then
		playSound(value1, value2)
	end
end