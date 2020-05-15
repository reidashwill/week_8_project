require 'rspec'
require 'pry'
require 'word'


describe '#Word' do
  
  describe('#save') do
    it('saves an instance of the word class to the @@words hash')do
      word = Word.new({:name => "Enterprise", :id => nil})
      word.save()
      word2 = Word.new({:name => "Voyager", :id => nil})
      word2.save()
      expect(Word.all).to(eq([word, word2]))
    end
  end
  
end