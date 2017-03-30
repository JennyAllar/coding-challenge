require "rails_helper"
require 'capybara/rspec'

describe 'Company features' do
  let!(:company) { Company.create!(name: 'Tesla Motors', city: 'Palo Alto', state: 'CA', date_founded: '2003-08-31', description: 'gr8 cars') }

  scenario 'user can create a company' do
    visit "/"
    click_on 'Create New Company'

    fill_in :company_name, with: 'CamelBak'
    fill_in :company_city, with: 'Petaluma'
    select 'California', :from => :company_state
    page.find('#date-founded').set("01/01/1988")
    fill_in :company_description, with: 'Water bottles'

    click_on 'Save'

    expect(page).to have_content('CamelBak | Petaluma, CA')
    expect(page).to have_content('Company added')
  end

  scenario 'user can view a company' do
    visit companies_path
    click_link 'Tesla Motors'

    expect(page).to have_content('August 31st, 2003')
    expect(page).to have_content('Founders')
    expect(page).to have_content('Categories')
    expect(page).to have_content('Back to Companies')
  end

  scenario 'user can edit a company' do
    visit companies_path
    click_on 'Tesla Motors'
    click_on 'Edit Company'

    fill_in :company_name, with: 'Nalgene'
    fill_in :company_city, with: 'Not Palo Alto'
    select 'Colorado', :from => :company_state
    page.find('#date-founded').set("01/01/1980")
    fill_in :company_description, with: 'BPA free Water bottles'
    click_on 'Save'

    expect(page).to_not have_content('CamelBak')
    expect(page).to have_content('January 1st, 1980')
    expect(page).to have_content('Nalgene updated')
  end

  scenario 'user can delete a company' do
    visit companies_path
    click_on 'Tesla Motors'

    click_on 'Delete Company'

    expect(page).to have_content('Company deleted')
    expect(page).to have_no_content('Tesla Motors')
  end
end
