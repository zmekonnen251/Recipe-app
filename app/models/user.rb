class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :foods, dependent: :destroy
  has_many :recipes, dependent: :destroy

  validates :name, presence: true
  validates :name, length: { minimum: 3, maximum: 30 }

  enum role: [:default, :admin]

  def is?(role)
    self.role == role.to_s
  end
end
