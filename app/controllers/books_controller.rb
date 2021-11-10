class BooksController < ApplicationController
    before_action :set_book!, only: %i[show destroy edit update]

    def index
        @pagy, @books = pagy Book.with_attached_cover.order(created_at: :desc)
    end

    def new
        @book = Book.new
    end

    def create
        @book = Book.new book_params

        if @book.save
            flash[:success] = 'Your book has been successfully published!'
            redirect_to books_path
        else
            render :new
        end
    end

    def show
        @book = Book.find_by id: params[:id]
    end

    def edit; end

    def update
        if @book.update book_params
            flash[:success] = "Your book's info has been successfully updated!"
            redirect_to books_path
        else
            render :edit
        end
    end

    def destroy
        @book.destroy
        flash[:success] = "The book was successfully deleted!"
        redirect_to books_path
    end


    private

    def book_params
        params.require(:book).permit(:title, :body, :cover)
    end

    def set_book!
        @book = Book.find params[:id]
    end
end