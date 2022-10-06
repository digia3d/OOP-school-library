require_relative '../person'
require 'json'
# rubocop:disable Metrics
module WritePeople
  def write_people(people)
    json_people = []
    people.each do |person|
      if person.instance_of? Student
        json_people <<
          {
            json_class: 'Student',
            id: person.id,
            name: person.name,
            age: person.age,
            parent_permission: person.parent_permission
          }
      elsif person.instance_of? Teacher
        json_people << {
          json_class: 'Teacher',
          id: person.id,
          name: person.name,
          age: person.age,
          specialization: person.specialization
        }
      end
    end
    File.write('./people.json', JSON.generate(json_people))
  end
  # rubocop:enable Metrics
end
