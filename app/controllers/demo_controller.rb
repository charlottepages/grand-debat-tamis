class DemoController < ApplicationController
  def search
  end

  def show
  end

  def list
  end

  def engage
  end

  def reindex
    Answer.where("question_id IS NOT NULL").reindex
  end
end
