require_relative '../visitor'

class PipeStandardiserVisitor < Visitor
	# visitor which performs data standardisation before further processing

	# @param [TextFile] takes TextFile representation 
	# @return [Array] Standardised data
	def visit(subject)
		subject.text.split("\n").map do |row|
			# split each row by pipes
	    arr = row.split('|').map(&:strip)
	    # delete middle name character
	    arr.delete_at(2)
	    # switch places of DOB and favorite color
	    arr[3], arr[-1] = arr[-1], arr[3]
	    # convert dashes to slashes in DOB 
	    arr[3] = arr[3].split('-').join('/')
	    # parse date
	    arr[3] = Date.strptime(arr[3], "%m/%d/%Y")
	    # convert M/F to Male/Female
	    arr[2] =	if arr[2].size == 1 && arr[2] == "M"
								 "Male"
								else 
								 	"Female"
								end
	    arr
		end
  end
end