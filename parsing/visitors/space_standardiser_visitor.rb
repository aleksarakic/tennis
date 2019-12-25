require_relative '../visitor'

class SpaceStandardiserVisitor < Visitor
	# visitor which performs data standardisation before further processing
	
	# @param [TextFile] takes TextFile representation 
	# @return [Array] Standardised data
	def visit(subject)
		subject.text.split("\n").map do |row|
			# split by pipes
	    arr = row.split(' ')
	    # delete middle name character
	    arr.delete_at(2)
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