class Save < ApplicationRecord
  belongs_to :users
  belongs_to :answers
end
