class HomeController < ApplicationController
  def index
    @teacher = current_user
    @students = Student.all
  end
end
