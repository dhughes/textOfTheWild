
class Item

	def edible?
		self.class.included_modules.include? Edible
	end

end
