def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp
  end
  #return the array of input_students
  students
end
def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end
def print(students)
  index = 0
  while index < students.length
    if students[index][:name][0] == "L"
      if students[index][:name].length < 12
        puts "#{index+1}. #{students[index][:name].center(25)} (#{students[index][:cohort]} cohort)"
      end
    end
    index+=1
  end
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
