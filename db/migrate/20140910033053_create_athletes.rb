class CreateAthletes < ActiveRecord::Migration
  def change
    create_table :athletes do |t|
      t.text :name
      t.text :avatar
      t.integer :weight

      t.timestamps
    end
  end
end
