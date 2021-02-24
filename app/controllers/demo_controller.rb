class DemoController < ApplicationController
  layout false
  def index
    #render('demo/index')  #these are default behaviour
  
    #render('demo/hello')

    @id = params['id'];
    @name = params[:name];
  end

  def hello
    #render('hello')       #these are default behaviour
    
    #redirect_to(controller: 'demo', action: 'index')
    #render('demo/index')


    #using instance vaiables
    @array = [1,2,3,4,5]
  end

  def about
    render('about_us')
  end

  def contact
  
    if ['us','ca'].include?(params[:country])
      @phone='+1 (987) 654-3210';
    elsif params[:country]='uk'
      @phone='(800) 555-6789';
    else
      @phone='(020) 7946 1234';
    end

    render('contact_us')
  end
end
