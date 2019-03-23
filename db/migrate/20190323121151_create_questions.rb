class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text      :title
      t.string    :theme
      t.string    :grand_debat_id

      t.timestamps
    end
  end
end
