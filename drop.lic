fput "take #{variable[1]} from my #{variable[2]}"
@unsuccessful = false

def try
	if get.include? "Get what?"
		@unsuccessful = true
	end
end

until @unsuccessful
	fput "take #{variable[1]} from my #{variable[2]}"
	try
	fput "drop #{variable[1]}"
end
