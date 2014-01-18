class StaticPagesController < ApplicationController
  def home
  end
  
  def help
  end
  
  def about
  end
  
  def request_feedback
    if signed_in?
      @feedback_url_for_user = give_feedback_url + "?fbk=" + current_user.feedback_request_key
    end
  end
  
  def give_feedback
    if params[:fbk].nil?
      @fbk_provided = false
    else
      @fbk_provided = true
    end
    if @fbk_provided 
      @receiving_user = User.find_by(feedback_request_key: params[:fbk])
    end
  end
end
