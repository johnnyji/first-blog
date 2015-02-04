class Article < ActiveRecord::Base
	has_many :comments

	has_attached_file :image
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
	validates_presence_of :title, :body
	has_attached_file :image, styles: { medium: "400x400>", thumb: "100x100>" }


end
