class PagesController < ApplicationController

  layout 'admin'

  before_action :find_subjects, :only => [:new, :create, :edit, :update]
  before_action :set_page_count, :only => [:edit, :update, :new, :create]

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
    if @page.update(page_params)
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

  def find_subjects
      @subjects = Subject.sorted
  end

  def set_page_count
      @page_count = Page.count
    if params[:action] == 'new' || params[:action] == 'create'
        @page_action +=1
    end
  end

end
