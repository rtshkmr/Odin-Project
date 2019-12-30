require 'rest-client'
  url_1 = "http://localhost:3000/users/"
  url_2 = "http://localhost:3000/users/new"
  url_3 = "http://localhost:3000/users/edit"
  url_4 = "http://localhost:3000/users/show"

  puts RestClient.get(url_1)
  puts "===================="
  puts RestClient.get(url_2)
  puts "===================="

  puts RestClient.get(url_3)
  puts "===================="

  puts RestClient.get(url_4)
  puts "===================="

  puts RestClient.post(url_1, "")
