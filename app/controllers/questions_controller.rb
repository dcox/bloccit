class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new
    @question.title = params[:question][:title]
    @question.body = params[:question][:body]
    @question.resolved = params[:question][:resolved]

    if @question.save
      flash[:notice] = "Question was created."
      redirect_to @question
    else
      flash.now[:alert] = "There was an error creating your question. Please try again."
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.title = params[:question][:title]
    @question.body = params[:question][:body]
    @question.resolved = params[:question][:resolved]

    if @question.save
      flash[:notice] = "Your question was updated."
      redirect_to @question
    else
      flash.now[:alert] = "There was an error saving your question. Please try again."
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    if @question.delete
      flash[:notice] = "Your question was deleted."
      redirect_to questions_path
    else
      flash.now[:alert] = "There was an error deleting your question. Please try again."
      render :edit
    end
  end
end
