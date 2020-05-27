class Student
  attr_reader :name

  def initialize(student_name, grade)
    @name = student_name
    @grade = grade
  end

  def better_grade_than?(other_student)
    grade > other_student.grade
  end

  protected

  def grade
    @grade
  end
end

connor = Student.new('Connor', 89)
bob = Student.new('Bob', 88)
p connor.better_grade_than?(bob)
