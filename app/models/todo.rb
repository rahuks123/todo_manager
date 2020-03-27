class Todo < ActiveRecord::Base
  def to_pleasant_string
    is_completed = completed ? "[x]" : "[]"
    "#{id} #{is_completed} #{todo_text} #{due_date}"
  end
end
