class SubjectsController < ApplicationController
  def index
    @subjects =Subject.order("position ASC")
  end

  def show
    @Subject = Subject.find(params[:id])
  end

  def new
  end

  def create 
  end

  def edit
  end

  def delete
  end

  def destroy
  end
  
end
