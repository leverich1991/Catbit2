class Datum < ActiveRecord::Base
  belongs_to :user
  validates :steps, :steps_goal, :distance, :distance_goal, :calories, :calories_goal, :date, :presence =>true

  #def self.create(data_hash)
    #datum = Datum.create :steps => data_hash['summary']['steps']
  #end
end
