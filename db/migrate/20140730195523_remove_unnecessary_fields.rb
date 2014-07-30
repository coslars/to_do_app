class RemoveUnnecessaryFields < ActiveRecord::Migration
  def change
    remove_column(:users, :planned_complete_date)
    remove_column(:users, :complete_date)
  end
end
