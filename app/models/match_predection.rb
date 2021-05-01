class MatchPredection < ApplicationRecord
  before_save :set_date
  validates :name, presence: true
  def set_date
    today = Time.now.in_time_zone("Chennai").strftime("%-d-%b-%y")
    match_start_date = "9-Apr-21"
    self.date = Date.parse(today) >= Date.parse(match_start_date) ? today : match_start_date
  end 
end
