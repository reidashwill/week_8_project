 class Definition

  attr_reader :id
  attr_accessor :name, :word_id

  @@definitions = {}
  @@total_rows = 0

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id) || @@total_rows += 1
    @word_id = attributes.fetch(:word_id)
  end 

  def == (definition_to_compare)
    (self.name() == definition_to_compare.name()) && (self.word_id() == definition_to_compare.word_id())
  end

  def self.all
    @@definitions.values()
  end
  
  def self.clear
    @@definitions = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@definitions[id]
  end

  def save
    @@definitions[self.id] = Definition.new({ :name => self.name, :id => self.id, :word_id => self.word_id})
  end

  def update(name)
    self.name = name
    self.save
  end

  def delete
    @@definitions.delete(self.id)
  end

  def self.find_by_word(wrd_id)
    definitions_array = []
    @@definitions.values.each do |definition|
      if definition.word_id == wrd_id
        definitions_array.push(definition)
      end
    end
    definitions_array
  end

  def word
    Word.find(self.word_id)
  end

end  