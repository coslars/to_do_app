class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :description
      t.integer :user_id
      t.date :planned_complete_date
      t.date :complete_date

      t.timestamps
    end
    add_index :todos, [:user_id]
  end
end
