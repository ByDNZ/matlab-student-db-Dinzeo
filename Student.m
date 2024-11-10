classdef Student
    properties
        ID = ""
        Name = ""
        Age = 0
        GPA = 0.0
        Major = ""
    end

    methods
        function res = createStudent(currentObj, id, name, age, gpa, major)
            currentObj.ID = id;
            currentObj.Name = name;
            currentObj.Age = age;
            currentObj.GPA = gpa;
            currentObj.Major = major;
            res = currentObj;
        end

        function res = initStudent(currentObj)
            currentObj.ID = input("What's the ID of the Student?: ", "s");
            currentObj.Name = input("What's the name of the Student?: ", "s");
            currentObj.Age = input("What's the age of the Student?: ");
            currentObj.GPA = input("What's the GPA of the Student?: ");
            currentObj.Major = input("What's the major of the Student?: ", "s");
            res = currentObj;
        end

        function res = displayInfo(currentObj)
            fprintf('\n Student Information\n---------------------\n');
            fprintf('ID: %s\n', currentObj.ID);
            fprintf('Name: %s\n', currentObj.Name);
            fprintf('Age: %d\n', currentObj.Age);
            fprintf('GPA: %.2f\n', currentObj.GPA);
            fprintf('Major: %s\n\n', currentObj.Major);
            res = currentObj;
        end

        function res = updateGPA(currentObj, newGPA)
            currentObj.GPA = newGPA;
            fprintf('GPA updated to %.2f for %s\n\n', currentObj.GPA, currentObj.Name);
            res = currentObj;
        end
    end
end

