class Attachment < ApplicationRecord
    belongs_to :articles
    has_attached_file :image, styles: { medium: "960x960>", thumb: "100x100>" }
    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
    has_article_id
end
