class BooksController < ApplicationController

  def index
    @books = Book.paginate(page: params[:page], per_page: 5)
  end

  def show
    get_book
  end

  def new
    @book = Book.new(book_params)
  end

  def create
    create_book(params)
    redirect_to books_path
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
      isbn_13: book_data['isbn_13']
    )
    flash[:success] = "Your book was successfully listed!"
  end
end




