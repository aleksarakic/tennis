require_relative 'entities/person'

class StageII
	# creates Person objects

	# @param [Array] takes a nested array of parsed persons data
	# @return [Array] returns an array of Person objects
	def self.call(persons_array)
		output_array = []
		persons_array.each do |person|
		output_array << Entities::Person.new(last_name: person[0], 
																				first_name: person[1],
																				gender: person[2],
																				dob: person[3],
																				favorite_color: person[4])
			end
		output_array
	end
end