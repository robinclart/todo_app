class Project < ActiveRecord::Base
  has_many :todos, dependent: :delete_all
  belongs_to :user, touch: true

  def new_todo(*args, &block)
    todos.build(*args, &block)
  end

  def all_todos
    todos.order(:created_at).all
  end
end
