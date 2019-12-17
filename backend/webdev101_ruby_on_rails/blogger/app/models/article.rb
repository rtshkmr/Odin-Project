class Article < ApplicationRecord
    has_many :comments
end

# probably outdated syntax
# class Article < ActiveRecord::Base
#     has_many :comments
# end