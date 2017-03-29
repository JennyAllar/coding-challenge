class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.all
  end

  def show
    @tag =  ActsAsTaggableOn::Tag.find_by(name: params[:id])
    @companies = Company.tagged_with(@tag.name)
  end
end
