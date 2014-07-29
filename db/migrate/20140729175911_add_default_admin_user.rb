class AddDefaultAdminUser < ActiveRecord::Migration

  @email = "admin@email.com"
  @password = "Manager1"

  def self.up
    user = User.create!( f_name: "Admin", l_name: "User", email: @email, admin: true, password: @password, password_confirmation: @password )
  end

  def self.down
    user = User.find_by_email( @email )
    user.destroy
  end
end