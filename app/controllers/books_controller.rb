class BooksController < ApplicationController

  def index
    @books = Book.where.not(user_id: current_user.id).where(state: 'listed').paginate(page: params[:page], per_page: 5)
  end

  def show
    get_book
  end

  def new
    @book = Book.new(book_params)
  end

  def create
    create_book(params)
    redirect_to my_books_path
  end

  def destroy
    book = Book.find(params[:id])
    book.requests.delete_all
    book.destroy
    flash[:danger] = 'Listing was successfully removed.'
    redirect_to my_books_path
  end

  def update
    book = Book.find(params[:id])
    book.update!(state: params[:state])
    flash[:success] = 'Book request accepted. Please send the user an email.' if book.save
    redirect_to my_books_path
  end

  def my_books
    @books = Book.where(user_id: current_user.id).paginate(page: params[:page], per_page: 5)
  end

  private

  def book_params
    params.permit(:title, :subtitle, :description, :isbn_10, :isbn_13, :text_snippet, :thumbnail, :small_thumbnail, :categories, author: [])
  end

  def get_book
    @book = Book.find(params[:id])
  end

  def create_book(params)
    book_data = params[:book]
    Book.create!(
      title: book_data['title'],
      subtitle: book_data['subtitle'],
      author: book_data['author'],
      description: book_data['description'],
      text_snippet: book_data['text_snippet'],
      thumbnail: book_data['thumbnail'],
      small_thumbnail: book_data['small_thumbnail'],
      isbn_10: book_data['isbn_10'],
      isbn_13: book_data['isbn_13'],
      user: current_user
    )
    flash[:success] = "Your book was successfully listed!"
  end
end




