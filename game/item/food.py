from enum import Enum
import random
import pdb

class Food(Enum):
	APPLE = (0.5, "A common fruit found on trees all around Hyrule. Eat if fresh, or cook it to increase its effect.")
	MIGHTY_BANNNA = (1, "A common fruit found on trees all around Hyrule. Eat if fresh, or cook it to increase its effect.")

	def __init__(self, health, description):
		self.health = health
		self.description = description

	@classmethod
	def random_food(self):
		pdb.set_trace()
		print(Food.__members__)
		return random.choice([
			Food.APPLE,
			Food.MIGHTY_BANNNA
		])
