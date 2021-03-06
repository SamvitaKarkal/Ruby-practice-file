class SectionsController < ApplicationController
  
    def index
      @sections= Section.sorted
    end
  
    def show
      @section= Section.find(params[:id])
    end
  
    def new
      @section= Section.new
    end
  
    def create 
      @section= Section.new(section_params)
      if @section.save
        redirect_to(sections_path)
      else 
        render('new')
      end
    end
  
    def edit
      @section= Section.find(params[:id])
    end
  
    def update
      @section= Section.find(params[:id])
      if @section.update(section_params)
        redirect_to(section_path(@section))
     else 
        redirect_to('edit')
     end
    end
  
    def delete
      @section= Section.find(params[:id])
    end
  
    def destroy
      @section= Section.find(params[:id])
      @section.destroy
      redirect_to(sections_path)
    end
  
    private
    def section_params
      params.require(:section).permit(:page_id, :name, :position, :visible, :content_type, :content)
    end
  
  end
  
