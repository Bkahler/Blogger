class Comment < ActiveRecord::Base
  attr_accessible :commentable_id, :commentable_type, :text

  belongs_to :commentable, polymorphic: true

  validates :text, presence: true
  validates :commentable, presence: true
end
