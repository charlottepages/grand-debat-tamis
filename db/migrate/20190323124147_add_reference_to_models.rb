class AddReferenceToModels < ActiveRecord::Migration[5.2]
  def change
    add_reference :saves, :user, index: true
    add_reference :saves, :answer, index: true
    add_reference :answer_tags, :answer, index: true
    add_reference :answer_tags, :tag, index: true
    add_reference :answers, :question, index: true
  end
end
