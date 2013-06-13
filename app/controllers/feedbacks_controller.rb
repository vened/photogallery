class FeedbacksController < ApplicationController

  def index
    @feedbacks = Feedback.all
    @feedback = Feedback.new
  end

  def create
    @feedbacks = Feedback.all
    @feedback = Feedback.new(params[:feedback])
    if @feedback.save
      redirect_to feedbacks_url
    else
      render :action => 'index'
    end
  end

end
