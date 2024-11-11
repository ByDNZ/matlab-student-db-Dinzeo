% Author Name: Lucius Dinzeo
% Email: dinzeo22@students.rowan.edu
% Created On: 11/1/2024
% Updated On: 11/11/2024
% Update By: Dinzeo
% All rights are reserved - MIT License
% Title: Midterm

%Create a StudentDatabase class that implements:
%File Operations (10 points)
%Save database to a .mat file
%Load database from a file
%Student Management (15 points)
%Add new students
%Find students by ID
%Get list of students by major

db = StudentDB;
size = 3;

db = db.init(size);

number_of_users = 3;
for i = 1:number_of_users
    fprintf('********************* \n');
    db = db.addStudent();
end

% Show updated student list
disp("Updated student list:");
db.showStudents();

% Find a student by ID
search_id = input("Enter desired Student ID: ", "s");
db.findStudentByID(search_id);

% List all students in a specific major
search_major = input("Enter desired major: ", "s");
db.getStudentsByMajor(search_major);

% Save the database to a file
db.save_to_file('StudentDB.mat');

% Load the database from a file
db = db.load_from_file('StudentDB.mat');

% GPA Distribution Histogram
db.GPA_histogram();

% Average GPA by Major
db.avgGPA_by_major();

% Age Distribution
db.age_distribution();

% Show average GPA and age statistics
db.displayStats();

db.visualizeData();

newGPA = input("Enter the updated GPA for the student: ");
student = student.updateGPA(newGPA); 
student = student.displayInfo();
