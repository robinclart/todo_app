class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.text :desc
      t.boolean :done, default: false

      t.timestamps
    end
  end
end
