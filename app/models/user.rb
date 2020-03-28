class User < ActiveRecord::Base
  def display
    "#{id} #{email} #{password} #{name}"
  end
end
