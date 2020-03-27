class TodosController < ApplicationController
  def index
    render plain: "all the records of the todo list will be shown here"
  end
end
