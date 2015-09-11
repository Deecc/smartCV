class Visit < ActiveRecord::Base
  belongs_to :department
  belongs_to :user
  belongs_to :company

  attr_reader :data

  def self.mesAtual(data)
  	@visits = []
  	@visits.each do |v|
  		#if ((v.data.month < data.month) && (v.data.year == data.year))
  			@visits << v
  		#end
  	end
  	@visits
  end

  def state
    done? ? 'done' : 'yet'
  end
end
