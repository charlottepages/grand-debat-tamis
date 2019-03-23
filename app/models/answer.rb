class Answer < ApplicationRecord
  include AlgoliaSearch

  has_many :answer_tags
  has_many :tags, through: :answer_tags
  belongs_to :question

  algoliasearch do
    add_attribute :question_text, :question_theme
    searchableAttributes ['content', 'question_text', 'zipcode']
    customRanking ['desc(flag_count)']
  end

  def question_text
    self.question.title
  end

  def question_theme
    self.question.theme
  end
end
