require 'app_helper'

describe Student do
  subject(:student) { Student.new(name, surname, age) }

  let(:name) { 'John' }
  let(:surname) { 'Dou' }
  let(:age) { rand(100) }

  it { expect(student.name).to eq name }
  it { expect(student.surname).to eq surname }
  it { expect(student.age).to eq age }
end
