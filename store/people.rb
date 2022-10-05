require_relative '../person.rb'

module WritePeople
  def write_people(people)
    json_people = []
    people.each do |person|
      new_person = nil
        if person.instance_of? Student
          new_person = 
          {
          json_class: 'Student',
          id: person.id,
          name: person.name,
          age: person.age,
          parent_permission: person.parent_permission,
        }
      elseif person.instance_of? Teacher
        new_person = {
          json_class: 'Teacher',
          id: person.id,
          name: person.name,
          age: person.age,
          specialization: person.specialization
        }
        end
        json_people << new_person
      File.write('./json-data/people.json', JSON.generate(json_people))
    end
  end
end