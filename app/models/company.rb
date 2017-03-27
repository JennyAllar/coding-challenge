class Company < ActiveRecord::Base
  has_many :founders
  validates_presence_of :name, :city, :state, :description

  def location
    "#{city}, #{state}"
  end

  def pretty_date
    new_date = Date.strptime(date_founded, "%m/%d/%Y").to_date.to_formatted_s :long_ordinal
  end
end
