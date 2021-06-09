class SearchController < ApplicationController
  # def self.search(search) #self.でクラスメソッドとしている
    # if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      # Book.user.where(['title like ? OR body like ?', "%#{search}%","%#{search}%"])
    # else
      # Book.all #全て表示。
    # end
  # end

  def search
    @books = Book.search(params[:search],params[:text])
    @users = User.search(params[:user][:search],params[:user][:text])
    @faculty = params[:faculty]
  　search = params[:search]
  　text = params[:text]
    if @faculty == 'User'
      @user = User.search(search,text)
 　　 else
    　 @book = Book.search(search,text)
    end

    #byebug
  end

end


