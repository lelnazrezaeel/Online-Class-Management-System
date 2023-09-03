--1
GO
CREATE PROCEDURE allStudentsOfClass @cID int
AS
SELECT *
FROM student AS s
JOIN participants AS p ON p.studentID = s.studentID
WHERE p.classID = @cID;

EXEC allStudentsOfClass @cID = 0;

--2
GO
CREATE PROCEDURE allClassesOfStudent @sID int
AS
SELECT *
FROM class AS c
JOIN participants AS p ON p.classID = c.classID
WHERE p.studentID = @sID;

EXEC allClassesOfStudent @sID = 0;

--3
GO
CREATE PROCEDURE allTAsOfClass @cID int
AS
SELECT t.taID, t.firstName, t.lastName
FROM ta AS t
JOIN TAparticipants AS p ON p.taID = t.taID
WHERE p.classID = @cID;

EXEC allTAsOfClass @cID = 0;

--4
GO
CREATE PROCEDURE allClassesOfProfessor @pID int
AS
SELECT c.className
FROM professor AS p
JOIN class AS c ON c.professorID = p.professorID
WHERE p.professorID = @pID;

EXEC allClassesOfProfessor @pID = 0;

--5

