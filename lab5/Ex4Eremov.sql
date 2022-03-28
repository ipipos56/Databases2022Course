CREATE TABLE Car (
  carId INTEGER NOT NULL PRIMARY KEY,
  description TEXT,
  serialNumber TEXT NOT NULL,
  salesperson INTEGER NOT NULL REFERENCES Salesperson(salespersonId),
  customer INTEGER REFERENCES Customer(customerId)
);

CREATE TABLE Salesperson (
  salespersonId INTEGER NOT NULL PRIMARY KEY
);

CREATE TABLE Customer (
  customerId INTEGER NOT NULL PRIMARY KEY
);

CREATE TABLE Invoice (
  invoiceId INTEGER NOT NULL PRIMARY KEY
  customer INTEGER REFERENCES Customer(customerId)
);

CREATE TABLE Ticket (
  ticketId INTEGER NOT NULL PRIMARY KEY
  customer INTEGER REFERENCES Customer(customerId),
  car INTEGER REFERENCES Car(carId)
);

CREATE TABLE ServiceParts (
  servicepartsId INTEGER NOT NULL PRIMARY KEY,
  serviceworks INTEGER REFERENCES ServiceWorks(serviceworkId),
  description TEXT,
  isDone BOOL
);

CREATE TABLE ServiceWorks (
  serviceworkId INTEGER NOT NULL PRIMARY KEY,
  car INTEGER REFERENCES Car(carId),
  description TEXT,
  isDone BOOL
);

CREATE TABLE Mechanic (
  mechanicId INTEGER NOT NULL PRIMARY KEY,
  name TEXT,
  surname TEXT
);


CREATE TABLE MechanicsAndCars (
  serviceworks INTEGER REFERENCES ServiceWorks(serviceworkId),
  mechanic INTEGER REFERENCES Mechanic(mechanicId),
  description TEXT,
  isDone BOOL
);