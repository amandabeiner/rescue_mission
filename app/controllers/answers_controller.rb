class AnswersController < ApplicationController

  def create
    @answer = Answer.new(answer_params)
    @question = Question.find(params[:question_id])
    @answer.question = @question

    if @answer.save
      flash[:success] = "Answer successfully posted"
      redirect_to question_path(@question)
    else
      flash[:error] = "Invalid input"
      redirect_to question_path(@question)
    end

  end


  private

  def answer_params
    params.require(:answer).permit(:description)
  end

end
