require 'rails_helper'

RSpec.describe WordsController, type: :controller do
  let(:word1) { FactoryGirl.create(:word, title: 'RubyMine') }
  let(:word2) { FactoryGirl.create(:word, title: 'TheBest') }
  
  describe 'GET #index' do
    before { get :index }
    
    it '#index return page' do
      expect(response).to render_template :index
    end
    
    it '#index return array of all word' do
      expect(assigns(:words)).to match_array([word1, word2])
    end
  end
  
  describe 'POST #create' do
    it 'return error on short word' do
      post :create, params: { word: { title: 'Qw' } }, xhr: true
      expect(response).to render_template :error
    end
    
    it 'return success on normal word' do
      post :create, params: { word: { title: 'RubyMine' } }, xhr: true
      expect(response).to render_template :success
    end
  end
  
  describe 'GET #show_pass' do
    let(:word3) { FactoryGirl.create(:word, title: 'OfTheWorld') }
    # word3 = FactoryGirl.create(:word, title: 'OfTheWorld')
    it 'return error if list of word too short' do
      xhr :get, :show_pass
      expect(response).to render_template :error_list
    end
    
    it 'return new password if list of word is 3 or more words' do
      xhr :get, :show_pass
      expect(assigns(:arr_pass)).to match_array(['RubyMine','TheBest','OfTheWorld'].permutation(2).collect{ |p| p[0] + p[1] }.to_a)
    end
  end
  after { Word.all.delete_all }
end
