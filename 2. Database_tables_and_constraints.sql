CREATE TABLE PB.person
(
  idnumber NUMBER(15) CONSTRAINT person_idnumber_nn NOT NULL,
  Name VARCHAR2(20) CONSTRAINT person_name_nn NOT NULL,
  DateOfBirth VARCHAR2(15) CONSTRAINT person_dateofbirth_nn NOT NULL,
  AGE NUMBER(2) CONSTRAINT person_age_nn NOT NULL,
  Nationality VARCHAR2(20) CONSTRAINT person_nationality_nn NOT NULL,
  PersonPhotoID NUMBER(15),
  IDType NUMBER(5),
  AddressID NUMBER(15),
);
