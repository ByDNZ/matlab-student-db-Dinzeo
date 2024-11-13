% Author Name: Lucius Dinzeo
% Email: dinzeo22@students.rowan.edu
% Created On: 11/1/2024
% Updated On: 11/12/2024
% Update By: Dinzeo
% All rights are reserved - MIT License
% Title: Midterm

db = StudentDB;
size = 3;

db = db.init(size);

number_of_users = 3;
for i = 1:number_of_users
    fprintf('********************* \n');
    db = db.addStudent();
end

% show updated student list
disp("Updated student list:");
db.showStudents();

% find a student by ID
search_id = input("Enter desired Student ID: ", "s");
db.findStudentByID(search_id);

% list all students by major
search_major = input("Enter desired major: ", "s");
db.getStudentsByMajor(search_major);

% save the database to a file
db.save_to_file('StudentDB.mat');

% load the database from a file
db = db.load_from_file('StudentDB.mat');

% GPA Distribution Histogram
db.GPA_histogram();

% Average GPA by Major
db.avgGPA_by_major();

% Age Distribution
db.age_distribution();

% show average GPA and age statistics
db.displayStats();

db.visualizeData();

% update student GPA 
newGPA = input("Enter the updated GPA for the student (no decimal): ");
student = student.updateGPA(newGPA); 
student = student.displayInfo();
