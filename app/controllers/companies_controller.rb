class CompaniesController < ApplicationController
  def index
    @companies = Company.order(id: :asc)
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash[:success] = "Company added"
      redirect_to Company
    end
  end

  def show
    @company = Company.find(params[:id])
    @founders = @company.founders
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update_attributes(company_params)
      flash[:notice] = "#{@company.name} updated"
      redirect_to company_path(@company)
    end
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    if @company.destroy
      flash[:notice] = "Company deleted"
      redirect_to companies_path
    end
  end

  def states
    CS.states(:us)
  end

  private

  def company_params
    params.require(:company).permit(:name, :city, :state, :description, :date_founded, :tag_list)
  end
end
