class RequestsController < ApplicationController

  def index
    if Request.where(taker_id: current_user.id).count > 0
      @requests = Request.where(taker_id: current_user.id).paginate(page: params[:page], per_page: 5)
    else
      flash[:warning] = 'Sorry, you do not have any requested books'
      redirect_to root_path
    end
  end

  def show
    @request = Request.includes(:book, :taker, :giver).find_by(giver_id: current_user.id, book_id: params[:id])
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
    redirect_to requests_path 
  end

  def destroy
    request = Request.includes(:book).find(params[:id])
    request.book.update!(state: 'listed')
    request.destroy!
    flash[:danger] = 'Request for book was cancelled.'
    redirect_to my_books_path
  end

end