require 'app_helper'

describe Wallet do
  let(:wallet) { Wallet.new(300) }

  describe '#top_up' do
    let(:amount) { 50 }
    let(:expected_balance) { 350 }

    it "replenishes wallet balance on 50$" do
      wallet.top_up(amount)
      expect(wallet.balance).to eq expected_balance
    end
  end

  describe '#withdraw' do
    let(:amount) { 100 }
    let(:expected_balance) { 200 }

    it "removes from the balance of the wallet 100$" do
      wallet.withdraw(amount)
      expect(wallet.balance).to eq expected_balance
    end
  end
end
