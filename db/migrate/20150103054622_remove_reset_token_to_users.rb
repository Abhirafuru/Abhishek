class RemoveResetTokenToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :reset_token, :string
  end
end
