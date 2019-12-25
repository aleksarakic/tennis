require './helpers/stage_iv_helpers.rb'

class StageIV
	# writes to file
	
	extend StageIVHelpers
	
	def self.call(hash_sorted)
		# open file for writing
		File.open('output_file.txt', 'w') do |file|
			file.write("gender then lastname ascending\n")
			file.write("--------------------------\n")
			file.write(formatter(hash_sorted[:gender_sorted]))
			file.write("\n--------------------------\n")

			file.write("\ndateofbirth ascending\n")
			file.write("--------------------------\n")
			file.write(formatter(hash_sorted[:dob_sorted]))
			file.write("\n--------------------------\n")

			file.write("\nlastname descending\n")
			file.write("--------------------------\n")
			file.write(formatter(hash_sorted[:desc_sorted]))
			file.write("\n--------------------------")
		end
	end
end
