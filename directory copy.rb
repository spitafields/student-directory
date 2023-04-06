def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name and cohort
  input = gets.rstrip
  while !input.empty? do
    # split the input string into name and cohort using regex
    name, cohort = input.split(/,\s*/)
    # convert cohort to a symbol
    cohort = cohort.empty? ? :unknown : cohort.downcase.to_sym
    # add the student hash to the array
    students << { name: name, cohort: cohort }
    puts "Now we have #{students.count} #{students.count == 1 ? "student" : "students"}"
    # get another name from the user
    input = gets.rstrip
  end
  # return the array of students
  students
end
def print_by_cohort(students)
  students_by_cohort = students.group_by { |student| student[:cohort] }
  students_by_cohort.each do |cohort, students|
    puts "#{cohort.capitalize} Cohort:".center(50)
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
  students.each_with_index do |student, index|
    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort) - Hobbies:     #{student[:hobbies]}, Country of birth: #{student[:country_of_birth]}, Height:  #{student[:height]} cm".center(50)
    end
  puts "Overall, we have #{students.count} great students".center(50)
  end
end
students = input_students
print_by_cohort(students)
#nothing happens untill we call the methods
print_header 
print(students)
print_footer(students)
