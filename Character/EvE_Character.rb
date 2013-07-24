class EvE_Character
	attr_accessor :skills
	def initialize(name)
		@name = name
		@skills = {}
	end
end