class MatchPredection < ApplicationRecord
  before_save :set_date
  validates :name, presence: true
  def set_date
    self.date = Time.now.utc.strftime("%d-%b-%y")
  end 
end
