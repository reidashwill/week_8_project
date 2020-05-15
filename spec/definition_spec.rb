require 'rspec'
require 'definition'
require 'word'
require 'pry'

describe '#Definition' do
  
  before(:each) do
    Definition.clear()
    Word.clear()
    @word = Word.new({:name => "Enterprise", :id => nil})
    @word.save()
  end

  describe('#==') do
    it ('is the same definition if it has the same attributes as anothe definition') do
      definition1 = Definition.new({:name => "The USS Enterprise in a galaxy class starship of the United Federation of Planets.  It has a registered as NCC-1701-D", :id => nil, :word_id => @word.id})
      definition2 = Definition.new({:name => "The USS Enterprise in a galaxy class starship of the United Federation of Planets.  It has a registered as NCC-1701-D", :id => nil, :word_id => @word.id})
      expect(definition1).to(eq(definition2))
    end
  end

  describe('.all') do
    it('returns an array of all definitions') do
      definition1 = Definition.new({:name => "The USS Enterprise in a galaxy class starship of the United Federation of Planets.  It has a registered as NCC-1701-D", :id => nil, :word_id => @word.id})
      definition1.save()
      definition2 = Definition.new({:name => "The starship commanded by the bald guy in that Trek Wars show", :id => nil, :word_id => @word.id})
      definition2.save()
      expect(Definition.all).to(eq([definition1, definition2]))

    end
  end

  describe('.clear') do
    it('clears all definitions')do
      definition1 = Definition.new({:name => "The USS Enterprise in a galaxy class starship of the United Federation of Planets.  It has a registered as NCC-1701-D", :id => nil, :word_id => @word.id})
      definition1.save()
      definition2 = Definition.new({:name => "The starship commanded by the bald guy in that Trek Wars show", :id => nil, :word_id => @word.id})
      definition2.save()
      Definition.clear()
      expect(Definition.all).to(eq([]))
    end
  end

end