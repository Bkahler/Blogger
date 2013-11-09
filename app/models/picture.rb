class Picture < ActiveRecord::Base
  attr_accessible :title, :url

  has_many :comments, as: :commentable, dependent: :destroy
  validates :title, presence: true
  validates :url, presence: true

end
