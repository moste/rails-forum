class CategoriesController < ApplicationController
    def index
        @cats = Category.all
    end

    def new
        @cat = Category.new
    end

    def create
        @cat = Category.new(category_permit)
        if @cat.save
            redirect_to @cat
        else
            render 'new'
        end
    end

    def show
        @cat = Category.find(params[:id])
    end

    def edit
        @cat = Category.find(params[:id])
    end 

    def update
        @cat = Category.find(params[:id])
        if @cat.update(category_permit)
            redirect_to category_path
        else
            render 'edit'
        end
    end

    def destroy
        @cat = Category.find(params[:id])
        @cat.destroy

        redirect_to categories_path
    end

    private

    def category_permit
        params[:category].permit(:title, :description)
    end
end