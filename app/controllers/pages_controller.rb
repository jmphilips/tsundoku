class PagesController < ApplicationController

  API_KEY = ENV['GOOGLE_API_KEY']

  def home
  end

  def search
    isbn = params[:isbn]
    response = Google.get("https://www.googleapis.com/books/v1/volumes?q=isbn:#{isbn}&key=#{API_KEY}")
    @book = new_book(response)
    redirect_to new_book_path(@book)
  end

  def find
  end

  def add
  end

  private

  def new_book(json_response)
    response = JSON.parse json_response
    search_info = response['items'].first['searchInfo']
    response = response['items'].first['volumeInfo']

    {
      title: response['title'] || nil,
      subtitle: response['subtitle'] || nil,
      author: response['authors'] || nil,
      description: response['description'] || nil,
      isbn_10: response['industryIdentifiers'].first['identifier'] || nil,
      isbn_13: response['industryIdentifiers'].second['identifier'] || nil,
      thumbnail: response['imageLinks']['thumbnail'] || nil,
      small_thumbnail: response['imageLinks']['smallThumbnail'] || nil,
      text_snippet: search_info['textSnippet'] || nil,
      categories: response['categories'].join(' ')
    }
  end

end

class Google
  include HTTParty
  format :html
end
