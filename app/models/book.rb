class Book < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

   def self.search(search) #self.でクラスメソッドとしている
     if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
       Book.where(['title like ? OR body like ?', "%#{search}%","%#{search}%"])
     else
      Book.all #全て表示。
     end
   end

end
