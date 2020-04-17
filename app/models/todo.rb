class Todo < ActiveRecord::Base
  def to_pleasant_string
    is_completed = completed ? "[x]" : "[]"
    "#{id} #{is_completed} #{todo_text} #{due_date}"
  end

  def self.overdue
    all.where("due_date < ?", Date.today)   #instead of checking each row we are checking all the row of the table
  end

  def self.due_today
    all.where("due_date = ?", Date.today)
  end

  def self.due_later
    all.where("due_date > ?", Date.today)
  end

  def due_today?
    due_date == Date.today
  end

  def self.completed
    all.where(completed: true)
  end

  def self.show_list #takes each row and calls the to_displayable_string function
    puts "\nMy Todolist"
    puts "\nOverdue"
    puts overdue.map { |todo| todo.to_displayable_string }
    puts "\nDue Today"
    puts due_today.map { |todo| todo.to_displayable_string }
    puts "\nDue Later"

    puts due_later.map { |todo| todo.to_displayable_string }
  end
end
