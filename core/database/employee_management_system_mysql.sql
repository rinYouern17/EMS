
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    DateOfBirth DATE,
    Position NVARCHAR(50),
    Department NVARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10, 2),
    ManagerId INT,
    Image LONGBLOB
);

INSERT INTO Employees (FirstName, LastName, DateOfBirth, Position, Department, HireDate, Salary, ManagerId, Image)
VALUES
('John', 'Doe', '1985-06-15', 'Software Engineer', 'IT', '2020-01-15', 60000.00, NULL, NULL),
('Jane', 'Smith', '1990-09-23', 'Project Manager', 'IT', '2018-03-22', 75000.00, 1, NULL),
('Emily', 'Jones', '1988-12-05', 'HR Specialist', 'HR', '2019-07-01', 50000.00, NULL, NULL);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName NVARCHAR(50)
);

INSERT INTO Departments (DepartmentName)
VALUES
('IT'),
('HR'),
('Finance');

CREATE TABLE Positions (
    PositionID INT PRIMARY KEY AUTO_INCREMENT,
    PositionName NVARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

INSERT INTO Positions (PositionName, DepartmentID)
VALUES
('Software Engineer', 1),
('Project Manager', 2),
('HR Specialist', 3);

CREATE TABLE Salaries (
    SalaryID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT,
    SalaryAmount DECIMAL(10, 2),
    EffectiveDate DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

INSERT INTO Salaries (EmployeeID, SalaryAmount, EffectiveDate)
VALUES
(1, 60000.00, '2020-01-15'),
(2, 75000.00, '2018-03-22'),
(3, 50000.00, '2019-07-01');

CREATE TABLE LeaveRequests (
    LeaveRequestID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT,
    LeaveType NVARCHAR(50),
    StartDate DATE,
    EndDate DATE,
    Reason NVARCHAR(255),
    Status NVARCHAR(50),
    RequestDate DATE,
    ManagerID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID)
);

INSERT INTO LeaveRequests (EmployeeID, LeaveType, StartDate, EndDate, Reason, Status, RequestDate, ManagerID)
VALUES
(1, 'Sick Leave', '2024-11-01', '2024-11-05', 'Flu', 'Pending', '2024-10-24', 2),
(2, 'Vacation', '2024-12-15', '2024-12-25', 'Family trip', 'Approved', '2024-10-20', 1),
(3, 'Personal Leave', '2024-11-10', '2024-11-12', 'Personal reasons', 'Rejected', '2024-10-22', 2);

CREATE TABLE LeaveTypes (
    LeaveTypeID INT PRIMARY KEY AUTO_INCREMENT,
    LeaveTypeName NVARCHAR(50),
    Description NVARCHAR(255)
);

INSERT INTO LeaveTypes (LeaveTypeName, Description)
VALUES
('Sick Leave', 'Leave taken due to illness or medical reasons'),
('Vacation', 'Leave taken for personal vacation or holidays'),
('Personal Leave', 'Leave taken for personal reasons'),
('Maternity Leave', 'Leave taken for maternity purposes'),
('Paternity Leave', 'Leave taken for paternity purposes'),
('Bereavement Leave', 'Leave taken due to the death of a family member');

CREATE TABLE Messages (
    MessageID INT PRIMARY KEY AUTO_INCREMENT,
    SenderID INT,
    ReceiverID INT,
    MessageText NVARCHAR(255),
    Timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (SenderID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ReceiverID) REFERENCES Employees(EmployeeID)
);

INSERT INTO Messages (SenderID, ReceiverID, MessageText)
VALUES
(1, 2, 'Hello Jane, how are you?'),
(2, 1, 'Hi John, I am good. How about you?'),
(3, 1, 'John, can you send me the report?');
