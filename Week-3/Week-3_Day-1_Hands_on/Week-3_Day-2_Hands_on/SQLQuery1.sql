CREATE DATABASE EventDb;

USE EventDb;

CREATE TABLE UserInfo
(
EmailId VARCHAR(100) PRIMARY KEY,

UserName VARCHAR(50) NOT NULL
	CHECK (LEN(UserName) BETWEEN 1 AND 50),

Role VARCHAR(20) NOT NULL
	CHECK (Role IN ('Admin','Participant')),

Password VARCHAR(20) NOT NULL
	CHECK (LEN(Password) BETWEEN 6 AND 20)
);
INSERT INTO UserInfo
VALUES ('user1@gmail.com','Vasu','Participant','123456');

CREATE TABLE EventDetails
(
EventId INT PRIMARY KEY,
EventName VARCHAR(50) NOT NULL
CHECK (LEN(EventName) BETWEEN 1 AND 50),
EventCategory VARCHAR(50) NOT NULL
CHECK (LEN(EventCategory) BETWEEN 1 AND 50),
EventDate DATETIME NOT NULL,
Description VARCHAR(255) NULL,
Status VARCHAR(20)
CHECK (Status IN('Active','In-Active'))
);
INSERT INTO EventDetails
VALUES (1,'Tech Event','Technology','2026-03-04','Tech Conference','Active');
--------Speaker Details--------
CREATE TABLE SpeakersDetails(
SpeakerId INT PRIMARY KEY,
SpeakerName VARCHAR(50) NOT NULL,
CONSTRAINT CHECK_SpeakerName_Length
CHECK (LEN(SpeakerName) BETWEEN 1 AND 50)
); 
INSERT INTO SpeakersDetails (SpeakerID,SpeakerName)
VALUES(2,'Ravi Kumar');

------Session Info---------
CREATE TABLE SessionInfo (
SessionId INT PRIMARY KEY,

EventId INT NOT NULL,
SpeakerId INT NOT NULL,

SessionTitle VARCHAR(50) NOT NULL,
Description VARCHAR(255) NULL,

SessionStart DATETIME NOT NULL,
SessionEnd DATETIME NOT NULL,

SessionUrl VARCHAR(255) NULL,

    -- Foreign Key for Event
CONSTRAINT FK_Session_Event
FOREIGN KEY (EventId)
REFERENCES EventDetails(EventId),

    -- Foreign Key for Speaker
CONSTRAINT FK_Session_Speaker
FOREIGN KEY (SpeakerId)
REFERENCES SpeakersDetails(SpeakerId),

    -- Length validation for title
CONSTRAINT CHK_SessionTitle_Length
CHECK (LEN(SessionTitle) BETWEEN 1 AND 50),

    -- Ensure session end time is after start time
CONSTRAINT CHK_Session_Time
CHECK (SessionEnd > SessionStart)
);
INSERT INTO SessionInfo
VALUES (1,1,1,'AI Session','AI Discussion','2026-03-04 10:00','2026-03-04 11:00',NULL);

------ParticipantEventDetails---------
CREATE TABLE ParticipantEventDetails (
    Id INT PRIMARY KEY,
    ParticipantEmailId VARCHAR(50) NOT NULL,
    EventId INT NOT NULL,
    SessionId INT NOT NULL,
    IsAttended BIT NOT NULL,
    FOREIGN KEY (ParticipantEmailId) REFERENCES UserInfo(EmailId),
	FOREIGN KEY (EventId) REFERENCES EventDetails(EventId),
	FOREIGN KEY (SessionId) REFERENCES SessionInfo(SessionId));

INSERT INTO ParticipantEventDetails VALUES
(2,'user1@gmail.com',1,1,1);


