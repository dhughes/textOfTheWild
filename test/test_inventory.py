
import unittest
from game.inventory import Inventory
from game.item.material import *

class TestInventory(unittest.TestCase):

	def test_inventoryItemsIsADict(self):
		inventory = Inventory()
		self.assertIsInstance(inventory.items, dict)

	# def test_inventoryItemsAreItems(self):
	# 	items = Inventory().items
	# 	for item in list(items.keys()):
	# 		self.assertIsInstance(item, Item)
