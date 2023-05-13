CREATE DATABASE notesdb IF NOT EXISTS;
use notesdb;
CREATE TABLE Note IF NOT EXISTS(
    note_id int NOT NULL,
    note_title varchar(255),
    note_content varchar(255),
    note_status varchar(255),
    note_creation_date date DEFAULT(CURRENT_DATE),
    PRIMARY KEY(note_id)
);
CREATE TABLE User IF NOT EXISTS(
    user_id int NOT NULL,
    user_name varchar(255),
    user_added_date date default(current_date),
    user_password varchar(255),
    user_mobile varchar(255),
    PRIMARY KEY(user_id)
);
CREATE TABLE category IF NOT EXISTS(
    category_id int NOT NULL,
    category_name varchar(255),
    category_descr varchar(255),
    category_creation_date date default(current_date),
    category_creator varchar(255),
    PRIMARY KEY(category_id)
);
create TABLE reminder IF NOT EXISTS(
    reminder_id int not null,
    reminder_name varchar(255),
    reminder_descr varchar(255),
    reminder_type varchar(255),
    reminder_creation_date date default(current_date),
    reminder_creator varchar(255),
    PRIMARY KEY(reminder_id)
);
CREATE TABLE NoteCategory IF NOT EXISTS(
    notecategory_id int not null,
    note_id int,
    category_id int,
    PRIMARY KEY(notecategory_id)
);
CREATE TABLE NoteReminder IF NOT EXISTS(
    notereminder_id int not null,
    note_id int,
    reminder_id int,
    PRIMARY KEY(notereminder_id)
);
CREATE TABLE Usernote IF NOT EXISTS(
    usernote_id int,
    user_id int,
    note_id int,
    PRIMARY KEY(usernote_id)
);
INSERT INTO Note(note_id, note_title, note_content, note_status) 
VALUES (1, "first note", "this is the first", "Active");
INSERT INTO category(category_id, category_name, category_descr, category_creator)
VALUES (1, "Test", "Just testing", "Adekunle");
INSERT INTO reminder(reminder_id, reminder_name, reminder_descr, reminder_type, reminder_creator)
VALUES (1, "First reminder", "This is the first reminder", "Hourly", "Adekunle");
INSERT INTO UserNote(usernote_id, user_id, note_id)
VALUES (1, 1, 1);
INSERT INTO NoteReminder(notereminder_id, note_id, reminder_id)
VALUES(1, 1, 1);
INSERT INTO NoteCategory(notecategory_id, note_id, category_id)
VALUES(1, 1, 1);
INSERT INTO User(user_id, user_name, user_password, user_mobile)
VALUES(1, "Adekunle", "Bigboss", "+2348036706988");
SELECT * FROM User WHERE user_name= "Adekunle" AND user_password= "Bigboss";
SELECT * FROM Note  WHERE note_creation_date= "2023-05-13";
SELECT * FROM category  WHERE category_creation_date> "2023-05-11";
SELECT note_id FROM UserNote where user_id = 1;
update Note
set note_title="Here goes a modification"
where note_id= 1;
select * from Note where note_id = (select note_id from usernote where user_id = 1);
SELECT * FROM Note WHERE note_id=(SELECT note_id from NoteCategory WHERE category_id=1);
SELECT * FROM reminder WHERE reminder_id=(SELECT reminder_id from NoteReminder WHERE note_id=1);
SELECT * FROM reminder WHERE reminder_id=1;
INSERT INTO Note(note_id, note_title, note_content, note_status)
VALUES (2, "2nd Note", "This is the second note", "Active");
INSERT INTO UserNote(usernote_id, user_id, note_id)
VALUES (2, 1, 2);
INSERT INTO Note(note_id, note_title, note_content, note_status)
VALUES (3, "3rd Note", "This is the third note", "Active");
INSERT INTO NoteCategory(notecategory_id, note_id, category_id)
VALUES (2, 3, 1);
INSERT INTO reminder(reminder_id, reminder_name, reminder_descr, reminder_type, reminder_creator)
VALUES (2, "Second reminder", "This is the Second reminder", "Daily", "Adekunle");
INSERT INTO NoteReminder(notereminder_id, note_id, reminder_id)
VALUES(2, 3, 2);
delete FROM Note WHERE note_id in (SELECT note_id FROM UserNote WHERE user_id=1);
DELETE FROM UserNote WHERE user_id=1;
DELETE FROM Note WHERE note_id in (SELECT note_id FROM NoteCategory WHERE category_id=1);
DELETE FROM NoteCategory WHERE category_id=1;
