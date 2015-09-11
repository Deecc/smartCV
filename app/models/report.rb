class Report < ActiveRecord::Base
  belongs_to :company
  belongs_to :user
  belongs_to :visit
  belongs_to :department



  def state
    done? ? 'done' : 'yet'
  end
end
