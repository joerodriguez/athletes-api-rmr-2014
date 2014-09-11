class AthleteModel < ActiveRecord::Base
  self.table_name = :athletes

  validates_length_of :name, :minimum => 3
end
