require 'rspec'
require 'definition'
require 'word'
require 'pry'

describe '#Definition' do
  
  before(:each) do
    Definition.clear()
    Word.clear()
    word = Word.new({:name => "Enterprise", :id => nil})
    word.save()
  end



end