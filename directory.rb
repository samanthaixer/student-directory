def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #get the first name
  name = gets.gsub(/\R+/, '')
  #while the name is not empty, repeat this code
  while !name.empty? do
    valid_cohorts = [
      "january",
      "february",
      "march",
      "april",
      "may",
      "june",
      "july",
      "august",
      "september",
      "october",
      "november",
      "december"]
    puts "enter a cohort"
    cohort = gets.chomp.downcase

    if !valid_cohorts.include?(cohort)
      puts "incorrect cohort, please try again"
      cohort = gets.chomp
    end

    students << {name: name, cohort: cohort.to_sym, hobby: :coding, country_of_birth: :England, height: "Tall"}
    puts students.count == 1 ? "Now we have #{students.count} student" : "Now we have #{students.count} students"
    #get another name from the user
    name = gets.gsub(/\R+/, '')
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
    if students[index][:name][0].upcase == "L"
      if students[index][:name].length < 12
        puts "#{index+1}. #{students[index][:name].center(25)} (#{students[index][:cohort]} cohort)"
      end
    end
    index+=1
  end
end
def print_by_cohort(students)
  sorted_students = students.sort_by{ |student| student[:cohort] }
  sorted_students.each_with_index do |student, index|
    puts "#{index+1}. #{student[:name].center(25)} (#{student[:cohort]} cohort)"
  end
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
def interactive_menu
  students = []
  loop do
      # 1. Print the menu and ask the user what to do
      puts "1. Input the students"
      puts "2. Show the students"
      puts "9. Exit"
      # 2. Read the input and save it to a variable
      selection = gets.chomp
      #3. Do what the user has asked
      case selection
      when "1"
        students = input_students
      when "2"
        if !students.empty?
          print_header
          print(students)
          print_footer(students)
        end
      when "9"
        exit
      else
        puts "I don't know what you meant, try again"
      end
  end
end

#nothing happens until we call the methods
interactive_menu
#  print_by_cohort(students)
