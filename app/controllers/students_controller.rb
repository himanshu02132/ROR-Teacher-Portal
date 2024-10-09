class StudentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
   @student = Student.create_student(student_params[:name], student_params[:subject_name], student_params[:marks].to_i)
   if @student
     flash[:notice] = 'Student created or updated successfully.'
   else
     render :errors
   end
    # @student = Student.find_by(name: student_params[:name], subject_name: student_params[:subject_name])

    # if @student
    #   # If the student record exists, update the marks
    #   @student.update(marks: student_params[:marks].to_i)
    #   flash[:notice] = 'Marks updated successfully.'
    # else
    #   @student = Student.create(student_params)
    #   if @student.save
    #     flash[:notice] = 'Student created successfully.'
    #   else
    #     render :errors
    #   end
    # end

  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      flash.now[:success] = 'Updated successfully'
    else
      render :errors
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    flash.now[:success] = 'deleted successfully'
  end

  private

  def student_params
    params.require(:student).permit(:name, :subject_name, :marks)
  end
end
