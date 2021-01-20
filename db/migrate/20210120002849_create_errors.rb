class CreateErrors < ActiveRecord::Migration[6.1]
  def change
    create_table :errors do |t|
      t.string :game
      t.text :problem
      t.text :approach
      t.string :name
      t.date :date

      t.timestamps
    end
  end
end
