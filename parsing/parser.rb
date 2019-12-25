require_relative 'visitable'

class Parser
	include Visitable

	def initialize(file)
		@file = file
	end

	# @param [*StandardiserVisitor] takes visitors as arguments
	def accept(visitor)
    @file.accept(visitor)
  end
end