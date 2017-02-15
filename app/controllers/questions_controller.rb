class QuestionsController < ApplicationController

  def index
    @questions = Question.all
    # @user = current_user      # filtering by user
    # @questions = @user.questions
  end

  def show
    @question = Question.find(params[:id])
    if params[:upvote]
      @answer = Answer.find(params[:upvote])
      @answer.liked_by current_user
      render :show
    end
    if params[:downvote]
      @answer = Answer.find(params[:downvote])
      @answer.disliked_by current_user
      render :show
    end
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = session[:user_id]
    if @question.save
      flash[:notice] = "Question added!"
      redirect_to questions_path
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:notice] = "Question updated!"
      redirect_to questions_path
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    flash[:notice] = "Question deleted!"
    redirect_to questions_path
  end


  private
    def question_params
      params.require(:question).permit(:query)
    end
end
