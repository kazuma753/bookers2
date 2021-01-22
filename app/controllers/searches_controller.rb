class SearchesController < ApplicationController
    def search
            method = params[:search_method]
            word = params[:search_word]
            @books = Book.search(method,word)
            @users = User.search(method,word)
    end
end
