class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :double_byte_first_name, presence: true
  validates :double_byte_last_name, presence: true
  validates :double_byte_first_name_kana, presence: true
  validates :double_byte_last_name_kana, presence: true
  validates :date_of_birth, presence: true

  has_many :items

end
