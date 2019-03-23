class CreateAnswerTags < ActiveRecord::Migration[5.2]
  def change
    create_table :answer_tags do |t|
      t.timestamps
    end
  end
end
