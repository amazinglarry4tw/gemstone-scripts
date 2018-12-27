fput "take #{variable[1]}"
@unsuccessful = false

def try
	line = get
	if line =~ /Get what?|You remove/
		@unsuccessful = true
	end
end

until @unsuccessful
	fput "take #{variable[1]}"
	try
	fput "put #{variable[1]} in my #{variable[2]}"
end