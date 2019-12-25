require 'time'

module StageIIIHelpers

	# @param [Array] Array of Person objects
	# @return [Array] returns Person objects grouped by gender
	def sort_by_gender(persons_array)
		# offset variable determines how many places from the last element in the array person should be offset
		offset = -1
		# perform reverse loop, and send males to the end of the array
		persons_array.to_enum.with_index.reverse_each do |person, indx|
			if person.gender == 'Male'
				# 'insert' method inserts element returned by 'delete_at' method 
				# at the index represented by offset variable
				persons_array.insert(offset, persons_array.delete_at(indx))
				offset -= 1
			end 
		end
		persons_array
	end

	# @param [String] direction ('asc' or 'desc')
	# @return [String] determined direction
	def determine_operator(direction)
		# dynamically determine sorting direction 
		direction = direction.downcase

		case direction 
		when 'asc'
			'<'
		when 'desc' 
			'>'
		else
			'Invalid'
		end
	end

	# @param [Array] Array of Person objects
	# @param [String] Order direction (asc / desc). Sorts in ascending order by default
	# @return [Array] Array of sorted Person objects
	def sort_persons_alphabetically(persons_array, direction='asc')
		# insertion sort algorithm

		# exit if persons_array is either empty or has one element
		return persons_array unless persons_array.length > 1

		operator = determine_operator(direction) 
		raise "Invalid Sorting Direction. Method accepts 'asc' and 'desc' strings as parameters" if operator == 'Invalid'

		persons_array.each_with_index do |person, indx|
			next if indx == 0 
			j = indx - 1
			char_index = 0

			iterator = -> (char_index) {
				# move current element to the left while it's first letter ASCII value is smaller than of those on it's left 
				while person.last_name[char_index].ord.send(operator, persons_array[j].last_name[char_index].ord) && j >= 0
					# reset char_index variable so we can compare words 
					char_index = 0
					# switch places
					persons_array[j + 1] = persons_array[j] 
					j -= 1
				end
				# switch places
				persons_array[j + 1] = person
				# if the current's element first letter is equal to the element's to it's left side, check other letters 
				if person.last_name[char_index].ord == persons_array[j].last_name[char_index].ord
					char_index += 1
					iterator.call(char_index) unless char_index == person.last_name.length 
				end
			}
			iterator.call(char_index)
		end
		persons_array
	end


	# @param [Array] Array of Person objects
	# @return [Array] Array of Person objects sorted by date
	def sort_by_date(persons_array)
		# insertion sort algorithm

		# exit if persons_array is either empty or has one element
		return persons_array unless persons_array.length > 1

		persons_array.each_with_index do |person, indx|
			# start from the 1st element
			next if indx == 0 
			j = indx - 1			

			# move element to the beginning of the array while it's date is 'smaller' 
			# than of those with which is compared 
			while person.dob < persons_array[j].dob && j >= 0
				# switch places
				persons_array[j + 1] = persons_array[j] 
				j -= 1
			end
			# switch places
			persons_array[j + 1] = person

		end
		persons_array
	end

	### Begin
	### Sorts Person objects by date without use of Ruby's Time class

	# # @param [Person] 
	# # @return [Array] returns Array of integers (splitted date of birth)
	# def split_by_slash(person)
	# 	person.dob.split('/').map(&:to_i)
	# end

	# def sort_by_date(persons_array)
	# 	# insertion sort algorithm

	# 	# exit if persons_array is either empty or has one element
	# 	return persons_array unless persons_array.length > 1

	# 	persons_array.each_with_index do |person, indx|
	# 		next if indx == 0 
	# 		j = indx - 1
	# 		# variable on which is decided which dob number is compared with others - year, month, or day 
	# 		dob_level = 2
	# 		# decide which dob_level is next to be checked. Eg. if dob_level is 2 (year), next check dob_level 0 (month)   
	# 		level_map = {0 => 1, 1 => 1, 2 => 0}
			
	# 		lamb = ->(dob_level) {
	# 			# move current element to the left while it is smaller than elements on it's left
	# 			while split_by_slash(person)[dob_level] < split_by_slash(persons_array[j])[dob_level] && j >= 0
	# 				persons_array[j + 1] = persons_array[j] 
	# 				j -= 1
	# 			end
	# 			persons_array[j + 1] = person

	# 			# if the current element is equal to the element to it's left side, go level deeper and check months and days 
	# 			if split_by_slash(person)[dob_level] == split_by_slash(persons_array[j])[dob_level] && dob_level >= 0
	# 				lamb.call(level_map[dob_level]) unless dob_level == 1
	# 			end
	# 		}
	# 		lamb.call(dob_level)
	# 	end
	# 	persons_array
	# end
	
	### End
end