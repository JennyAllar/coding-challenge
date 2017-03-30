class Company < ActiveRecord::Base
  has_many :founders
  has_many :categories
  has_many :tags
  validates_presence_of :name, :city, :state, :date_founded, :description
  mount_uploader :logo, LogoUploader
  acts_as_taggable


  def location
    "#{city}, #{state}"
  end

  def pretty_date
    date_founded.to_date.to_formatted_s :long_ordinal
  end

  def list_of_tags
    string = ""
    tag_list.each_with_index do |tag, index|
      index == 0 ? string += tag : string += (", " + tag)
    end
    string
  end
end
