@students = [] # an empty array accessible to all methods
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
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

    @students << {name: name, cohort: cohort.to_sym, hobby: :coding, country_of_birth: :England, height: "Tall"}
    puts @students.count == 1 ? "Now we have #{@students.count} student" : "Now we have #{@students.count} students"
    #get another name from the user
    name = gets.gsub(/\R+/, '')
  end
end
def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end
def print_students_list
  index = 0
  while index < @students.length
    #if @students[index][:name][0].upcase == "L"
      if @students[index][:name].length < 12
        puts "#{index+1}. #{@students[index][:name].center(25)} (#{@students[index][:cohort]} cohort)"
      end
    #end
    index+=1
  end
end
def print_by_cohort
  sorted_students = @students.sort_by{ |student| student[:cohort] }
  sorted_students.each_with_index do |student, index|
    puts "#{index+1}. #{student[:name].center(25)} (#{student[:cohort]} cohort)"
  end
end
def print_footer
  puts "Overall, we have #{@students.count} great students"
end
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end
def show_students
  if !@students.empty?
    print_header
    print_students_list
    print_footer
  end
end
def process(selection)
  case selection
  when "1"
    students = input_students
  when "2"
    show_students
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end
def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

#nothing happens until we call the methods
interactive_menu
#  print_by_cohort(students)
