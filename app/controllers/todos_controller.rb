class TodosController < ApplicationController
  before_action :set_project
  before_action :set_todo, only: [:show, :edit, :update, :destroy, :complete]

  # GET /todos
  # GET /todos.json
  def index
    @todos = @project.all_todos
  end

  # GET /todos/1
  # GET /todos/1.json
  def show
  end

  # GET /todos/new
  def new
    @todo = @project.new_todo
  end

  # GET /todos/1/edit
  def edit
  end

  def complete
    @todo.update done: params[:checked]
    respond_to do |format|
      format.html { redirect_to todos_url }
      format.json { render json: { OK: true } }
    end
  end

  # POST /todos
  # POST /todos.json
  def create
    @todo = @project.new_todo(todo_params)

    respond_to do |format|
      if @todo.save
        format.html { redirect_to [@project, @todo], notice: 'Todo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @todo }
      else
        format.html { render action: 'new' }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todos/1
  # PATCH/PUT /todos/1.json
  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to [@project, @todo], notice: 'Todo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    @todo.destroy
    respond_to do |format|
      format.html { redirect_to project_url(@project) }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = current_user.projects.find(params[:project_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_todo
    @todo = @project.todos.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def todo_params
    params.require(:todo).permit(:desc, :done)
  end
end
