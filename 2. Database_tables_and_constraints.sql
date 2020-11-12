
--Table to store the phone number of people
CREATE TABLE PB.phone
(
  PhoneNumberID NUMBER(10) CONSTRAINT phone_phonenumberid_nn NOT NULL, CONSTRAINT pk_phone PRIMARY KEY(PhoneNumberID),
  PhomeNumber NUMBER(10) CONSTRAINT Phone_phonenumber_nn NOT NULL,
);

-- n to n relation table of phone and person
CREATE TABLE PB.phonexperson
(
  PhoneNumberID NUMBER(10),
  idnumber NUMBER(15),
  CONSTRAINT pk_phonexperson PRIMARY KEY (PhoneNumberID, idnumber),
  CONSTRAINT fk_personxphoto_nn FOREIGN KEY (PhoneNumberID) REFERENCES PB.Phone(PhoneNumberID),
  CONSTRAINT fk_personxphoto_nm FOREIGN KEY (idnumber) REFERENCES PB.Person(idnumber)
);

--Table to store the emails addresses
CREATE TABLE PB.email
(
  IDEmail NUMBER(10) CONSTRAINT email_idemail_nn NOT NULL, CONSTRAINT pk_email PRIMARY KEY (IDEmail),
  EmailAddress VARCHAR2(25) email_emailaddress_nn NOT NULL
);

CREATE TABLE PB.emailxperson
(
  IDEmail NUMBER(10),
  idnumber NUMBER(15),
  CONSTRAINT pk_emailxperson PRIMARY KEY (IDEmail, idnumber),
  CONSTRAINT fk_emailxperson_nn FOREIGN KEY (IDEmail) REFERENCES PB.email(IDEmail),
  CONSTRAINT fk_emailxperson_nm FOREIGN KEY (idnumber) REFERENCES PB.person(idnumber)
);



CREATE TABLE PB.person
(
  idnumber NUMBER(15) CONSTRAINT person_idnumber_nn NOT NULL, CONSTRAINT pk_person PRIMARY KEY (idnumber),
  Name VARCHAR2(20) CONSTRAINT person_name_nn NOT NULL,
  DateOfBirth VARCHAR2(15) CONSTRAINT person_dateofbirth_nn NOT NULL,
  AGE NUMBER(2) CONSTRAINT person_age_nn NOT NULL,
  Nationality VARCHAR2(20) CONSTRAINT person_nationality_nn NOT NULL,
  PersonPhotoID NUMBER(15) CONSTRAINT fk_person_photo FOREIGN KEY (PersonPhotoID) REFERENCES PB.Photo(PersonPhotoID),
  IDType NUMBER(5) CONSTRAINT fk_person_typeofid FOREIGN KEY (IDType) REFERENCES PB.TypeOfID(IDType),
  AddressID NUMBER(15) CONSTRAINT fk_person_address FOREIGN KEY (AddressID) REFERENCES PB.Address(AddressID)
);
