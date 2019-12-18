class Article < ApplicationRecord
    has_many :comments
    has_many :taggings
    has_many :tags, through: :taggings

    #  article model has to have the tag_list method
    def tag_list
        self.tags.collect do |tag|
          tag.name
        end.join(", ")
    end   
    #  I think this is a setter method for tag_list?
    def tag_list=(tags_string)
      tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
      # possibly an error?
      new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
      self.tags = new_or_found_tags
    end
end

# probably outdated syntax: 
# class Article < ActiveRecord::Base
#     has_many :comments
# end