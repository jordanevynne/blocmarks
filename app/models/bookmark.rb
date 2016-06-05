class Bookmark < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic

  has_many :likes, dependent: :destroy

  validates_presence_of :user, :topic
end
