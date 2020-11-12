CREATE TABLE PB.phone
(
  PhoneNumberID NUMBER(10) CONSTRAINT phone_phonenumberid_nn NOT NULL, CONSTRAINT pk_phone PRIMARY KEY(PhoneNumberID),
  PhomeNumber NUMBER(10) CONSTRAINT Phone_phonenumber_nn NOT NULL,
);

CREATE TABLE PB.phonexperson
(
  PhoneNumberID NUMBER(10) CONSTRAINT phonexperson_phonenumberid_nn NOT NULL,
  idnumber NUMBER(15) CONSTRAINT phonexperson_idnumber_nn NOT NULL, CONSTRAINT pk_phonexperson PRIMARY KEY (PhoneNumberID, idnumber),
  CONSTRAINT fk_personxphoto FOREIGN KEY (PhoneNumberID) REFERENCES PB.Phone(PhoneNumberID, idnumber) 
);

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
