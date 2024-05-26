CREATE TABLE Patient(
email varchar(50) PRIMARY KEY,
password varchar(30) NOT NULL,
name varchar(50) NOT NULL,
address varchar(60) NOT NULL,
gender VARCHAR(20) NOT NULL
);

CREATE TABLE MedicalHistory(
id int PRIMARY KEY,
date int NOT NULL,
conditions VARCHAR(100) NOT NULL, 
surgeries VARCHAR(100) NOT NULL, 
medication VARCHAR(100) NOT NULL
);

drop table MedicalHistory

CREATE TABLE Doctor(
email varchar(50) PRIMARY KEY,
gender varchar(20) NOT NULL,
password varchar(30) NOT NULL,
name varchar(50) NOT NULL
);

create table appointment(
id int primary key,
date DATE NOT NULL,
starttime time not null,
endtime time not null,
status varchar(15) not null
)

create table PatientsAttendInterviews(
patient varchar(50) not null,
appt int not null,
concerns varchar(40) not null,
symptoms varchar(40) not null,
foreign key (patient) references patient(email) on delete cascade,
foreign key(appt) references appointment(id) on delete cascade,
primary key (patient, appt)
)



create table schedule(
id int primary key not null,
starttime time not null,
endtime time not null,
breaktime time not null, 
day varchar(20) not null,
)

drop table PatientFillHistory

create table PatientsFillHistory(
patient varchar(50) not null,
history int not null,
foreign key(patient) references patient(email) on delete cascade,
foreign key(history) references MedicalHistory(id) on delete cascade,)

Create table Diagnose(
appt int not null,
doctor varchar(50) not null,
diagnoses varchar(40) not null,
presciption varchar(40) not null, 
foreign key (appt) references appointment (id) on delete cascade,
foreign key (doctor) references Doctor (email) on delete cascade,
primary key (appt, doctor)
)

create table DocsHaveSchedules(
sched int not null,
doctor varchar(50) not null,
foreign key (sched) references schedule(id) on delete cascade,
foreign key (doctor) references Doctor (email) on delete cascade,
primary key (sched, doctor)
);

create table DocsViewHistory(
history int not null,
doctor varchar(50) not null,
foreign key (doctor) references Doctor(email) on delete cascade,
foreign key (history) references MedicalHistory (id) on delete cascade,
primary key(doctor, history)
)

--*************************** INSERT DATA INTO TABLES ****************************************************

INSERT INTO Patient(email,password,name,address,gender)
VALUES
('ramesh@gmail.com','hrishikesh13','Ramesh','Tamil Nadu', 'male'),
('suresh@gmail.com','hrishikesh13','Suresh','Karnataka', 'male'),
('rakesh@gmail.com','hrishikesh13','Rakesh','Gujarat', 'male')
;

INSERT INTO Doctor(email, gender, password, name)
VALUES
('hathalye7@gmail.com', 'male', 'hrishikesh13', 'Hrishikesh Athalye'),
('hathalye8@gmail.com', 'male', 'hrishikesh13', 'Hrishikesh Athalye')
;


INSERT INTO PatientsAttendAppointments(patient,appt,concerns,symptoms)
VALUES
('ramesh@gmail.com',1, 'none', 'itchy throat'),
('suresh@gmail.com',2, 'infection', 'fever'),
('rakesh@gmail.com',3, 'nausea', 'fever')
;



INSERT INTO PatientsFillHistory(patient,history)
VALUES
('ramesh@gmail.com', 1),
('suresh@gmail.com', 2),
('rakesh@gmail.com', 3)
;
select * from patient