from enum import Enum

class Food(Enum):
	APPLE = (0.5, "A common fruit found on trees all around Hyrule. Eat if fresh, or cook it to increase its effect.")

	def __init__(self, health, description):
		self.health = health
		self.description = description
