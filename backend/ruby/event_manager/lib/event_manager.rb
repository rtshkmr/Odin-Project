# frozen_string_literal: true

# # ITERATION 0: display first_names only, basically writing some
# # parse statements
# #-------------------------------------------
# lines = File.readlines "event_attendees.csv"
# lines.each_with_index do |line,index|
#   next if index == 0
#   columns = line.split(",")
#   name = columns[2]
#   puts name
# end

# puts "EventManager initialized."
# lines = File.readlines "event_attendees.csv"
# lines.each do |line|
#   puts line
# end

# ITERATION 1: USING THE CSV LIBRARY
#
# --------------------------------------

# ====== normal access =================
# require "csv"
# puts "EventManager initialized."

# contents = CSV.open "event_attendees.csv", headers: true
# contents.each do |row|
#   name = row[2]
#   puts name
# end

# # ======= using header_converters ===========
# require "csv"
# puts "EventManager initialized."

# contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
# contents.each do |row|
#   name = row[:first_name]
#   zipcode = row[:zipcode]
#   puts "#{name} #{zipcode}"
# end

# # ITERATION 2: CLEANING THE DATA UP, HANDLING ITERATION
# #
# # =======================================================

# require 'csv'

# def clean_zipcode(zipcode)
#   if zipcode.nil?
#     "00000"
#   elsif zipcode.length < 5
#     zipcode.rjust(5,"0")
#   elsif zipcode.length > 5
#     zipcode[0..4]
#   else
#     zipcode
#   end
# end

# def clean_zipcode(zipcode)
#   zipcode.to_s.rjust(5,"0")[0..4]
# end

# puts "EventManager initialized."

# contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol

# contents.each do |row|
#   name = row[:first_name]

#   zipcode = clean_zipcode(row[:zipcode])

#   puts "#{name} #{zipcode}"
# end

# # ITERATION 3: USING GOOGLE CIVIC INFO API
# #
# # =========================================

# require 'csv'
# require 'google/apis/civicinfo_v2'

# # takes in value for zipcode in csv and cleans that value based on some set requirements
# def clean_zipcode(zipcode)
#   zipcode.to_s.rjust(5,"0")[0..4]
# end

# def legislators_by_zipcode(zip)
#   # create the API object instance and set the API key
#   civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
#   civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

#   begin # use the exceptions class to handle missing address info and not let it throw error

#     #  we get these steps by analysing the URL for the API, which indicates what methods and
#     #  symbols we need to handle
#     legislators = civic_info.representative_info_by_address(
#                               address: zip,
#                               levels: 'country',
#                               roles: ['legislatorUpperBody', 'legislatorLowerBody'])
#     # only using this will output the raw object directly, not what we want
#     legislators = legislators.officials

#     # instead of outputting each raw legislator, print only their first name and last name
#     legislator_names = legislators.map(&:name)
#     # to explicitly convert the array of legislator names to a string for the desired comma-separated output,
#     legislator_names.join(", ")
#   rescue
#     "You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials"
#   end

# end

# puts "EventManager initialized."

# contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol

# contents.each do |row|
#   name = row[:first_name]

#   zipcode = clean_zipcode(row[:zipcode])

#   legislators = legislators_by_zipcode(zipcode)

#   puts "#{name} #{zipcode} #{legislators}"
# end

# ITERATION 4: FORM LETTERS: USING ERB TO TEMPLATE
#
# ===============================================================

# require 'csv'
# require 'google/apis/civicinfo_v2'
# require 'erb'

# # takes in value for zipcode in csv and cleans that value based on some set requirements
#   def clean_zipcode(zipcode)
#     zipcode.to_s.rjust(5, '0')[0..4]
#   end

#   def legislators_by_zipcode(zip)
#     # create the API object instance and set the API key
#     civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
#     civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

#     begin 
#       # use the exceptions class to handle missing address info and not let it throw error
#       #  we get these steps by analysing the URL for the API, which indicates what methods and
#       #  symbols we need to handle
#       legislators = civic_info.representative_info_by_address(
#         address: zip,
#         levels: 'country',
#         roles: %w[legislatorUpperBody legislatorLowerBody]
#       ).officials
#     rescue StandardError
#       'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
#     end
#   end

#   def save_thank_you_letter(id, form_letter)
#     # mkdir if it doesn't exist yet
#     Dir.mkdir('output') unless Dir.exist? 'output'

#     filename = "output/thanks_#{id}.html"

#     File.open(filename, 'w') do |file|
#       file.puts form_letter
#   end

#   puts 'EventManager initialized.'

#   contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol

#   # load the template_letter (an erb) and the erb_template
#   template_letter = File.read 'form_letter.erb' # the file contents have been loaded as a string
#   erb_template = ERB.new template_letter # provides the file contents as a string parameter when creating hte new ERB template

#   contents.each do |row|
#     id = row[0]
#     name = row[:first_name]
#     zipcode = clean_zipcode(row[:zipcode])
#     legislators = legislators_by_zipcode(zipcode)
#     form_letter = erb_template.result(binding)
#     save_thank_you_letter(id, form_letter)
#   end
# end


require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end

def clean_phone_number(phone_number)
  # phone is a string, trim all the non-numeric values first
  phone_number.tr!("-,(,), ,", "")

  bad_number = false
  if phone_number.length > 11 || phone_number.length < 10
    bad_number = true
  elsif (phone_number.length == 11) && (phone_number[0] != 1)
    bad_number = true
  elsif (phone_number.length == 11) && (phone_number[0] == 1)
    phone_number = phone_number[1..-1]
  return phone_number unless bad_number
  end
end

def legislators_by_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

  begin
    civic_info.representative_info_by_address(
      address: zip,
      levels: 'country',
      roles: ['legislatorUpperBody', 'legislatorLowerBody']
    ).officials
  rescue
    "You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials"
  end
end

def save_thank_you_letter(id,form_letter)
  Dir.mkdir("output") unless Dir.exists?("output")

  filename = "output/thanks_#{id}.html"

  File.open(filename,'w') do |file|
    file.puts form_letter
  end
end

puts "EventManager initialized."

contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol

template_letter = File.read "form_letter.erb"
erb_template = ERB.new template_letter

contents.each do |row|
  id = row[0]
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])
  legislators = legislators_by_zipcode(zipcode)
  
  # # phone numbers are 5th element, so index 4, so pass into clean_phone_number function
  phone_number = clean_phone_number(row[5])
  form_letter = erb_template.result(binding)

  save_thank_you_letter(id,form_letter)
end
