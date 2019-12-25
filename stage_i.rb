require './parsing/visitors/pipe_standardiser_visitor.rb'
require './parsing/visitors/space_standardiser_visitor.rb'
require './parsing/visitors/comma_standardiser_visitor.rb'
require './parsing/text_file.rb'
require './parsing/parser.rb'

class StageI
	# parses files

	# @return [Array] Array of person data 
	def self.call
		# open file
		pipe_file = File.open('./input_files/pipe.txt')
		# read from file 
		file1 = TextFile.new(pipe_file.read)
		# close file
		pipe_file.close

		space_file = File.open('./input_files/space.txt')
		file2 = TextFile.new(space_file.read)
		space_file.close

		comma_file = File.open('./input_files/comma.txt')
		file3 = TextFile.new(comma_file.read)
		comma_file.close

		# create Parser
		parser1 = Parser.new(file1)
		parser2 = Parser.new(file2)
		parser3 = Parser.new(file3)

		parsed = [] 
		parsed << parser1.accept(PipeStandardiserVisitor.new)
		parsed << parser2.accept(SpaceStandardiserVisitor.new)
		parsed << parser3.accept(CommaStandardiserVisitor.new)
		parsed.flatten(1)
	end
end