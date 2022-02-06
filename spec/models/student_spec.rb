require 'app_helper'
require 'models/group_spec'

describe Student do
  subject(:student) { Student.new(name, surname, age, memory) }

  let(:name) { 'John' }
  let(:surname) { 'Dou' }
  let(:age) { rand(100) }
  let(:memory) { [] }

  it { expect(student.name).to eq name }
  it { expect(student.surname).to eq surname }
  it { expect(student.age).to eq age }
  it { expect(student.memory).to eq memory }


  describe '#full_name' do
    let(:kris) { Student.new('Kris', 'Albarn', 18, []) }
    let(:bob) { Student.new('Bob', 'Dilan', 19, []) }
    let(:alan_wake) { Student.new('Alan', 'Wake', 20, []) }
    let(:alan_rosbeef) { Student.new('Alan', 'Rosbeef', 20, []) }

    it 'returns full name' do
      expect(kris.full_name).to eq 'Kris Albarn'
      expect(bob.full_name).to eq 'Bob Dilan'
      expect(alan_wake.full_name).to eq 'Alan Wake'
      expect(alan_rosbeef.full_name).to eq 'Alan Rosbeef'
    end
  end

  let(:book1) { Book.new(SecureRandom.uuid, 'Math',    Faker::Lorem.paragraph) }
  let(:book2) { Book.new(SecureRandom.uuid, 'Physics', Faker::Lorem.paragraph) }
  let(:book3) { Book.new(SecureRandom.uuid, 'Biology', Faker::Lorem.paragraph) }
  let(:carl) { Student.new('Carl', 'Brooks', 18, []) }

  describe '#read_book' do
    it 'add book to memory' do
      carl.read_book(book1)
      expect(carl.memory.include? book1).to eq true
    end
  end

  describe '#forget_book' do
    before do
      carl.read_book(book1)
      carl.read_book(book2)
      carl.read_book(book3)
    end

    it "check if all books are attached" do
      expect(carl.memory).to contain_exactly(book1, book2, book3)
    end

    it "delete book" do
      carl.forget_book(book2.id)
      expect(carl.memory).to contain_exactly(book1, book3)
    end
  end

  describe '#examinate' do
    before do
      carl.read_book(book1)
      carl.read_book(book2)
    end

    it "returns book that student knows" do
      expect(carl.examinate(book2.text[0..10])).to eq book2
    end

    it "returns book that student doesn't know" do
      expect(carl.examinate(book3.text[0..10])).to eq nil
    end
  end
end
