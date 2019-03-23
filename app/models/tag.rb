class Tag < ApplicationRecord
  has_many :answer_tags
  has_many :answers, through: :answer_tags
end
