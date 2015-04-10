class Article < ActiveRecord::Base
	include Bootsy::Container
	has_many :comments
  has_attached_file :image, styles: { medium: "400x400>", thumb: "100x100>" }

	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
	validates_presence_of :title, :body
  validates_uniqueness_of :title, {message: "Already taken!"}
end
