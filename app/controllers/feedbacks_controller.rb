class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end
  
  def create
    
    @feedback = Feedback.new(feedback_params)
    if @feedback.save
      #flash[:success] = "Success"
      redirect_to root_path, :notice => "Feedback was submitted"
    else
      #flash[:error] = "Bad Fields"
      render 'new'
    end
  end
  
  private 
  def feedback_params
    user_id = User.find_by(email: params[:feedback][:receiver_email])
    params.require(:feedback).permit(:content, :giver_email, @user_id)
  end
  
  
end	