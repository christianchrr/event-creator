class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      
      t.string :description
      t.belongs_to :user
      t.belongs_to :location
      t.integer :month
      t.integer :day
      t.integer :year

      t.timestamps null: false
    end
  end
end
