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
      flash[:success] = "Founder added"
      redirect_to company_path(@company)
    end
  end

  def destroy
    @company = Company.find(params[:company_id])
    @founder = Founder.find(params[:id])
    if @founder.destroy
      flash[:notice] = "Founder deleted"
      redirect_to company_path(@company)
    end
  end
end
