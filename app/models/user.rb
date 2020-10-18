class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 35}

  has_one_attached :avatar # 마치 유저의 속한 하나의 파일 처럼 작동

  def default_avatar
    if avatar.attached?
      avatar
    else 
      'default_avatar.jpg'
    end
  end

end
