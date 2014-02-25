class Todo < ActiveRecord::Base
  validates :desc, presence: true, hashtag: true, length: 4..1000
  belongs_to :project, touch: true
end
