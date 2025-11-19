# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

This is a Polish fake data repository containing example datasets for testing and development purposes. The data includes Polish companies, users, cities, and organizational structures with realistic Polish names, addresses, and tax identification numbers (NIP).

## Repository Structure

```
examples-data/
├── csv/              # CSV format datasets
├── oracle/           # Oracle SQL export with DDL and data
├── mysql/            # MySQL exports (currently empty)
└── postgres/         # PostgreSQL exports (currently empty)
```

## Data Schema

The repository contains four related tables:

### EXAMPLE_CITIES
- `ID` (NUMBER): City identifier
- `NAME` (VARCHAR2): Polish city name
- Contains ~900 Polish cities

### EXAMPLE_DEPARTMENTS
- `ID` (NUMBER, PRIMARY KEY): Department identifier
- `NAME` (VARCHAR2): Department name in English
- 10 standard departments (IT, HR, Sales, Marketing, Finance, Customer Service, R&D, Operations, Legal)

### EXAMPLE_USERS
- `ID` (NUMBER): User identifier
- `LOGIN` (VARCHAR2): User login/username
- `IMIE` (VARCHAR2): First name (Polish)
- `NAZWISKO` (VARCHAR2): Last name (Polish)
- `DEPARTMENT_ID` (NUMBER): Foreign key to EXAMPLE_DEPARTMENTS
- Contains ~850 users with Polish names
- FK constraint: `FK_USERS_EXAMPLE_DEPT` references EXAMPLE_DEPARTMENTS(ID)

### EXAMPLE_CUSTOMERS
- `ID` (NUMBER): Customer identifier
- `NAME` (VARCHAR2): Short company name
- `FULL_NAME` (VARCHAR2): Full company name (often includes legal entity type like "Sp. z o.o.")
- `NIP` (VARCHAR2): Polish tax identification number (10 digits)
- `CITY_ID` (NUMBER): Reference to EXAMPLE_CITIES
- `POST_CODE` (VARCHAR2): Polish postal code format (XX-XXX)
- Contains ~100,000 customer records

## Data Formats

### CSV Files
All CSV files use:
- Comma delimiter
- Double-quote text qualifier
- Header row with column names
- UTF-8 encoding (Polish characters: ą, ć, ę, ł, ń, ó, ś, ź, ż)

### Oracle SQL File
The `oracle/oracle.sql` file (~21MB, 250k+ lines) contains:
- DDL statements for table creation
- INSERT statements for all data
- Index definitions
- Constraint definitions (NOT NULL, PRIMARY KEY, FOREIGN KEY)
- Created using Oracle Data Pump or SQL Developer export

## Working with the Data

### Loading into Oracle
```sql
-- Connect to Oracle database
sqlplus username/password@database

-- Run the complete export
@oracle/oracle.sql
```

### Loading CSV into any database
Use standard CSV import tools for your database platform:
- PostgreSQL: `COPY` command
- MySQL: `LOAD DATA INFILE`
- SQL Server: `BULK INSERT`
- Python: pandas `read_csv()` and database connectors

### Common Queries

Example queries for testing:

```sql
-- Users by department
SELECT d.NAME, COUNT(u.ID) as user_count
FROM EXAMPLE_DEPARTMENTS d
LEFT JOIN EXAMPLE_USERS u ON d.ID = u.DEPARTMENT_ID
GROUP BY d.NAME;

-- Customers by city
SELECT c.NAME, COUNT(cu.ID) as customer_count
FROM EXAMPLE_CITIES c
LEFT JOIN EXAMPLE_CUSTOMERS cu ON c.ID = cu.CITY_ID
GROUP BY c.NAME
ORDER BY customer_count DESC;

-- Find customers with NIP
SELECT * FROM EXAMPLE_CUSTOMERS WHERE NIP IS NOT NULL AND NIP != '';
```

## Data Characteristics

- **Language**: Polish (names, addresses, company names)
- **Realism**: Data follows Polish naming conventions and legal entity structures
- **Company Types**: Includes various Polish legal forms (Sp. z o.o., Przedsiębiorstwo)
- **NIP Format**: 10-digit Polish tax IDs (some records may have empty NIP)
- **Postal Codes**: Polish format XX-XXX
- **Data Volume**: ~100k customers, ~850 users, ~900 cities, 10 departments

## Character Encoding

All files use UTF-8 to properly handle Polish diacritical characters. When importing or exporting, ensure UTF-8 encoding is maintained to avoid character corruption.
