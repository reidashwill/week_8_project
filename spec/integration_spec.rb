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