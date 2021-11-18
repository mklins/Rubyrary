# frozen_string_literal: true

module Admin
  class AuthorsController < ApplicationController
    before_action :require_authentication
    before_action :set_author!, only: %i[show edit update destroy]
    before_action :authorize_author!
    after_action :verify_authorized

    def index
      @pagy, @authors = pagy Author.order(created_at: :desc)
    end

    def show
      @author = Author.find_by id: params[:id]
    end

    def edit; end

    def update
      if @author.update author_params
        flash[:success] = 'Author successfully updated!'
        redirect_to admin_authors_path
      else
        render :edit
      end
    end

    def destroy
      @author.destroy
      flash[:success] = 'Author successfully deleted!'
      redirect_to admin_authors_path
    end

    private

    def set_author!
      @author = Author.find params[:id]
    end

    def author_params
      params.require(:author).permit(:name)
    end

    def authorize_author!
      authorize(@author || Author)
    end
  end
end
