class AddStartAndCompleteDates < ActiveRecord::Migration
  def change
    add_column :users, :planned_complete_date, :date
    add_column :users, :complete_date, :date
  end
end
