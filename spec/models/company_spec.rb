require 'rails_helper'

RSpec.describe Company, :type => :model do
  it "is valid with valid attributes" do
    company = Company.new(name: 'The North Face',
                          city: 'Portland',
                          state: 'OR',
                          date_founded: '1997-01-01',
                          description: 'go outdoors')
    expect(company).to be_valid
  end

  it "is not valid without all fields" do
    expect(Company.new).to_not be_valid
  end

  it "is not valid without a name" do
    company = Company.new(name: 'The North Face',
                          city: nil,
                          state: 'OR',
                          date_founded: '1997-01-01',
                          description: 'go outdoors')
    expect(company).to_not be_valid
  end

  it "is not valid without a city" do
    company = Company.new(name: 'The North Face',
                          city: nil,
                          state: 'OR',
                          date_founded: '1997-01-01',
                          description: 'go outdoors')
    expect(company).to_not be_valid
  end

  it "is not valid without a state" do
    company = Company.new(name: 'The North Face',
                          city: 'Portland',
                          state: nil,
                          date_founded: '1997-01-01',
                          description: 'go outdoors')
    expect(company).to_not be_valid
  end

  it "is not valid without a date_founded" do
    company = Company.new(name: 'The North Face',
                          city: 'Portland',
                          state: 'OR',
                          date_founded: nil,
                          description: 'go outdoors')
    expect(company).to_not be_valid
  end

  it "is not valid without a description" do
    company = Company.new(name: 'The North Face',
                          city: nil,
                          state: 'OR',
                          date_founded: '1997-01-01',
                          description: nil)
    expect(company).to_not be_valid
  end

  it 'formats the location' do
    company = Company.new(name: 'The North Face',
                          city: 'Portland',
                          state: 'OR',
                          date_founded: '1997-01-01',
                          description: 'go outdoors')
    expect(company.location).to eq('Portland, OR')
  end

  it 'formats the date in a pretty way' do
    company = Company.new(name: 'The North Face',
                          city: 'Portland',
                          state: 'OR',
                          date_founded: '1997-01-01',
                          description: 'go outdoors')
    expect(company.pretty_date).to eq('January 1st, 1997')
  end

  it 'formats the tags for updating' do
    company = Company.new(name: 'The North Face',
                          city: 'Portland',
                          state: 'OR',
                          date_founded: '1997-01-01',
                          description: 'go outdoors',
                          tag_list: ['clothing', 'leisure'])

    expect(company.list_of_tags).to eq('clothing, leisure')
  end
end
