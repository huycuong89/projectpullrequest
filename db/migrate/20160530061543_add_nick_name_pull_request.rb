class AddNickNamePullRequest < ActiveRecord::Migration
  def change
    add_column :pullrequests, :nickname, :string
  end
end
