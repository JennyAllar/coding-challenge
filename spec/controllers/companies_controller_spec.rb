require 'rails_helper'

RSpec.describe CompaniesController do
  describe "GET #index" do
    let(:company)  { FactoryGirl.create(:company) }

    it "populates a list of companies" do
      get :index
      assigns(:companies).should eq([company])
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET #show" do
    let(:company)  { FactoryGirl.create(:company) }

    it "shows the company details" do
      get :show, id: company
      assigns(:company).should eq(company)
    end

    it "renders the #show view" do
      get :show, id: company
      response.should render_template :show
    end
  end

  describe "GET #edit" do
    let(:company)  { FactoryGirl.create(:company) }

    it "renders the #edit view" do
      get :edit, id: company
      response.should render_template :edit
    end
  end
end
