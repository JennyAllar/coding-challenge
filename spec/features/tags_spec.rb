require "rails_helper"
require 'capybara/rspec'

feature 'Tag features' do
  let!(:company) { Company.create!(name: 'Tesla Motors', city: 'Palo Alto', state: 'CA', date_founded: '2003-08-31', description: 'gr8 cars') }

  scenario 'user can add a tag to a company' do
    visit companies_path
    click_link 'Tesla Motors'

    fill_in :company_tag_list, with: 'automotive, fancy, innovative'
    click_on 'Add Tags'

    expect(page).to have_link('automotive')
    expect(page).to have_link('fancy')
    expect(page).to have_link('innovative')
  end

  scenario 'user can view tags' do
    visit companies_path
    click_link 'Tesla Motors'

    fill_in :company_tag_list, with: 'gr8'
    click_on 'Add Tags'

    click_on 'gr8'

    expect(page).to have_link('Tesla Motors')
  end

  scenario 'user can update tags on company' do
    visit companies_path
    click_link 'Tesla Motors'

    fill_in :company_tag_list, with: 'gr8'
    click_on 'Add Tags'

    expect(page).to_not have_link('sleek')

    fill_in :company_tag_list, with: 'gr8, sleek'
    click_on 'Add Tags'

    expect(page).to have_link('gr8')
    expect(page).to have_link('sleek')
  end
end
