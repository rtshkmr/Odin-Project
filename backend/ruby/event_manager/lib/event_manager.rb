
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




# ITERATION 3: USING GOOGLE CIVIC INFO API 
# 
# =========================================
contents.each do |row|
  name = row[:first_name]

  zipcode = clean_zipcode(row[:zipcode])

  begin
    legislators = civic_info.representative_info_by_address(
                                address: zipcode,
                                levels: 'country',
                                roles: ['legislatorUpperBody', 'legislatorLowerBody'])
    legislators = legislators.officials

    legislator_names = legislators.map(&:name)

    legislators_string = legislator_names.join(", ")
  rescue
    "You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials"
  end

  puts "#{name} #{zipcode} #{legislators_string}"
end