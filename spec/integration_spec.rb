require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a word path', {:type => :feature}) do
  it('creates a word and then goes back to the words page') do
    visit('/words')
    fill_in('word_name', :with => 'test')
    click_on('Submit Word!')
    expect(page).to have_content('test')
  end
end

describe('create a definition path', {:type => :feature}) do
  it('creates a definition for a word') do
    word = Word.new({:name => "Neelix", :id => nil})
    word.save()
    visit("words/#{word.id}")
    fill_in('definition_name', :with => "Cook on the USS Voyager")
    click_on('Submit')
    expect(page).to have_content("Cook on the USS Voyager")
  end
end

describe('look at a definition path', {:type => :feature}) do
  it('creates a definition for a word') do
    word = Word.new({:name => "Neelix", :id => nil})
    word.save()
    visit("words/#{word.id}")
    fill_in('definition_name', :with => "Cook on the USS Voyager")
    click_on('Submit')
    click_on('Cook on the USS Voyager')
    expect(page).to have_content("Would you like to change this definition?")
  end
end

describe('update a definition path', {:type => :feature}) do
  it('updates a definition for a word') do
    word = Word.new({:name => "Neelix", :id => nil})
    word.save()
    visit("words/#{word.id}")
    fill_in('definition_name', :with => "Cook on the USS Voyager")
    click_on('Submit')
    click_on('Cook on the USS Voyager')
    fill_in('name', :with => "loves having his whiskers pulled")
    click_on('Submit!')
    expect(page).to have_content("loves having his whiskers pulled")
  end
end

describe('delete all definitions of a word path', {:type => :feature}) do
  it('deletes all definitions belonging to one word') do
    @word = Word.new({:name => "Neelix", :id => nil})
    @word.save()
    @word2 = Word.new({:name => "Defiant", :id => nil})
    @word2.save()
    @definition1 = Definition.new({:name => "The USS Enterprise in a galaxy class starship of the United Federation of Planets.  It has a registered as NCC-1701-D", :id => nil, :word_id => @word.id})
    @definition1.save()
    @definition2 = Definition.new({:name => "The starship commanded by the bald guy in that Trek Wars show", :id => nil, :word_id => @word2.id})
    @definition2.save()
    visit("words/#{@word2.id}")
    click_on('DELETE ALL DEFINITIONS')
    expect(page).to have_no_content("The starship commanded by the bald guy in that Trek Wars show")
  end
end

describe('delete one definition path', {:type => :feature}) do
  it("deletes one definition") do
    @word = Word.new({:name => "Neelix", :id => nil})
    @word.save()
    @definition1 = Definition.new({:name => "The USS Enterprise in a galaxy class starship of the United Federation of Planets.  It has a registered as NCC-1701-D", :id => nil, :word_id => @word.id})
    @definition1.save()
    visit("words/#{@word.id}/#{@definition1.id}")
    click_on('Delete Definition')
    expect(page).to have_no_content('The USS Enterprise in a galaxy class starship of the United Federation of Planets.  It has a registered as NCC-1701-D')
  end
end