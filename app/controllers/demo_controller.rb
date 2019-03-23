class DemoController < ApplicationController
  def search
    Answer.reindex
  end

  def show
  end

  def list
  end

  def engage
  end
end
