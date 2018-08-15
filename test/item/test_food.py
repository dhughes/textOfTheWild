import unittest
from game.item.food import Food

class testFood(unittest.TestCase):

	def test_createApple(self):
		self.assertEqual(Food.APPLE.health, 0.5)

	def test_canGetRandomFood(self):
		print(Food.random_food().health)
