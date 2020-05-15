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

  describe('#save') do
    it('save definition to the @@definitions hash') do
      definition1 = Definition.new({:name => "The USS Enterprise in a galaxy class starship of the United Federation of Planets.  It has a registered as NCC-1701-D", :id => nil, :word_id => @word.id})
      definition1.save()
      definition2 = Definition.new({:name => "The starship commanded by the bald guy in that Trek Wars show", :id => nil, :word_id => @word.id})
      definition2.save()
      expect(Definition.all).to(eq([definition1, definition2]))
    end
  end

  describe('.find') do
    it('finds a definition by id') do
      definition1 = Definition.new({:name => "The USS Enterprise in a galaxy class starship of the United Federation of Planets.  It has a registered as NCC-1701-D", :id => nil, :word_id => @word.id})
      definition1.save()
      definition2 = Definition.new({:name => "The starship commanded by the bald guy in that Trek Wars show", :id => nil, :word_id => @word.id})
      definition2.save()
      expect(Definition.find(definition1.id)).to(eq(definition1))
    end
  end

  describe('#update') do
    it('updates the name property of a definition') do
      definition1 = Definition.new({:name => "The USS Enterprise in a galaxy class starship of the United Federation of Planets.  It has a registered as NCC-1701-D", :id => nil, :word_id => @word.id})
      definition1.save()
      definition1.update("The USS Enterprise is the flagship of the United Federation of Planets")
      expect(definition1.name).to(eq("The USS Enterprise is the flagship of the United Federation of Planets"))
    end
  end

  describe('#delete') do
    it('deletes a definition by id') do
      definition1 = Definition.new({:name => "The USS Enterprise in a galaxy class starship of the United Federation of Planets.  It has a registered as NCC-1701-D", :id => nil, :word_id => @word.id})
      definition1.save()
      definition2 = Definition.new({:name => "The starship commanded by the bald guy in that Trek Wars show", :id => nil, :word_id => @word.id})
      definition2.save()
      definition1.delete()
      expect(Definition.all).to(eq([definition2]))
    end
  end

  describe('.find_by_word') do
    it('finds all definitions inside a word based on word_id') do
      definition1 = Definition.new({:name => "The USS Enterprise in a galaxy class starship of the United Federation of Planets.  It has a registered as NCC-1701-D", :id => nil, :word_id => @word.id})
      definition1.save()
      definition2 = Definition.new({:name => "The starship commanded by the bald guy in that Trek Wars show", :id => nil, :word_id => @word.id})
      definition2.save()
      expect(Definition.find_by_word(@word.id)).to(eq([definition1, definition2]))
    end
  end

  describe('word') do
    it('finds the word a definition belongs to') do
      definition1 = Definition.new({:name => "The USS Enterprise in a galaxy class starship of the United Federation of Planets.  It has a registered as NCC-1701-D", :id => nil, :word_id => @word.id})
      definition1.save()
      expect(difinition1.word()).to(eq(@word))
    end
  end
end