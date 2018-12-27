fput "take #{variable[1]} from my #{variable[2]}"
until get.include? "Get what?"
	fput "take #{variable[1]} from my #{variable[2]}"
	fput "drop #{variable[1]}"
end
