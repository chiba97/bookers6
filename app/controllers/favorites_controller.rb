class FavoritesController < ApplicationController
  
  def create
    book_id = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: book_id.id)
    favorite.save
    @book = favorite.book
  end
  
  def destroy
    book_id = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book_id.id)
    favorite.destroy
    @book = favorite.book
  end
  
end
