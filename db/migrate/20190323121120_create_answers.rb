class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.text      :content
      t.integer   :zipcode
      t.string    :source
      t.string    :contributor_type
      t.datetime  :published_at
      t.integer   :flag_count

      t.timestamps
    end
  end
end
