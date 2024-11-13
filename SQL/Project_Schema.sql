-- Create a table to store the Contacts data.
CREATE TABLE Contacts (
    contact_id INT PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    email VARCHAR NOT NULL
	CHECK (email LIKE '%@%')
);

-- Create a table to store the Categories data.
CREATE TABLE Categories (
    category_id VARCHAR PRIMARY KEY,
    category VARCHAR NOT NULL
	CHECK (category_id LIKE 'cat%')
);

-- Create a table to store the Subcategories data.
CREATE TABLE Subcategories (
    subcategory_id VARCHAR PRIMARY KEY,
    subcategory VARCHAR NOT NULL
	CHECK (subcategory_id LIKE 'subcat%')
);

-- Create a table to store the Campaigns data.
CREATE TABLE Campaigns (
    cf_id INT PRIMARY KEY,
    contact_id INT NOT NULL,
	FOREIGN KEY (contact_id) REFERENCES Contacts (contact_id),
    company_name VARCHAR NOT NULL,
    description VARCHAR,
    goal DECIMAL(10,2),
    pledged DECIMAL(10,2),
    outcome VARCHAR NOT NULL
	CHECK (outcome = 'failed' 
		  	OR outcome = 'successful'
		  	OR outcome = 'live'
		  	OR outcome = 'canceled'),
    backers_count INT,
    country VARCHAR(2) NOT NULL,
    currency VARCHAR(3) NOT NULL,
    launched_date DATE,
    end_date DATE,
    category_id VARCHAR NOT NULL
	CHECK (category_id LIKE 'cat%'),
	FOREIGN KEY (category_id) REFERENCES Categories (category_id),
    subcategory_id VARCHAR NOT NULL
	CHECK (subcategory_id LIKE 'subcat%'),
	FOREIGN KEY (subcategory_id) REFERENCES Subcategories (subcategory_id)
);

-- Select tables individually to ensure creation.
SELECT * FROM Contacts;
SELECT * FROM Categories;
SELECT * FROM Subcategories;
SELECT * FROM Campaigns;