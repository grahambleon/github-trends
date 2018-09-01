# README

Written following the ruby style guide https://github.com/bbatsov/ruby-style-guide#newline-eof

'ruby crawler.rb' in the terminal will show you the relevant data for the first part of the challenge.

To set up the API

'rake db:create'
'rake db:migrate'
'rake db:seed'
  -the seed file has the same logic in it as the crawler. You can drop and reseed at any time for an updated list.
'rails s'

Testing is done with RSpec. 'bundle exec rspec' to run the test suite.

Visit 'http://localhost:3000/api/v1/repos' to see the data.
