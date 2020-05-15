 class Definition
  attr_reader :id
  attr_accessor :def, :word_id
  
  @@definitions = {}
  @@total_rows = 0

  def initialize(attributes)
    @def = attributes.fetch(:def)
    @id = attributes.fetch(:id) || @@total_rows +=1
    @word_id = attributes.fetch(:word_id)
  end

  def == (definition_to_compare)
    (self.def() == definition_to_compare.def()) && (self.word_id() == definition_to_compare.word_id())
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
    @@definitions[self.id] = Definition.new({ :def => self.def, :id => self.id, :word_id => self.word_id})
  end

end  