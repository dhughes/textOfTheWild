require 'errors'

class Player
	attr_accessor :hearts, :health

	def initialize(hearts: 3, health: 3)
		@hearts = hearts
		@health = health
	end

	def take_damage(damage)
		if self.health < damage
			self.health = 0
			raise Errors::Dead
		end

		self.health = self.health - damage
	end

	def eat(edible)
		raise Errors::InedibleError.new("You can't eat #{edible}") unless edible.edible?

		added_health = self.health + edible.health
		added_health = added_health < self.hearts ? added_health : self.hearts
		self.health = added_health
	end

end
