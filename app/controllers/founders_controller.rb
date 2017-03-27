class FoundersController < ApplicationController
  def create
    @company = Company.find(current_company)
    @founder = @company.founder.create(company_params)
    respond_to do |format|
      if @founder.save
        format.html { redirect_to action: :index, notice: 'Founder was successfully created.' }
        format.json { render :show, status: :created, location: @founder }
      else
        format.html { render :new }
        format.json { render json: @founder.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @founder = Founder.new
  end
end
