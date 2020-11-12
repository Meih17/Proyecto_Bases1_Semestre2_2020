
--Table to store the phone number of people
CREATE TABLE PB.phone
(
  PhoneNumberID NUMBER(10) CONSTRAINT phone_phonenumberid_nn NOT NULL, CONSTRAINT pk_phone PRIMARY KEY(PhoneNumberID),
  PhomeNumber NUMBER(10) CONSTRAINT Phone_phonenumber_nn NOT NULL,
);

--Table to store the emails addresses
CREATE TABLE PB.email
(
  IDEmail NUMBER(10) CONSTRAINT email_idemail_nn NOT NULL, CONSTRAINT pk_email PRIMARY KEY (IDEmail),
  EmailAddress VARCHAR2(25) email_emailaddress_nn NOT NULL
);

--Table to store some photos of people
CREATE TABLE PB.Photo
(
  PersonPhotoID number(10) CONSTRAINT photo_personphotoid_nn NOT NULL, CONSTRAINT pk_photo PRIMARY KEY (PersonPhotoID),
  PersonPhotoFile VARCHAR2(20) CONSTRAINT photo_personphotofile_nn NOT NULL
);

--Country table from Address
CREATE TABLE PB.Country
(
  CountryID NUMBER(10) CONSTRAINT country_countryid_nn NOT NULL, CONSTRAINT pk_country PRIMARY KEY (CountryID),
  CountryName VARCHAR2(25) CONSTRAINT country_countryname_nn NOT NULL
);

--Province table from Address
CREATE TABLE PB.Province
(
  ProvinceID NUMBER(10) CONSTRAINT province_provinceid_nn NOT NULL, CONSTRAINT pk_province PRIMARY KEY (ProvinceID),
  ProvinceName VARCHAR2(25) CONSTRAINT province_provincename_nn NOT NULL
);

--City table from Address
CREATE TABLE PB.City
(
  CityID NUMBER(10) CONSTRAINT city_cityid_nn NOT NULL, CONSTRAINT pk_city PRIMARY KEY (CityID),
  CityName VARCHAR2(25) CONSTRAINT city_cityname_nn NOT NULL
);

--Table to store the person Addressess
CREATE TABLE PB.Address
(
  AddressID NUMBER(10), CONSTRAINT address_addressid_nn NOT NULL, CONSTRAINT pk_address PRIMARY KEY (AddressID),
  ZIP VARCHAR2(10), CONSTRAINT address_zip_nn NOT NULL
  CountryID NUMBER(10) CONSTRAINT fk_address_country FOREIGN KEY (CountryID) REFERENCES PB.Country(CountryID),
  ProvinceID NUMBER(10) CONSTRAINT fk_address_province FOREIGN KEY (ProvinceID) REFERENCES PB.Province(ProvinceID),
  CityID NUMBER(10) CONSTRAINT fk_address_city FOREIGN KEY (CityID) REFERENCES PB.City(CityID)
);

--type of id table
CREATE TABLE PB.TypeOfID
(
  IDType NUMBER(10) CONSTRAINT typeofid_idtype_nn NOT NULL, CONSTRAINT pk_typeofid PRIMARY KEY (IDType),
  Description VARCHAR2(20) CONSTRAINT typeofid_description_nn NOT NULL 
);

--main table person to store people information
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

-- n to n relation table of phone and person
CREATE TABLE PB.phonexperson
(
  PhoneNumberID NUMBER(10),
  idnumber NUMBER(15),
  CONSTRAINT pk_phonexperson PRIMARY KEY (PhoneNumberID, idnumber),
  CONSTRAINT fk_phonexperson_nn FOREIGN KEY (PhoneNumberID) REFERENCES PB.Phone(PhoneNumberID),
  CONSTRAINT fk_phonexperson_nm FOREIGN KEY (idnumber) REFERENCES PB.Person(idnumber)
);

--n to n relation table of email and person
CREATE TABLE PB.emailxperson
(
  IDEmail NUMBER(10),
  idnumber NUMBER(15),
  CONSTRAINT pk_emailxperson PRIMARY KEY (IDEmail, idnumber),
  CONSTRAINT fk_emailxperson_nn FOREIGN KEY (IDEmail) REFERENCES PB.email(IDEmail),
  CONSTRAINT fk_emailxperson_nm FOREIGN KEY (idnumber) REFERENCES PB.person(idnumber)
);
