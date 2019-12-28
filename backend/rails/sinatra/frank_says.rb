# frozen_string_literal: true

# iteration zero, check all dependancies are present and
# basic server can run:
require 'sinatra'

get '/frank-says' do
  'Put this in your pipe & smoke it!'
end
