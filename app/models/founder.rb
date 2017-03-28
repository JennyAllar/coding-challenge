class Founder < ActiveRecord::Base
  belongs_to :company
  validates_presence_of :first_name, :last_name, :title, :company_id

  def full_name
    "#{first_name} #{last_name}"
  end
end
