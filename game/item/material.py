from enum import Enum
import random
import pdb

class Item():
    def __init__(self, item_name, description, item_value):
        self.item_name = item_name
        self.description = description
        self.item_value = item_value

class Edible():
    def __init__(self, hearts):
        self.hearts = hearts

class Cookable():
    pass

class Mobile():
    pass

class Ingredient(Item, Edible, Cookable, Enum):
    ACORN = ("Acorn", "Often found on the ground near trees. Squirrels adore this nut, so you may have competition while foraging. Add one to a meal for a nutty seasoning.", 2, 0.5) # 10 second boost to recipe effects on first accorn
    APPLE = ("Apple", "A common fruit found on trees all around Hyrule. Eat if fresh, or cook it to increase its effect.", 3, 0.5)
    ARMORANTH = ("Armoranth", "This tough medicinal plant cannot be broken, but it can be cooked. Its durable yet flexible fibers raise your defense when cooked into a dish.", 5, None)
    BIG_HEARTY_RADISH = ("Big Hearty Radish", "This hearty radish has grown much larger than the average radish. It's rich in analeptic compounds that, when cooked into a dish, temporarily increase your maximum hearts.", 15, 4)

    def __init__(self, item_name, description, item_value, hearts):
        Item.__init__(self, item_name, description, item_value)
        Edible.__init__(self, hearts)

class Animal(Item, Edible, Cookable, Mobile, Enum):
    ARMORED_CARP = ("Armored Carp", "Calcium deposits in the scales of this ancient fish make them as hard as armor. Cooking it into a dish will fortify your bones, temporarily increasing your defense.", 10, 1)
    ARMORED_PORGY = ("Armored Porgy", "This porgy's body is covered in armor-hard scales. The compounds in its scales, when cooked into a dish, fortify your bones and temporarily boost your defense.", 10, 1)

    def __init__(self, item_name, description, item_value, hearts):
        Item.__init__(self, item_name, description, item_value)
        Edible.__init__(self, hearts)

class Insect(Item, Cookable, Mobile, Enum):
    BLADED_RHINO_BEETLE = ("Bladed Rhino Beetle", "This beetle's razor-sharp horns demand that you handle it with care. Boil the horns alongside monster parts to concoct an elixir that will raise your attack power.", 4)
    ENERGETIC_RHINO_BEETLE = ("Energetic Rhino Beetle", "This valuable beetle can live up to ten years. When cooked with monster parts, its impressive vitality translates into an elixir that will greatly restore your stamina.", 30)

    def __init__(self, item_name, description, item_value):
        Item.__init__(self, item_name, description, item_value)

class Mineral(Item, Enum):
    AMBER = ("Amber", "A fossilized resin with a caramelesque sheen to it. It's been valued as a component in decorations and crafting since ancient times.", 30)
    DIAMOND = ("Diamond", "The most precious gem one can find in Hyrule, its signature sparkle has charmed Hyruleans for generations. As such, it has sold for a very high price since ancient times.", 500)

    def __init__(self, item_name, description, item_value):
        Item.__init__(self, item_name, description, item_value)
