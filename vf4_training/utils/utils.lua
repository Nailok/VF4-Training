Utils = {}

function Utils.convert_to_signed16(value)
	if value == nil then
		return 0
	end

	if value > 32768 then
		value = value - (2 * 32768)
		return value
	else
        return value
	end
end

function Utils.bool_to_string(value)
	if value == true then
		return 'true'
	else 
		return 'false'
	end
end

function Utils.present_in_array(value, array)
	for _, v in pairs(array) do
		if value == v then
			return true
		end
	end
end