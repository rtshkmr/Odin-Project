class Comment < ApplicationRecord
  belongs_to :article
end


#  probably outdated syntax:
# class Comment < ActiveRecord::Base
#   belongs_to :article
# end