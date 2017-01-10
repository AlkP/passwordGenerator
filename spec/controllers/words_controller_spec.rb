require 'rails_helper'

RSpec.describe WordsController, type: :controller do
  let(:word1) { FactoryGirl.create(:word1) }
  let(:word2) { FactoryGirl.create(:word2) }
  let(:wrong_word) { FactoryGirl.create(:wrong_word) }
  
  describe 'GET #index' do
    before {get :index }
    
    it '#index return page' do
      expect(response).to render_template :index
    end
    
    it '#index return array of all word' do
      expect(assign(:words)).to match_array([word1])
    end
  end
  
  describe 'POST #create' do
    it 'return error on short word' do
      post :create, word: wrong_word
      expect(response).to render_template :error
    end
    
    it 'return success on normal word' do
      post :create, word: word1
      expect(response).to render_template :success
    end
  end
  
  describe 'GET #show_pass' do
    it 'return error if list of word too short' do
      get :show_pass
      expect(response).to render_template :error_list
    end
    
    it 'return new password if list of word is 3 or more words' do
      word3 = FactoryGirl.create(:word3)
      get :show_pass
      expect(assign(:arr_pass)).to match_array([word1,word2,word3].permutation(2).to_a)
    end
  end
end
