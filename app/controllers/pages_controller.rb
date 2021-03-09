class PagesController < ApplicationController

  def index
    @pages= Page.sorted
  end

  def show
    @page= Page.find(params[:id])
  end

  def new
    @page= Page.new
  end

  def create 
    @page= Page.new(page_params)
    if @page.save
      redirect_to(pages_path)
    else 
      render('new')
    end
  end

  def edit
    @page= Page.find(params[:id])
  end

  def update
    @page= Page.find(params[:id])
    if @page.update_attributes(page_params)
      redirect_to(page_path(@page))
   else 
      redirect_to('edit')
   end
  end

  def delete
    @page =Page.find(params[:id])
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to(pages_path)
  end

  private
  def page_params
    params.require(:page).permit(:name, :subject_id, :position, :visible, :permalink)
  end

end
