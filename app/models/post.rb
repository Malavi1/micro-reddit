class Post < ApplicationRecord
  belongs_to :user
  validates :title, acceptance: { message: 'Must container title for the blog'}
  validates :context, acceptance: { message: 'Must containe context for the blog'}
end
