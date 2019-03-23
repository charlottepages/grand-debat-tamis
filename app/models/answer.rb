class Answer < ApplicationRecord
  include AlgoliaSearch

  has_many :answer_tags
  has_many :tags, through: :answer_tags
  belongs_to :question

  algoliasearch do
    add_attribute :question_text
    searchableAttributes ['content', 'question_text']
    customRanking ['desc(flag_count)']
  end

  def question_text
    self.question.title
  end
end
