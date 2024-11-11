CREATE TABLE Contacts (
    contact_id INT PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    email VARCHAR NOT NULL
);

CREATE TABLE Categories (
    category_id VARCHAR PRIMARY KEY,
    category VARCHAR NOT NULL
);

CREATE TABLE Subcategories (
    subcategory_id VARCHAR PRIMARY KEY,
    subcategory VARCHAR NOT NULL
);

CREATE TABLE Campaigns (
    cf_id INT PRIMARY KEY,
    contact_id INT NOT NULL,
	FOREIGN KEY (contact_id) REFERENCES Contacts (contact_id),
    company_name VARCHAR NOT NULL,
    description VARCHAR,
    goal DECIMAL(10,2),
    pledged DECIMAL(10,2),
    outcome VARCHAR  NOT NULL,
    backers_count INT,
    country VARCHAR NOT NULL,
    currency VARCHAR NOT NULL,
    launched_date DATE,
    end_date DATE,
    category_id VARCHAR NOT NULL,
	FOREIGN KEY (category_id) REFERENCES Categories (category_id),
    subcategory_id VARCHAR NOT NULL,
	FOREIGN KEY (subcategory_id) REFERENCES Subcategories (subcategory_id)
);