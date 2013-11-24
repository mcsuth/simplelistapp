class TodosController < ApplicationController

  before_filter :authenticate_user!, except: [:index]

  def index
    @todos = Todo.all
    # @todos = Todo.where(user_id: current_user.id)

    if user_signed_in?
      @todos = current_user.todos
    end

    @todo = Todo.new
    respond_to do |format|
      format.html
      format.json { render :json => @todos}
    end
  end

  def create
    @todo = Todo.create(params[:todo])
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @todo = Todo.delete(params[:id])
    @id = params[:id]
        respond_to do |format|
      format.js
    end
  end

end
