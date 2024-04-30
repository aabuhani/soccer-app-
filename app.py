from flask import Flask, render_template, request, redirect, url_for
from flask_mysqldb import MySQL

app = Flask(__name__)
app.config['MYSQL_HOST'] = '127.0.0.1'
app.config['MYSQL_USER'] = 'root'  # Replace with your MySQL username
app.config['MYSQL_PASSWORD'] = ''  # Replace with your MySQL password
app.config['MYSQL_DB'] = 'soccer'

mysql = MySQL(app)

# Route for the main index page
@app.route('/')
def index():
    return render_template('index.html')

# CRUD operations for coaches
@app.route('/coaches')
def coaches():
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM Coach')
    coaches = cursor.fetchall()
    cursor.close()
    return render_template('coaches.html', coaches=coaches)

@app.route('/coach/add', methods=['GET', 'POST'])
def add_coach():
    if request.method == 'POST':
        firstname = request.form['firstname']
        lastname = request.form['lastname']
        email = request.form['email']
        teamid = request.form.get('teamid')  # Optional team ID
        cursor = mysql.connection.cursor()
        cursor.execute('INSERT INTO Coach (firstname, lastname, email, teamid) VALUES (%s, %s, %s, %s)', (firstname, lastname, email, teamid))
        mysql.connection.commit()
        cursor.close()
        return redirect(url_for('coaches'))
    return render_template('add_coach.html')

# CRUD operations for teams
@app.route('/teams')
def teams():
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM Team')
    teams = cursor.fetchall()
    cursor.close()
    return render_template('teams.html', teams=teams)

@app.route('/team/add', methods=['GET', 'POST'])
def add_team():
    if request.method == 'POST':
        name = request.form['name']
        color = request.form['color']
        cursor = mysql.connection.cursor()
        cursor.execute('INSERT INTO Team (name, color) VALUES (%s, %s)', (name, color))
        mysql.connection.commit()
        cursor.close()
        return redirect(url_for('teams'))
    return render_template('add_team.html')

# CRUD operations for players
@app.route('/players')
def players():
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM Player')
    players = cursor.fetchall()
    cursor.close()
    return render_template('players.html', players=players)

@app.route('/player/add', methods=['GET', 'POST'])
def add_player():
    if request.method == 'POST':
        firstname = request.form['firstname']
        lastname = request.form['lastname']
        birthdate = request.form['birthdate']
        rating = request.form['rating']
        teamid = request.form.get('teamid')  # Optional team ID
        cursor = mysql.connection.cursor()
        cursor.execute('INSERT INTO Player (firstname, lastname, birthdate, rating, teamid) VALUES (%s, %s, %s, %s, %s)', (firstname, lastname, birthdate, rating, teamid))
        mysql.connection.commit()
        cursor.close()
        return redirect(url_for('players'))
    cursor = mysql.connection.cursor()
    cursor.execute('SELECT * FROM teams')
    teams = cursor.fetchall()
    cursor.close()
    return render_template('add_player.html', teams=teams)

if __name__ == '__main__':
    app.run(debug=True)
