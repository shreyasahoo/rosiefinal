class AddUserIdToJournals < ActiveRecord::Migration[5.1]
  def change
    add_column :journals, :user_id, :integer
  end
end
