class Book < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end



    def self.search(search,text)
        if search == "forward_match"
            @book = Book.where("title like ? OR body like ?","#{text}%","#{text}%")
        elsif search == "backward_match"
            @book = Book.where("title like ? OR body like ?","%#{text}","%#{text}")
        elsif search == "perfect_match"
            @book = Book.where("#{text}")
        elsif search == "partial_match"
            @book = Book.where("title like ? OR body  like ?","%#{text}%","%#{text}%")
        else
            @book = Book.all
        end
    end
end

