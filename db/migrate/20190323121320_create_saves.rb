class CreateSaves < ActiveRecord::Migration[5.2]
  def change
    create_table :saves do |t|
      t.text :comment

      t.timestamps
    end
  end
end
