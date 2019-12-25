require_relative 'visitable'

class TextFile 
	include Visitable

  attr_reader :text

  def initialize(text)
    @text = text
  end
end