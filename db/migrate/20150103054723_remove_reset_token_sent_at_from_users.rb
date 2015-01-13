class RemoveResetTokenSentAtFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :reset_token_sent_at, :string
  end
end
