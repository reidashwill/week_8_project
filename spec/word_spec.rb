require 'rspec'
require 'pry'
require 'word'


describe '#Word' do

  before (:each) do
    Word.clear()
  end
  
  describe('#save') do
    it('saves an instance of the word class to the @@words hash')do
      word = Word.new({:name => "Enterprise", :id => nil})
      word.save()
      word2 = Word.new({:name => "Voyager", :id => nil})
      word2.save()
      expect(Word.all).to(eq([word, word2]))
    end
  end

  describe('.all') do
    it('returns an empty array when there are no words') do
      expect(Word.all).to(eq([]))
    end
  end
  
  describe('.clear') do
    it("clears all boards") do
      word = Word.new({:name => "Discovery", :id => nil})
      word.save()
      word2 = Word.new({:name => "Defiant", :id => nil})
      word2.save()
      Word.clear
      expect(Word.all).to(eq([]))
    end
  end

  describe('#==') do
    it('changes definition of "==" to make sure that words are equal if they have the same attributes') do
      word = Word.new({:name => "Picard", :id => nil})
      word.save()
      word2 = Word.new({:name => "Picard", :id => nil})
      word2.save()
      expect(word).to(eq(word2))
    end
  end
end