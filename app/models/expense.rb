class Expense < ActiveRecord::Base

  belongs_to :user, foreign_key: 'user_id', class_name: 'User'
  scope :deleted, lambda { where(active: false) }
  scope :not_deleted, lambda { where(active: true) }

end
