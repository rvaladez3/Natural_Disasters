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


@app.route("/", methods=["GET"])
def home():
    if request.method == "GET":
        Usr = request.args.get("Query")
        if Usr == "One":
            connection = sqlite3.connect(data)
            cur = connection.cursor()
            sql = """SELECT DISTINCT f_counties, substr(f_started, 1,4) AS Year, COUNT(*) as Fire_Count
                     FROM Fires
                     GROUP BY f_counties, substr(f_started, 1,4)
                     ORDER BY substr(f_started, 1,4)
                     """
            result = cur.execute(sql)
            result = result.fetchall()
            for res in result:
                print(res)
            return render_template("index.html", result=result)
        if Usr == "Two":
            connection = sqlite3.connect(data)
            cur = connection.cursor()
            sql = """SELECT f_counties, f_location, MAX(f_acresBurned) as Burned
                    FROM Fires
                    GROUP BY f_counties
                     """
            result1 = cur.execute(sql)
            result1 = result1.fetchall()
            return render_template("index.html", result1=result1)
        if Usr == "Three":
            connection = sqlite3.connect(data)
            cur = connection.cursor()
            sql = """SELECT e_date, COUNT(*) as Tremors
                    FROM Earthquakes
                    GROUP BY e_date
                    HAVING Tremors > 2
                     """
            result2 = cur.execute(sql)
            result2 = result2.fetchall()
            return render_template("index.html", result2=result2)
        if Usr == "Four":
            connection = sqlite3.connect(data)
            cur = connection.cursor()
            sql = """SELECT wd_state, substr(wd_declarationDate, 1,4) as YEAR, COUNT(DISTINCT wd_incidentType) as Types_of_WD
                    FROM WorldDisaster
                    GROUP BY substr(wd_declarationDate, 1,4), wd_state
                    HAVING Types_of_WD > 1
                     """
            result3 = cur.execute(sql)
            result3 = result3.fetchall()
            return render_template("index.html", result3=result3)
        if Usr == "Five":
            connection = sqlite3.connect(data)
            cur = connection.cursor()
            sql = """SELECT e_earthquakeIdNum, e_date, f_fireIdNum, f_counties
                     FROM Earthquakes, Fires
                     WHERE substr(e_longitude, 1, 4) LIKE substr(f_longitude, 1, 4)
                     """
            result4 = cur.execute(sql)
            result4 = result4.fetchall()
            return render_template("index.html", result4=result4)
        if Usr == "Six":
            connection = sqlite3.connect(data)
            cur = connection.cursor()
            sql = """SELECT  e_earthquakeIdNum, e_date, e_time, f_fireIdNum, f_counties, f_started
                    FROM Earthquakes, Fires
                    WHERE substr(e_date,6,9)  LIKE substr(f_started, 1,4)
                    AND substr(substr(e_date, 3,3),1,2) = substr(substr(f_started, 5,6), 2,2)
                     """
            result5 = cur.execute(sql)
            result5 = result5.fetchall()
            return render_template("index.html", result5=result5)
        return render_template("index.html")
    else:
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
    if request.method == "GET":
        print(request.args.get("lat"))
        print(request.args.get("long"))
        lat = request.args.get("lat")
        lat = lat
        long = request.args.get("long")
        cords = [lat, long]
        print(cords)
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql1 = (
            "SELECT * FROM Sources WHERE S_latitude LIKE (?) AND S_longitude LIKE (?)"
        )
        result1 = cur.execute(sql1, cords)
        result1 = result1.fetchall()

        sql2 = "SELECT * FROM Earthquakes WHERE e_latitude LIKE (?) AND e_longitude LIKE (?)"
        result2 = cur.execute(sql2, cords)
        result2 = result2.fetchall()

        sql3 = "SELECT * FROM Fires WHERE f_latitude LIKE (?) AND f_longitude LIKE (?)"
        result3 = cur.execute(sql3, cords)
        result3 = result3.fetchall()

        sql4 = "SELECT * FROM Fires WHERE f_latitude LIKE (?) AND f_longitude LIKE (?)"
        result4 = cur.execute(sql4, cords)
        result4 = result4.fetchall()

        sql5 = "SELECT * FROM Hurricanes WHERE H_latitude LIKE (?) AND H_longitude LIKE (?)"
        result5 = cur.execute(sql5, cords)
        result5 = result5.fetchall()

        sql6 = "SELECT * FROM Waves WHERE W_distanceFromSource LIKE (?) AND W_travelTimeHOurs LIKE (?)"
        result6 = cur.execute(sql6, cords)
        result6 = result6.fetchall()

        return render_template(
            "Dnearby.html",
            result1=result1,
            result2=result2,
            result3=result3,
            result4=result4,
            result5=result5,
            result6=result6,
        )
    else:
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
    return render_template("winfo.html", result=result)


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
