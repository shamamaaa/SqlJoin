CREATE DATABASE UserTask
USE UserTask

CREATE TABLE Users(
    [Id] INT PRIMARY KEY IDENTITY,
    [Username] VARCHAR(25) NOT NULL,
    [Password] VARCHAR(55) NOT NULL,
    [RoleId] INT REFERENCES Roles(Id)
) 

CREATE TABLE Roles(
    [Id] INT PRIMARY KEY IDENTITY,
    [Name] VARCHAR(25) NOT NULL,
)

INSERT INTO Roles (Name) VALUES 
('Admin'),
('Moderator'),
('User')

INSERT INTO Users VALUES
('shamama7', 'Samama2004', 1),
('asman18', '12345678A', 3),
('zuzuwu', 'zuzuzuzuz555', 2)


SELECT U.Username, R.Name AS [Role Name]
FROM Users U
JOIN Roles R ON U.RoleID = R.Id;
