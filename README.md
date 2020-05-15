# Childrens Word Definer

#### _This project allows the user to input words, and then add possible definitions of the word_

#### By _**Reid Ashwill**_

## Description

This app allows the user to create words, which are added to a mock database.  The user can then add, edit or delete definitions for those words.
__
## Specs
| Specs  for Word class                                                          | Input         | Output                          |
|--------------------------------------------------------------------------------|---------------    |--------                     |
| 1. Word class creates an object that is a word                                 | Word              | word                        |
|                                                                                |                   |                             |
| 2. the word class can clear all instances of word                              | Word.clear        | @@words = []                |
|                                                                                |                   |                             |
| 3. the word class can "Save" instances to a mock database held in @@words      | word.save         | @@words = [word]            |
|                                                                                |                   |                             |
| 4. instance of the word class can find all of its definitions                  | word.all          | @@words = [word, word2]     |


| Specs for Definition class                                                     | Input             | Output                      |
|--------------------------------------------------------------------------------|---------------    |--------                     |
| 1. Definition class creates an object that is a definition                     | definition        | definition                  |
|                                                                                |                   |                             |
| 2. the definition class can clear all instances of definition                  | definition.clear  | @@definitions = [ ]         |
|                                                                                |                   |                             |
| 3. the definition class can "Save" instances to a mock database held           | definition.save   | @@definitions=[definition]  | 
|    in @@definitions                                                            |                   |                             |
|                                                                                |                   |                             |
| 4. instaces of the definition class can be updated                             | definition.update | @@definitions=[updatedword] |
|                                                                                |  (updatedword)    |                             |
| 5. instances of the definition class can be deleted                            | definition.delete | @@definitions=[]            |
|                                                                                |                   |                             |
| 6. instance of the definition class can find which member of the               |                   |                             |
|    word class it belongs to                                                    |                   |                             |



## Setup/Installation Requirements

* _Navigate to https://github.com/reidashwill/week-8-project_
* _clone the respository to your local machine_
* _navigate to the cloned directory and open in your text editor of choice to view code_
* _run the command 'rspec' to run the suite of tests included_
* _run the rommand "ruby app.rb" to open the app in sinatra
* _navigate your browser of choice to localhost:{whatever address sinatra is performing on.  usually 4567}



## Known Bugs

_No known bugs at this time._

## Support and contact details

_Please reach out with any issues through https://github.com/reidashwill/week-8-project/issues_

## Technologies Used

* _Ruby_
* _Rspec_
* _Capybara_
* _Sinatra_
* _HTML (erb)_
* _Bootstrap_

### License

*Licensed under the MIT license*

Copyright (c) 2020 **_Reid Ashwill_**