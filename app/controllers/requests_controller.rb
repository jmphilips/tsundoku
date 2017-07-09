class RequestsController < ApplicationController

  def index
    if Request.where(taker_id: current_user.id).count > 0
      @requests = Request.where(taker_id: current_user.id)
    else
      flash[:danger] = 'Sorry, you do not have any requested books'
      redirect_to root_path
    end
  end

  def create
    book = Book.find(params[:book_id])
    giver = book.user
    taker = current_user
    @request = Request.create!(book: book, giver: giver, taker: taker)
    if @request.save
      book.update!(state: 'requested')
      flash[:success] = 'Book request sent.'
    end
    redirect_to my_books_path
  end

end