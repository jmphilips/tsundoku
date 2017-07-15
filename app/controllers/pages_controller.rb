class PagesController < ApplicationController

  API_KEY = ENV['GOOGLE_API_KEY']

  def home
  end

  def search
    response = Google.get("https://www.googleapis.com/books/v1/volumes?q=isbn:#{params[:isbn]}&key=#{API_KEY}")
    @book = new_book(response)
    redirect_to new_book_path(@book)
  end

  def find
  end

  def add
  end

  private

  def new_book(json_response)
    response = JSON.parse(json_response)['items'].first
    text_snippet = nil

    if response['searchInfo'].present?
      text_snippet = response['searchInfo']['textSnippet']
    end

    response = response['volumeInfo']

    {
      title: response['title'] || nil,
      subtitle: response['subtitle'] || nil,
      author: response['authors'] || nil,
      description: response['description'] || nil,
      isbn_10: response['industryIdentifiers'].first['identifier'] || nil,
      isbn_13: response['industryIdentifiers'].second['identifier'] || nil,
      thumbnail: response['imageLinks']['thumbnail'] || nil,
      small_thumbnail: response['imageLinks']['smallThumbnail'] || nil,
      text_snippet: text_snippet,
      categories: response['categories'].join(' ')
    }
  end

end

class Google
  include HTTParty
  format :html
end
