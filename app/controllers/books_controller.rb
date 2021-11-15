class BooksController < ApplicationController
    before_action :set_book!, only: %i[show destroy edit update]
    before_action :fetch_groups, only: %i[new edit]

    def index
        @pagy, @books = pagy Book.with_attached_cover.all_by_groups(params[:group_ids])
        # with_attached_cover.includes(:book_groups, :groups).order(created_at: :desc)
        @searched_group = Group.where(id: params[:group_ids]).pluck(:title)
    end

    def new
        @book = Book.new
    end

    def create
        @book = current_user.books.build book_params

        if @book.save
            add_authors
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
        params.require(:book).permit(:title, :body, :cover, group_ids: [])
    end

    def set_book!
        @book = Book.find params[:id]
    end

    def fetch_groups
        @groups = Group.all
    end

    def add_authors
        authors = params[:book][:author].chomp.split(",")
        authors.each do |name|
            if Author.where(name: name).exists?
                @author = Author.where(name: name)
            else
                @author = Author.new(name: name)
            end
            @author.books << @book
            @author.save
        end
    end
end