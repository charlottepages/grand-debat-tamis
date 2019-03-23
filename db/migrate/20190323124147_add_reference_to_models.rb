class AddReferenceToModels < ActiveRecord::Migration[5.2]
  def change
    add_reference :saves, :users, index: true
    add_reference :saves, :answers, index: true
    add_reference :answer_tags, :answers, index: true
    add_reference :answer_tags, :tags, index: true
    add_reference :answers, :questions, index: true
  end
end
