require 'rails_helper'

RSpec.describe Word, type: :model do
  it 'validates presence of title' do
    expect(Word.new()).to_not be_valid
  end
  it 'not validate length of title < 3' do
    expect(Word.new(title: 'We')).to_not be_valid
  end
  it 'not validate length of title > 40' do
    expect(Word.new(title: "#{'a' * 41}")).to_not be_valid
  end
  it 'validates normal create Word' do
    expect(Word.new(title: 'Word')).to be_valid
  end
end
