class AnswerTag < ApplicationRecord
  belongs_to :answer
  belongs_to :tag
end
