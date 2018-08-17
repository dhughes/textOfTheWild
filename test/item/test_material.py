import unittest
from game.item.material import *

class testIngredient(unittest.TestCase):

	def test_createApple(self):
		self.assertEqual(Ingredient.APPLE.hearts, 0.5)

	# def test_canListAllItems(self):
	# 	self.assertIsInstance(Item.listAllItems()[0], Item)
