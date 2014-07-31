class TodosController < ApplicationController
  def new
    @todo = Todo.new
  end

  def create
    @todo = current_user.todos.build(valid_params)
    if @todo.save
      flash.now[:success] = build_success_message(@todo, 'Created')
      redirect_to get_post_save_path
    else
      # Go back to the list screen
      render 'new'
    end
  end

  def update
    # Get the lastest version of the todo first.
    @todo = find_by_id(params[:id])
    if @todo.update_attributes(valid_params)
      flash.now[:success] = build_success_message(@todo, 'Updated')
      # Go back to the list screen
      redirect_to get_post_save_path
    else
      render 'edit'
    end
  end

  def edit
    @todo = find_by_id(params[:id])
  end

  def destroy
    # Get the latest version of this todo as we delete it.
    @todo = Todo.find(params[:id]).destroy

    # NOTE: flash should be used when redirecting, flash.now should be used to render
    flash[:success] = build_success_message @todo, 'Deleted'

    # NOTE: redirect_to should be used as redirect_to_url is depricated
    redirect_to get_post_save_path
  end

  def index
    # Slightly different, we are only showing the todos for the currently logged in user
    @todos = Todo.find_by_user_id(current_user.id).paginate(page: params[:page])
  end

  def show
    @todo = find_by_id(params[:id])
  end

  private

    # User.find(user_id) is called often, so shoving it in it's own method
    def find_by_id(todo_id)
      @todo = Todo.find(todo_id)
    end

    # This limits the parms that we'll take from the client
    def valid_params
      params.require(:todo).permit(:description, :planned_complete_date, :complete_date)
    end

    # Helper method so we don't duplicate code
    def build_success_message(todo, action)
      "The To Do with the description #{todo.description} has been #{action} successfully."
    end

    def get_post_save_path
      todos_path
    end
end
