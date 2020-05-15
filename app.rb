require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @words = Word.all
  erb(:words)
end

get('/words') do
  redirect to ('/')
end

post('/words') do
  name = params[:word_name]
  word = Word.new({:name => name, :id => nil})
  word.save()
  redirect to ('/')
end

get('/words/:id') do
  @word = Word.find(params[:id].to_i)
  @definitions = Definition.find_by_word(@word.id)
  erb(:word)
end

post('/words/:id') do
  @word = Word.find(params[:id].to_i)
  name = params[:definition_name]
  definition = Definition.new({:name => name, :id => nil, :word_id => @word.id})
  definition.save()
  @definitions = Definition.find_by_word(@word.id)
  erb(:word)
end



delete('/words/:id') do
  @word = Word.find(params[:id].to_i)
  Definition.delete_by_word(@word.id)
  @definitions = Definition.find_by_word(@word.id)
  erb(:word)
end


get('/words/:id/:def_id') do
  @word = Word.find(params[:id].to_i)
  @definition = Definition.find(params[:def_id].to_i)
  erb(:definition)
end 

 
patch('/words/:id/:def_id') do
  @word = Word.find(params[:id].to_i)
  @definition = Definition.find(params[:def_id].to_i)
  @definition.update(params[:name])
  @definitions = Definition.find_by_word(@word.id)
  erb(:word)
end 

delete('/words/:id/:def_id') do 
  @word = Word.find(params[:id].to_i)
  @definition = Definition.find(params[:def_id].to_i)
  @definition.delete()
  @definitions = Definition.find_by_word(@word.id)
  erb(:word)
end  