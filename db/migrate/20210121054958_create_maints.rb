class CreateMaints < ActiveRecord::Migration[6.1]
  def change
    create_table :maints do |t|
      t.string :game
      t.text :content
      t.string :name
      t.date :date
      t.timestamps
    end
  end
end
