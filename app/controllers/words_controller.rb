class WordsController < ApplicationController
  def index
    @words = Word.all
  end
  
  def create
    word = Word.new(word_params)
    if word.valid? && word.save
      render 'success'
    else
      render 'error'
    end
  end
  
  def show_pass
    @arr_pass = Word.arr_pass
    if (@arr_pass.size < 3)
      render 'error_list'
    else
      render 'success_list'
    end
  end
  
  private
  
  def word_params
    params.require(:word).permit(:title)
  end
end
