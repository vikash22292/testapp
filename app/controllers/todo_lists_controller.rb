class TodoListsController < ApplicationController
  before_action :set_todo_list, only: %i[show edit update destroy update_status]

  def index
    @todo_lists = current_user.todo_lists
    search = params[:search]&.downcase
    @todo_lists = @todo_lists.where(status: search) if search && !search.eql?("all")
  end

  def show
  end

  def new
    @todo_list = current_user.todo_lists.build
  end

  def edit
  end

  def create
    @todo_list = current_user.todo_lists.build(todo_list_params)

    respond_to do |format|
      if @todo_list.save
        format.html { redirect_to @todo_list, notice: 'Todo list was successfully created.' }
        format.json { render :show, status: :created, location: @todo_list }
      else
        format.html { render :new }
        format.json { render json: @todo_list.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @todo_list.update(todo_list_params)
        format.html { redirect_to @todo_list, notice: 'Todo list was successfully updated.' }
        format.json { render :show, status: :ok, location: @todo_list }
      else
        format.html { render :edit }
        format.json { render json: @todo_list.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @todo_list.destroy
    respond_to do |format|
      format.html { redirect_to todo_lists_url, notice: 'Todo list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update_status
    status = @todo_list.status.eql?("active") ? 1 : 0
    @todo_list.update(status: status)
    respond_to do |format|
      format.html { redirect_to todo_lists_url, notice: 'Todo list status successfully updated.' }
      format.json { head :no_content }
    end
  end

  private
    def set_todo_list
      @todo_list = TodoList.find(params[:id])
    end

    def todo_list_params
      params.require(:todo_list).permit(:title, :note)
    end
end
