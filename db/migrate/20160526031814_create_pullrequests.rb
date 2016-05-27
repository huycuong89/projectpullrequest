class CreatePullrequests < ActiveRecord::Migration
  def change
    create_table :pullrequests do |t|
      t.string :username
      t.string :ipserver
      t.string :linkpullrequest

      t.timestamps null: false
    end
  end
end
