class CreateJournals < ActiveRecord::Migration[5.1]
  def change
    create_table :journals do |t|
      t.string :title
      t.date :date
      t.text :are_good
      t.text :are_bad
      t.text :anything_else

      t.timestamps
    end
  end
end
