class RequestsController < ApplicationController

  def index
    @requests = Request.where(taker_id: current_user.id)
  end

  def create
    book = Book.find(params[:book_id])
    giver = book.user
    taker = current_user
    @request = Request.create!(book: book, giver: giver, taker: taker)
    if @request.save
      flash[:success] = 'Book request sent.'
    end
    redirect_to my_books_path
  end

end