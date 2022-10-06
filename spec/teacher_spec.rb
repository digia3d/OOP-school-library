require 'spec_helper'
describe Teacher do
    context 'get specific splecialization' do
        it 'return teacher specialization' do
        new_ta= Teacher.new('Maths',21, 'Abraham',true)
        expect(new_ta.specialization).to eq 'Maths'
    end
    it 'return teacher specialization' do
        new_ta= Teacher.new('Javascript',45, 'Mark',true)
        expect(new_ta.specialization).to eq 'Javascript'
end
end
end
