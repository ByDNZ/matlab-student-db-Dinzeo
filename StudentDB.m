classdef StudentDB
    properties
        size = 20; % max students in the database
        studentList = [Student]; % makes array that stores Student objects, initialized as an empty Student array
        number_of_students = 0; % tracks number of students
    end    
    methods
        function res = init(currentObj, size)
            currentObj.size = size;
            currentObj.studentList(1:currentObj.size) = Student;             
            res = currentObj;
        end
        % add new students through user input
        function res = addStudent(currentObj)
            if currentObj.number_of_students >= currentObj.size
                fprintf("The database is full!\n");
                res = currentObj;
            else
                student = Student;                
                currentObj.studentList(currentObj.number_of_students + 1) = student.initStudent;
                currentObj.number_of_students = currentObj.number_of_students + 1;
                res = currentObj;
            end
        end 
        % find student using user input id
        function res = findStudentByID(currentObj, id)
            found = false;
            for i = 1:currentObj.number_of_students
                if strcmp(currentObj.studentList(i).ID, id)
                    fprintf("Student found:\n");
                    currentObj.studentList(i).displayInfo();
                    found = true;
                    break;
                end
            end
            if ~found
                    fprintf("Student with ID %s not found.\n", id);
            end
            res = found;
        end 
        % find student using user input major
        function res = getStudentsByMajor(currentObj, major)
            found = false;
            fprintf("Students in Major: %s\n", major);
            for i = 1:currentObj.number_of_students
                if strcmp(currentObj.studentList(i).Major, major)
                    currentObj.studentList(i).displayInfo();
                    found = true;
                end
            end
            if ~found
                fprintf("No students found in Major: %s\n", major);
            end
            res = found;
        end
        % show students in database
        function res = showStudents(currentObj)
            if currentObj.number_of_students == 0
                 fprintf("No students in the database.\n");
            else
                for i = 1:currentObj.number_of_students
                    fprintf('*********************\n');
                    fprintf('Student number %d\n', i);
                    currentObj.studentList(i).displayInfo();
                end
             end
            res = currentObj;
        end 
        % save database to file 
        function save_to_file(currentObj, filename) 
            try
                save(filename, 'currentObj');
                disp(['Database saved to ' filename]);
            catch ME
                disp(['Error saving file: ' ME.message]);
            end 
        end 
        % load database from file
        function res = load_from_file(currentObj, filename)
            try
                loadedData = load(filename);
                res = loadedData.currentObj; % returns loaded object
                disp(['Database loaded from ' filename]);
            catch ME
                disp(['Error loading file: ' ME.message]);
                res = currentObj; % returns currentObj if loading fails
            end
        end
   % GPA Distribution Histogram
        function GPA_histogram(currentObj)
            figure;
            histogram([currentObj.studentList.GPA], 'BinWidth', 0.2, 'FaceColor', [0 0.5 0]); % Custom green color
            title('GPA Distribution');
            xlabel('GPA');
            ylabel('Number of Students');
            grid on;
        end
% Average GPA by Major Bar Graph       
        function avgGPA_by_major(currentObj)
         majors = {currentObj.studentList.Major};
            uniqueMajors = unique(majors);
            avgGPAs = zeros(1, length(uniqueMajors));
    
            for i = 1:length(uniqueMajors)
             majorStudents = [currentObj.studentList(strcmp(majors, uniqueMajors{i}))];
                avgGPAs(i) = mean([majorStudents.GPA]);
            end    
            figure;
            bar(avgGPAs, 'FaceColor', [0 0.5 0]);
            set(gca, 'XTickLabel', uniqueMajors);
            title('Average GPA by Major');
            ylabel('Average GPA');
            xlabel('Major');
            grid on;
        end
% Age Distribution Histogram
        function age_distribution(currentObj)
            figure;
            histogram([currentObj.studentList.Age], 'FaceColor', [0 0.7 0.3]); % Custom green color
            title('Age Distribution');
            xlabel('Age');
            ylabel('Number of Students');
            grid on;
        end
% GPA vs Age Scatterplot
        function visualizeData(currentObj)
            figure;
            scatter([currentObj.studentList.Age], [currentObj.studentList.GPA], ...
                    100, [0 0.5 0], 'filled'); % Custom green color for points
            title('GPA vs Age');
            xlabel('Age');
            ylabel('GPA');
            grid on;    
    % custom axis ticks and labels
            xticks(18:2:24); % age range on x-axis (min:step:max)
            yticks(0:0.5:4); % GPA range on y-axis
            grid on;
            axis([18 24 0 4]); % sets axis limits     
    % adds zoom and pan features
            zoom on;
            pan on;
        end
% Statistical Analysis (Average GPA, Average Age, GPA Range)
        function displayStats(currentObj)
    % calculates avg gpa
            avgGPA = mean([currentObj.studentList.GPA]);    
    % avg age
            avgAge = mean([currentObj.studentList.Age]);    
    % gpa range
            GPA_range = [min([currentObj.studentList.GPA]), max([currentObj.studentList.GPA])];
    % displays results
            disp(['Average GPA: ', num2str(avgGPA)]);
            disp(['Average Age: ', num2str(avgAge)]);
            disp(['GPA Range: Min = ', num2str(GPA_range(1)), ', Max = ', num2str(GPA_range(2))]);
        end
            end
end