require 'app_helper'
require 'securerandom'
require 'faker'

describe Book do
  subject(:book) { Book.new(id, subject, text) }

  let(:id) { SecureRandom.uuid }
  let(:subject) { 'Math' }
  let(:text) { Faker::Lorem.paragraph }

  it { expect(book.id).to eq id }
  it { expect(book.subject).to eq subject }
  it { expect(book.text).to eq text }
end
