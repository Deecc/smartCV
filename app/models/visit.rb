class Visit < ActiveRecord::Base
  belongs_to :departament
  belongs_to :user
  belongs_to :empresa
end
