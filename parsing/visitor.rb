class Visitor
	# base class for visitors
	
  def visit(subject)
    raise NotImpelementedError.new
  end
end