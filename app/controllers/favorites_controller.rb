class FavoritesController < ApplicationController
  
  def create
    book_id = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: book_id.id)
    favorite.save
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    book_id = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book_id.id)
    favorite.destroy
    redirect_back(fallback_location: root_path)
  end
  
end
