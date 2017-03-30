require 'rails_helper'

RSpec.describe Founder, :type => :model do
  it "is valid with valid attributes" do
    founder = Founder.new(first_name: 'OJ',
                          last_name: 'Simpson',
                          title: 'CEO',
                          company_id: 1)

    expect(founder).to be_valid
  end

  it "is not valid without all fields" do
    expect(Founder.new).to_not be_valid
  end

  it 'formats the first and last name with full_name' do
    founder = Founder.new(first_name: 'OJ',
                          last_name: 'Simpson',
                          title: 'CEO',
                          company_id: 1)

    expect(founder.full_name).to eq('OJ Simpson')
  end
end
