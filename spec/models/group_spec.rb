require 'app_helper'

describe Group do
  subject(:group) { Group.new(capacity) }

  let(:capacity) { rand(5..10) }

  it { expect(group.students.count).to eq capacity }
  it { expect(group.stidents.first).to be_a(Student) }
end
