class AddProjectIdToTodos < ActiveRecord::Migration
  def up
    add_column :todos, :project_id, :integer
    add_index :todos, :project_id
    project = Project.create(name: "Untilted Project")
    Todo.update_all project_id: project.id
  end

  def down
    remove_index :todos, :project_id
    remove_column :todos, :project_id
  end
end
