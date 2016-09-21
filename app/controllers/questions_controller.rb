class QuestionsController < ApplicationController
  def index
    @questions = Question.all.sort {|q| q.created_at }
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = Answer.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.create(question_params)

    if @question.save
      flash[:success] = "Question successfully posted"
      redirect_to question_path(@question)
    else
      flash[:error] = "Invalid input"
      render new_question_path
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    if @question.save
      flash[:success] = "Question saved"
      redirect_to question_path(@question)
    else
      flash[:error] = "Invalid input"
      redirect_to edit_question_path
    end

  end

  def destroy
    Question.destroy(params[:id])
    if !@question
      flash[:notice] = "Question Deleted"
      redirect_to questions_path
    else
      flash[:notice] = "Question not deleted"
      render question_path(@question)
    end
  end

  private
  def question_params
    params.require(:question).permit(:title, :details)
  end

end
