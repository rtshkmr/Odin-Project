class Tag < ApplicationRecord
    has_many :taggings, dependent: :destroy
    has_many :articles, through: :taggings

    # optional?
    def to_s
        name
    end
end
