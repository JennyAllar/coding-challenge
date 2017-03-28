class FoundersController < ApplicationController
  def new
    @company = Company.find(params[:company_id])
    @founder = @company.founders.build
  end

  def create
    @company = Company.find(params[:company_id])
    founder_params = params[:founder]
    @founder = @company.founders.new(
      first_name: founder_params[:first_name],
      last_name: founder_params[:last_name],
      title: founder_params[:title],
      company_id: params[:company_id])

    if @founder.save
      redirect_to company_path(@company)
    end
  end

  private

  def founder_params
    params.require(:founder).permit(:company_id).permit(:first_name, :last_name, :title)
  end
end
