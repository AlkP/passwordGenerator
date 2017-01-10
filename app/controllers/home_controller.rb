class HomeController < ApplicationController
  def index
    @word = Word.new
  end
end
