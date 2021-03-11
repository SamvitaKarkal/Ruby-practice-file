class SubjectsController < ApplicationController
 
 layout 'admin'

  def index
    @subjects =Subject.order("position ASC")
    @page_title="All Subjects"
  end

  def show
    @subject = Subject.find(params[:id])
   
  end

  def new
    @subject= Subject.new({:name=>'Default'})
    @subject_count = Subject.count + 1
  end

  def create 
    #Instantiate a new subject using form parameters
    @subject = Subject.new(subject_params) 
    #params asking for subject that will return all the key value pairs in subject
    #Save the object
    if @subject.save
    #If save successful, redirect to the index action
      flash[:notice]= "Subject created successfully"
    redirect_to(subjects_path)

    #redirecting it to the index page
    else
    #If save fails, redisplay the form so user can fix problems
    @subject_count = Subject.count + 1
    #added because subject_count not initially passed.
    render('new') 
    #redirect it to the form
    #to data is saved in @subject is used to prepopulate the form
    end
  end

  def edit
    @subject=Subject.find(params[:id])
    @subject_count = Subject.count
  end

  def update
    @subject=Subject.find(params[:id]) 

    if @subject.update(subject_params)
      flash[:notice]= "Subject updated successfully"
      redirect_to(subject_path(@subject))
    else
      @subject_count = Subject.count
      render('edit')
    end
  end

  def delete
    @subject=Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice]= "Subject '#{@subject.name}' destroyed successfully"
    redirect_to(subjects_path)
  end

  private
  def subject_params
    params.require(:subject).permit(:name, :position, :visible, :created_at)
  end

  #these are declared here seperately as we wouldn't have to redeclare the when needed again

end
