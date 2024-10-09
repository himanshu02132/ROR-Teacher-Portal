class Student < ApplicationRecord
  has_many :student_details
  validates :name, presence: true

  # before_commit: create_student

  # private
  def self.create_student(name, subject_name, marks)
    student = Student.find_by(name: name)
    if student.present?
      student_detail = student.student_deatils.find_by(subject_name: subject_name)
      if student_detail.present?
        student_detail.update(marks: marks)
      else
        student.student_details.create(subject_name: subject_name, marks: marks)
      end
    else
      student = Student.create(name: name)
      student.student_details.create(subject_name: subject_name, marks: marks)
    end
    return student
  end
end
