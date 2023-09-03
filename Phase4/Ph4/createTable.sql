CREATE TABLE student(
	studentID int NOT NULL PRIMARY KEY,
	firstName varchar(50) NOT NULL,
	lastName varchar(50) NOT NULL,
	email varchar(50) NOT NULL
);
CREATE TABLE ta(
	taID int NOT NULL PRIMARY KEY,
	firstName varchar(50) NOT NULL,
	lastName varchar(50) NOT NULL,
	email varchar(50) NOT NULL,

	addID int NOT NULL,
	uploadStuffID int NOT NULL,
	providedLessons varchar(100) NOT NULL
);
CREATE TABLE professor(
	professorID int NOT NULL PRIMARY KEY,
	firstName varchar(50) NOT NULL,
	lastName varchar(50) NOT NULL,
	email varchar(50) NOT NULL,

	addID int NOT NULL,
	lessonList varchar(100) NOT NULL,
	attendanceList varchar(100) NOT NULL
);
CREATE TABLE systemTable(
	systemID int NOT NULL PRIMARY KEY
);
CREATE TABLE supporter(
	supporterID int NOT NULL PRIMARY KEY,
	firstName varchar(50) NOT NULL,
	lastName varchar(50) NOT NULL,
	email varchar(50) NOT NULL,

	addID int NOT NULL,
	systemID int NOT NULL FOREIGN KEY REFERENCES systemTable(systemID)
);
CREATE TABLE sessionFile(
	sessionID int NOT NULL PRIMARY KEY,
	--stuffFile file NOT NULL,
	uploadTime time NOT NULL,
	uploadDate date NOT NULL
);
CREATE TABLE note(
	noteID int NOT NULL PRIMARY KEY,
	--stuffFile file NOT NULL,
	uploadTime time NOT NULL,
	uploadDate date NOT NULL
);
CREATE TABLE quiz(
	quizID int NOT NULL PRIMARY KEY,
	--stuffFile file NOT NULL,
	uploadTime time NOT NULL,
	uploadDate date NOT NULL
);
CREATE TABLE hw(
	hwID int NOT NULL PRIMARY KEY,
	deadLine date NOT NULL,
	--stuffFile file NOT NULL,
	uploadTime time NOT NULL,
	uploadDate date NOT NULL
);
CREATE TABLE class(
	classID int NOT NULL PRIMARY KEY,
	participantID int NOT NULL,
	classHW int NOT NULL FOREIGN KEY REFERENCES hw(hwID),
	classQuiz int NOT NULL FOREIGN KEY REFERENCES quiz(quizID),
	classNote int NOT NULL FOREIGN KEY REFERENCES note(noteID),
	classSessionFile int NOT NULL FOREIGN KEY REFERENCES sessionFile(sessionID),
	professorID int NOT NULL FOREIGN KEY REFERENCES professor(professorID),
	taList varchar(50) NOT NULL,
	className varchar(50) NOT NULL,
	studentsList varchar(50) NOT NULL,
	classDate date NOT NULL,
	classTime time NOT NULL
);
CREATE TABLE sessionTable(
	classID int NOT NULL FOREIGN KEY REFERENCES class(classID)
);
CREATE TABLE participants(
	studentID int NOT NULL FOREIGN KEY REFERENCES student(studentID),
	classID int NOT NULL FOREIGN KEY REFERENCES class(classID)
);
CREATE TABLE TAparticipants(
	taID int NOT NULL FOREIGN KEY REFERENCES ta(taID),
	classID int NOT NULL FOREIGN KEY REFERENCES class(classID)
);
