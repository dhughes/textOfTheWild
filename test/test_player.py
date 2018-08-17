import unittest
from game.player import Player
from game.player import InedibleException
from game.item.material import Ingredient
from game.item.material import Insect

class TestPlayer(unittest.TestCase):

	def test_playerHasHealth(self):
		self.assertEqual(Player().health, 5)

	def test_playerHasMaxHealth(self):
		self.assertEqual(Player().maxHealth, 5)

	def test_takeDamange(self):
		player = Player()
		player.takeDamage(3)
		self.assertEqual(player.health, 2)

	def test_takeTooMuchDamange(self):
		player = Player()
		player.takeDamage(10)
		self.assertEqual(player.health, 0)

	def test_eatToGainHealth(self):
		player = Player()
		player.takeDamage(4)
		player.eat(Ingredient.APPLE)
		self.assertEqual(player.health, 1.5)

	def test_canOnlyEatEdible(self):
		player = Player()
		player.takeDamage(4)
		with self.assertRaises(InedibleException):
			player.eat(Insect.BLADED_RHINO_BEETLE)

	def test_playerCanTakeItem(self):
		player = Player()
		player.take(Ingredient.APPLE)
		self.assertIn(Ingredient.APPLE, player.inventory)

	def test_playerIsDeadWhenHealthIsZero(self):
		player = Player()
		player.takeDamage(10)
		self.assertTrue(player.isDead)
