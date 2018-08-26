# frozen_string_literal: true

module Errors
  class InedibleError < StandardError; end
  class DeadError < StandardError; end
  class CantHoldMoreError < StandardError; end
  class NotInInventoryError < StandardError; end
end
