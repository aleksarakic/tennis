require_relative '../visitor'

class CommaStandardiserVisitor < Visitor
	# visitor which performs data standardisation before further processing

	# @param [TextFile] takes TextFile representation 
	# @return [Array] Standardised data
	def visit(subject)
		subject.text.split("\n").map do |row|
			# split by comma
	    arr = row.split(',').map(&:strip)
	    # parse date
	    arr[4] = Date.strptime(arr[4], "%m/%d/%Y")
	    # switch places of DOB and favorite color
	    arr[3], arr[-1] = arr[-1], arr[3]
	    arr
		end
  end
end