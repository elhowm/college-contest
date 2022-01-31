require 'app_helper'
require 'models/group_spec'

describe Student do
  subject(:student) { Student.new(name, surname, age) }

  let(:name) { 'John' }
  let(:surname) { 'Dou' }
  let(:age) { rand(100) }

  it { expect(student.name).to eq name }
  it { expect(student.surname).to eq surname }
  it { expect(student.age).to eq age }

  describe '#full_name' do
    let(:kris) { Student.new('Kris', 'Albarn', 18) }
    let(:bob) { Student.new('Bob', 'Dilan', 19) }
    let(:alan_wake) { Student.new('Alan', 'Wake', 20) }
    let(:alan_rosbeef) { Student.new('Alan', 'Rosbeef', 20) }

    it 'returns full name' do
      expect(kris.full_name).to eq 'Kris Albarn'
      expect(bob.full_name).to eq 'Bob Dilan'
      expect(alan_wake.full_name).to eq 'Alan Wake'
      expect(alan_rosbeef.full_name).to eq 'Alan Rosbeef'
    end
  end
end
