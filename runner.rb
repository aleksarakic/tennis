require_relative 'stage_i'
require_relative 'stage_ii'
require_relative 'stage_iii'
require_relative 'stage_iv'

class Runner
	# code runner

	def self.call
		# parse files
		parsed_data = StageI.call

		# create persons 
		array_of_persons = StageII.call(parsed_data)

		# sort 
		sorted = StageIII.call(array_of_persons)

		# write to file
		StageIV.call(sorted)

		puts "Output file path: #{`echo $(pwd)/output_file.txt`}"
	end
end

Runner.call