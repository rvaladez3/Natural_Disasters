from flask import (
    Flask,
    redirect,
    url_for,
    render_template,
    request,
    session,
    flash,
    jsonify,
)
import sqlite3
from sqlite3 import Error
import os
from flask_bootstrap import Bootstrap

currentDirectory = os.path.dirname(os.path.abspath(__file__))
data = currentDirectory + "/Database/data.db"
users = currentDirectory + "/users.sqlite3"


app = Flask(__name__)
Bootstrap(app)


@app.route("/")
def home():

    return render_template("index.html")


@app.route("/login", methods=["POST", "GET"])
def login():
    if request.method == "POST":
        # this is used to stores data as a dictionary
        connection = sqlite3.connect(users)
        try:
            name = request.form("nm")
            email = request.form("email")
            usr = [(name, email)]

            cur = connection.cursor()
            sql = "INSERT INTO Users(name, email) Values (?, ?)"
            cur.execute(sql, usr)
            connection.commit()
            return redirect("/usr")
        except:
            return "Error Encounterd"
    else:
        connection = sqlite3.connect(users)
        cur = connection.cursor()
        sql = "SELECT * FROM USERS"
        result = cur.execute(sql)
        result = result.fetchall()
        for res in result:
            print(res)
        return render_template("login.html", result=result)


# @app.route("/earthquake", methods=["POST", "GET"])

# def earthquake():
#     if request.method == "POST":
#         user = request.form["nm"]
#         if user == "earthquake":
#             return redirect(url_for("user", usr = user))
#     else:
#         return render_template("login.html")


# below is for users


@app.route("/Dnearby", methods=["GET"])
def Dnearby():
    # this is used to stores data as a dictionary
    return render_template("Dnearby.html")


@app.route("/disasters", methods=["GET"])
def user():
    return render_template("disasters.html")


# each disaster has their own webpage to display their own tables


@app.route("/earthquakes", methods=["GET"])
def earthquake():

    return render_template("earthquake.html")


@app.route("/hurricanes", methods=["GET"])
def hurricanes():
    return render_template("hurricanes.html")


@app.route("/wildfires", methods=["GET"])
def wildfires():
    return render_template("wildfires.html")


@app.route("/wsources", methods=["GET"])
def wsources():
    connection = sqlite3.connect(data)
    cur = connection.cursor()
    sql = "SELECT * FROM Sources"
    result = cur.execute(sql)
    result = result.fetchall()
    return render_template("wsources.html", result=result)


@app.route("/winfo", methods=["GET"])
def winfo():
    connection = sqlite3.connect(data)
    cur = connection.cursor()
    sql = "SELECT * FROM Waves"
    result = cur.execute(sql)
    result = result.fetchall()
    return render_template("winfo.html", result = result)


@app.route("/WD", methods=["GET"])
def WD():
    connection = sqlite3.connect(data)
    cur = connection.cursor()
    sql = "SELECT * FROM WorldDisaster"
    result = cur.execute(sql)
    result = result.fetchall()
    return render_template("WD.html", result=result)


@app.route("/charts", methods=["GET"])
def charts():
    return render_template("charts.html")


@app.route("/usr")
def usr():
    return render_template("user.html")


@app.route("/usr/<name>")
def usrs(name):
    return render_template("user.html", name=name)


@app.route("/logout")
def logout():
    session.pop("user", None)
    session.pop("email", None)
    flash("you have been logged out!", "info")
    return redirect(url_for("login"))


if __name__ == "__main__":
    # db.creat_all()
    app.run(debug=True)
