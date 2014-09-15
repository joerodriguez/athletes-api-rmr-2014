class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.datetime :started_at
      t.datetime :finished_at
      t.integer :elevation_gain
      t.integer :distance
      t.belongs_to :athlete
    end
  end
end
