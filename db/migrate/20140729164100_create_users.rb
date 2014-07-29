class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :f_name
      t.string :l_name
      t.string :email
      t.string :password_digest
      t.string :remember_token
      t.boolean :admin

      t.timestamps
    end
  end
end
