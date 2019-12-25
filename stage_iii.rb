require './helpers/stage_iii_helpers.rb'

class StageIII
	# sorts Persons

	extend StageIIIHelpers
	
	# @param [Array] set of Person objects
	# @return [Hash] Hash of arrays with sorted Person objects 
	def self.call(persons)
		# serialize persons array
		persons = Marshal.dump(persons)
		# sort alphabetically in ascending order
		sorted = sort_persons_alphabetically(Marshal.load(persons))
		# sort by gender
		gender_sorted = sort_by_gender(sorted)
		# sort by date of birth
		dob_sorted = sort_by_date(Marshal.load(persons))
		# sort alphabetically in descending order
		desc_sorted = sort_persons_alphabetically(Marshal.load(persons), 'desc')
		{ gender_sorted: gender_sorted, dob_sorted: dob_sorted, desc_sorted: desc_sorted }
	end
end