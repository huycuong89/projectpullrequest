class AddNote < ActiveRecord::Migration
  def change
    add_column :pullrequests, :note, :string, null: true
  end
end
