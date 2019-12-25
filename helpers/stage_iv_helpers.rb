module StageIVHelpers
	
	# @param [String] Person's attribute
	# @return [String] Blank string
	def calculate_spaces(string)
		# calculates how many spaces to write between two attributes in the same row
		" " * (16 - string.length)
	end

	# @param [Array] Array of sorted Person objects
	# @return [String] Formatted text 
	def formatter(persons_array)
		output_string = ""
		persons_array.each do |person|
			output_string <<  "#{person.last_name + calculate_spaces(person.last_name)}" +
												"#{person.first_name + calculate_spaces(person.first_name)}" +
												"#{person.gender + calculate_spaces(person.gender)}" +
												"#{person.dob.strftime('%-m/%-d/%-Y') + calculate_spaces(person.dob.strftime('%-m/%-d/%-Y'))}" +
												"#{person.favorite_color + calculate_spaces(person.favorite_color)}\n"
		end
		output_string
	end
end