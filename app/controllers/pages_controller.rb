class PagesController < ApplicationController
  def index
    @pages= Page.order(' position ASC')
  end

  def show
    @pages= Page.find(params[:id])
  end

  def new
    @pages= Page.new
  end

  def create 
    @pages= Page.new(pages.params)
    if pages.save
      redirect_to(page_path)
    else 
      redirect_to('new')
  end

  def edit
    @pages= Page.find(params[:id])
  end

  def update
    @pages= Page.find(params[:id])
    
  end

  def delete
    @pages =Page.find(params[:id])
  end

  def destroy
    @pages =Page.find(params[:id])
    Page.destroy
    redirect_to('index')
  end
  
end
