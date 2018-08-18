# frozen_string_literal: true

class Item
  def edible?
    self.class.included_modules.include? Edible
  end
end
