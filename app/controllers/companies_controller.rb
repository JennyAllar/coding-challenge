class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    Company.create(company_params)
    redirect_to Company
  end

  def show
    @company = Company.find(params[:id])
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    @company.update_attributes(company_params)
    redirect_to companies_path
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    redirect_to companies_path
  end

  def states
    CS.states(:us)
  end

  private

  def company_params
    params.require(:company).permit(:name, :city, :state, :description, :date_founded)
  end
end
