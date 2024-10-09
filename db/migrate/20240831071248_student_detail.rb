class StudentDetail < ActiveRecord::Migration[7.0]
  def change
    create_table :student_details do |t|
      t.string :subject_name
      t.decimal :marks
      t.references :student

      t.timestamps
    end
  end
end
