class User < ApplicationRecord
  has_many :bank_accounts, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, :last_name, :gender, :age, presence: true
  validates :age, numericality: {
    greater_than_or_equal_to: 14, 
    less_than_or_equal_to: 120
  }
  validates :gender, inclusion: { in: %w(Male Female Other) }
end
