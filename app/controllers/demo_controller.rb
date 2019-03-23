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
    Answer.reindex
  end
end
