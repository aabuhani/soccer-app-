# Soccer Management System

This is a simple web application built with Flask that allows users to manage soccer teams, coaches, and players.

## Features

- View a list of coaches
- Add a new coach
- View a list of teams
- Add a new team
- View a list of players
- Add a new player

## Prerequisites

Before running this application, make sure you have the following installed:

- Python 3
- Flask
- Flask-MySQLdb
- MySQL server

## Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/your_username/soccer-management.git
    ```

2. Navigate to the project directory:

    ```bash
    cd soccer-management
    ```

3. Install the required dependencies:

    ```bash
    pip install -r requirements.txt
    ```

4. Import the `soccer.sql` file into your MySQL database to create the necessary tables and seed data.

## Configuration

1. Open `app.py` and update the MySQL database configuration with your own database credentials:

    ```python
    app.config['MYSQL_HOST'] = '127.0.0.1'
    app.config['MYSQL_USER'] = 'root'
    app.config['MYSQL_PASSWORD'] = 'your_password'
    app.config['MYSQL_DB'] = 'soccer'
    ```

2. Make sure your MySQL server is running.

## Usage

Run the Flask application:

```bash
python app.py
