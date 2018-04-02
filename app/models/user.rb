class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum role: { employee: 0, manager: 1, hr: 2 }
  enum status: { pending: 0, cancelled: 1, approved: 2, completed: 3 }
  validates :image, :first_name, :last_name,
            :age, :birthdate, presence: true
  #validates :image, integrity: true
  #validates :image, processing: true

end
