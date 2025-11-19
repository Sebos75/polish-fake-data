# polish-fake-data

Polish fake data repository containing example datasets for testing and development purposes.

## Datasets

| Dataset Name | Records | Description |
|-------------|---------|-------------|
| **customers** | 127,342 | Polish companies with names, NIP (tax IDs), addresses |
| **cities** | 3,601 | Polish city names |
| **users** | 383 | User accounts with Polish names, logins, department assignments |
| **departments** | 10 | Standard organizational departments |

## Available Formats

- **CSV** - All datasets available in `csv/` directory
- **Oracle SQL** - Complete export with DDL and data in `oracle/oracle.sql`
- **MySQL** - Directory reserved for MySQL exports
- **PostgreSQL** - Directory reserved for PostgreSQL exports

## Data Schema

- **EXAMPLE_CUSTOMERS** → **EXAMPLE_CITIES** (city_id reference)
- **EXAMPLE_USERS** → **EXAMPLE_DEPARTMENTS** (department_id foreign key)

All data uses UTF-8 encoding to support Polish characters (ą, ć, ę, ł, ń, ó, ś, ź, ż).