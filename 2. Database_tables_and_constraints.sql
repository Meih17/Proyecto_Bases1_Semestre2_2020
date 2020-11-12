CREATE TABLE PB.person
(
  idnumber NUMBER(15) CONSTRAINT person_idnumber_nn NOT NULL, CONSTRAINT pk_person PRIMARY KEY (idnumber),
  Name VARCHAR2(20) CONSTRAINT person_name_nn NOT NULL,
  DateOfBirth VARCHAR2(15) CONSTRAINT person_dateofbirth_nn NOT NULL,
  AGE NUMBER(2) CONSTRAINT person_age_nn NOT NULL,
  Nationality VARCHAR2(20) CONSTRAINT person_nationality_nn NOT NULL,
  PersonPhotoID NUMBER(15), CONSTRAINT fk_person_photo FOREIGN KEY (PersonPhotoID) REFERENCES PB.Photo(PersonPhotoID),
  IDType NUMBER(5), CONSTRAINT fk_person_typeofid FOREIGN KEY (IDType) REFERENCES PB.TypeOfID(IDType),
  AddressID NUMBER(15), fk_person_address FOREIGN KEY (AddressID) REFERENCIES PB.Address(AddressID)
);
