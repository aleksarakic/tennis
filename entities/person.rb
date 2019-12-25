module Entities
	Person = Struct.new(:last_name, :first_name, :gender, :dob, :favorite_color, keyword_init: true)
end