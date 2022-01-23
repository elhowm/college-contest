require 'app_helper'

describe Group do
  subject(:group) { Group.new('My group', capacity) }

  let(:capacity) { rand(5..10) }

  it { expect(group.name).to eq 'My group' }
  it { expect(group.students.count).to eq capacity }
  it { expect(group.students.first).to be_a(Student) }

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

  describe '#search' do
    let(:kris) { Student.new('Kris', 'Albarn', 18) }
    let(:bob) { Student.new('Bob', 'Dilan', 19) }
    let(:alan_wake) { Student.new('Alan', 'Wake', 20) }
    let(:alan_rosbeef) { Student.new('Alan', 'Rosbeef', 20) }

    before { group.students = [kris, alan_wake, bob, alan_rosbeef] }

    context 'when search by name or surname' do
      it 'when search matches by name' do
        expect(group.search('Ala')).to eq [alan_rosbeef, alan_wake]
      end

      it 'when search matches by name & surname' do
        expect(group.search('Al')).to eq [alan_rosbeef, alan_wake, kris]
      end
    end

    context 'when search by full name' do
      it 'returns list of matched students' do
        expect(group.search('Alan W')).to eq [alan_wake]
      end
    end
  end

  describe '#find' do
    let(:kris) { Student.new('Kris', 'Albarn', 18) }
    let(:bob) { Student.new('Bob', 'Dilan', 19) }
    let(:alan_wake) { Student.new('Alan', 'Wake', 20) }
    let(:alan_rosbeef) { Student.new('Alan', 'Rosbeef', 20) }

    before { group.students = [kris, alan_wake, bob, alan_rosbeef] }

    context 'when find by name or surname' do
      it 'when search matches by name' do
        expect(group.search('Ala')).to eq alan_rosbeef
      end

      it 'when find matches by name & surname' do
        expect(group.search('Al')).to eq alan_rosbeef
      end
    end

    context 'when find by full name' do
      it 'returns list of matched students' do
        expect(group.search('Alan W')).to eq alan_wake
      end
    end
  end
end
