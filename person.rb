require_relative './nameable'

class Person
  attr_accessor :age, :name, :rental
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..10_000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    super()
  end

  def of_age?
    @age >= 18
  end

  private :of_age?

  def method_name?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end
end
