module Visitable
	# interface for accepting visitors 
	
  def accept(visitor)
    visitor.visit(self)
  end
end
