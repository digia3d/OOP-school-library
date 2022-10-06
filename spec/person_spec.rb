require 'spec_helper'
describe Person do
  context 'provide corrects params' do
    it 'return name of person' do
      my_name = Person.new(21, 'Kinyua', true)
      expect(my_name.name).to eq 'Kinyua'
    end
  end
end
