class AnswersController < ApplicationController

    def new
      @question = Question.find(params[:question_id]) # getting id from question
      @answer = @question.answers.new # maping id/answers/new
    end

    def create
      @question = Question.find(params[:question_id]) # getting id from question
      @answer = @question.answers.new(answer_params)
      @answer.user_id = current_user.id
      if @answer.question.save
        flash[:notice] = "Answer Saved!"
        redirect_to question_path(@answer.question)
      else
        flash[:notice] = "Answer not Saved!"
        render :new
      end
    end

    def edit
        @question = Question.find(params[:question_id])
        @answer = Answer.find(params[:id])
        render :edit
      end

    def update
      @question = Question.find(params[:question_id])
      @answer = Answer.find(params[:id])
      if @answer.update(answer_params)
        flash[:notice] = "Answer Updated!"
        redirect_to question_path(@answer.question)  # Redirects to this question and passes in it's answers
      else
        render :edit
      end
    end

    def destroy
      @question = Question.find(params[:question_id])
      @answer = Answer.find(params[:id])
      @answer.destroy
      flash[:notice] = "Answer Deleted!"
      redirect_to question_path(@answer.question)#questions_path would take you to all questions
    end

  private
    def answer_params
      params.require(:answer).permit(:content)
    end
  end
