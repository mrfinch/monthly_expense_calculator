class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 191 }, format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  has_many :expenses, foreign_key: 'user_id', class_name: 'Expense'

  before_save :downcase_email

  def total_expenses
    not_deleted_expenses.pluck(:cost).sum
  end

  def num_of_expenses
    not_deleted_expenses.count
  end

  def not_deleted_expenses
    expenses.not_deleted
  end

  private

  def downcase_email
    self.email = email.downcase
  end

end
