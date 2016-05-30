class AddUserIdToPullRequest < ActiveRecord::Migration
  def change
    add_column :pullrequests, :user_id, :integer, null: true
    add_foreign_key :pullrequests, :users

  end
end
