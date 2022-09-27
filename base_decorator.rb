require_relative './nameable'

class Decorator < Nameable
  attr_accessor :nameable

  # assigning a nameable object from instance variable parameters.
  def initialize(nameable)
    @nameable = nameable
    super()
  end

  # Implementing the correct_name method
  def correct_name
    @nameable.correct_name
  end
end