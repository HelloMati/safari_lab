DROP TABLE IF EXISTS assignments;
DROP TABLE IF EXISTS animals;
DROP TABLE IF EXISTS staff;
DROP TABLE IF EXISTS enclosures;
CREATE TABLE staff (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    employeenumber INT
);
INSERT INTO staff (name, employeenumber) VALUES ('Smithy', 01);
INSERT INTO staff (name, employeenumber) VALUES ('Jane', 02);
INSERT INTO staff (name, employeenumber) VALUES ('Jason', 03);
INSERT INTO staff (name, employeenumber) VALUES ('Linda', 04);
INSERT INTO staff (name, employeenumber) VALUES ('Arnold', 05);
INSERT INTO staff (name, employeenumber) VALUES ('Mary', 06);
CREATE TABLE enclosures (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    capacity INT,
    closedForMaintenance BOOLEAN
);
INSERT INTO enclosures (name, capacity, closedForMaintenance) VALUES ('Big Cats', 2, false);
INSERT INTO enclosures (name, capacity, closedForMaintenance) VALUES ('Monkeys', 1, true);
INSERT INTO enclosures (name, capacity, closedForMaintenance) VALUES ('Birds', 1, false);
CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    type VARCHAR(50),
    age INT,
    enclosure_id INT REFERENCES enclosures(id)
);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Tigger', 'Tiger', 4, 1);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Mufasa', 'Lion', 3, 1);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('George', 'Monkey', 5, 2);
INSERT INTO animals (name, type, age, enclosure_id) VALUES ('Polly', 'Bird', 4, 3);
CREATE TABLE assignments (
    id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES staff(id),
    enclosure_id INT REFERENCES enclosures(id),
    day VARCHAR(10)
);
INSERT INTO assignments (employee_id, enclosure_id, day) VALUES (01, 1, 'Monday');
INSERT INTO assignments (employee_id, enclosure_id, day) VALUES (02, 1, 'Monday');
INSERT INTO assignments (employee_id, enclosure_id, day) VALUES (03, 2, 'Tuesday');
INSERT INTO assignments (employee_id, enclosure_id, day) VALUES (04, 2, 'Tuesday');
INSERT INTO assignments (employee_id, enclosure_id, day) VALUES (04, 2, 'Wednesday');
INSERT INTO assignments (employee_id, enclosure_id, day) VALUES (04, 2, 'Wednesday');


--mvp
SELECT enclosures.name, animals.name FROM enclosures INNER JOIN animals ON enclosures.id = animals.enclosure_id WHERE enclosures.name = 'Big Cats';

SELECT enclosures.name as enclosure_name, staff.name as staff_name FROM assignments INNER JOIN staff ON assignments.employee_id = staff.id INNER JOIN enclosures ON assignments.enclosure_id = enclosures.id WHERE enclosures.name = 'Big Cats';

