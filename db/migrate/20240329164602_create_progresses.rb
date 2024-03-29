class CreateProgresses < ActiveRecord::Migration[7.0]
  def change
    create_table :progresses do |t|
      t.integer :user_id
      t.integer :book_id
      t.integer :location
      t.integer :progress_percentage

      t.timestamps
    end
  end
end
