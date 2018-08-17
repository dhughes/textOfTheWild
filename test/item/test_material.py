import unittest
from game.item.material import Ingredient

class testIngredient(unittest.TestCase):

	def test_createApple(self):
		self.assertEqual(Ingredient.APPLE.hearts, 0.5)
