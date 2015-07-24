class Report < ActiveRecord::Base
  belongs_to :empresa
  belongs_to :user
  belongs_to :visit
  belongs_to :department
end
