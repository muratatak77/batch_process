require 'rails_helper'

RSpec.describe Campaign, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  # 
  context 'valdiation factoriel' do
  	
  	it "factoriel set 0, get 1" do
  		camp = Campaign.factorial(0)
  		expect(camp).to eq(1)
  	end

  	it "factoriel set 1, get 1" do
  		camp = Campaign.factorial(1)
  		expect(camp).to eq(1)
  	end

	it "factoriel set 4, get 24" do
  		camp = Campaign.factorial(4)
  		expect(camp).to eq(24)
  	end

  end

end
