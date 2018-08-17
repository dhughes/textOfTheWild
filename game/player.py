from game.item.material import Edible

class Player:

	def __init__(self):
		self.health = 5
		self.maxHealth = 5
		self.inventory = []

	def takeDamage(self, damage):
		if self.health < damage:
			self.health = 0
		else:
			self.health -= damage

	def eat(self, food):
        if isinstance(food, Edible):
            self.health += food.hearts
        else:
            raise "sdffdsfdsafds"

	def take(self, item):
		self.inventory.append(item)

	def isDead(self):
		self.health == 0
