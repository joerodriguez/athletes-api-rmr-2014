class ActivityModel < ActiveRecord::Base
  self.table_name = :activities

  belongs_to :athlete, dependent: :destroy, class_name: 'AthleteModel'

  validates_presence_of :athlete
end
