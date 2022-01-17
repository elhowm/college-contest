require 'app_helper'

describe Group do
  subject(:group) { Group.new('My group', capacity) }

  let(:capacity) { rand(5..10) }

  it { expect(group.name).to eq 'My group' }
  it { expect(group.students.count).to eq capacity }
  it { expect(group.stidents.first).to be_a(Student) }

  describe '#info' do
    let(:capacity) { 3 }

    before do
      group.students[0].name = 'Kris'
      group.students[1].name = 'Bob'
      group.students[2].name = 'Alan'
    end

    it 'returns group name and students list' do
      expect(group.info).to eq <<-TEXT
      Group name: "My group"
      
      Students:
      - Alan
      - Bob
      - Kris
      TEXT
    end
  end
end
