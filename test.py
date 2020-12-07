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


@app.route("/earthquakes", methods = ["GET"])
def earthquake():
    if request.method == "GET":
        connection = sqlite3.connect(data)
        cursor = connection.cursor()
        q1 = "SELECT * from Earthquakes"
        result = cursor.execute(q1)
        result = result.fetchall()
        return render_template("earthquake.html", data = result )
    
@app.route("/hurricanes", methods = ["GET"])
def hurricanes():
     if request.method == "GET":
        connection = sqlite3.connect(data)
        cursor = connection.cursor()
        q1 = "SELECT * from Hurricanes"
        result = cursor.execute(q1)
        result = result.fetchall()
        return render_template("hurricanes.html", data = result)

@app.route("/wildfires", methods = ["GET"])
def wildfires():
        if request.method == "GET":
                connection = sqlite3.connect(data)
                cursor = connection.cursor()
                q1 = "SELECT * from Fires"
                result = cursor.execute(q1)
                result = result.fetchall()
                return render_template("wildfires.html", data = result)

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

@app.route("/charts_e", methods=["GET"])
def chartse():
    return render_template("charts_e.html")

@app.route("/charts_e2016", methods=["GET", "POST"])
def chartse2016():
        chart = []
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Earthquakes
                WHERE e_date BETWEEN '1/01/2016' AND '1/31/2016'
                ORDER BY e_date ASC
                """
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        print(chart)
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*), e_date FROM Earthquakes
                WHERE e_date BETWEEN '2/01/2016' AND '2/28/2016'
                ORDER BY e_date ASC
                """
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*), e_date FROM Earthquakes
                WHERE e_date BETWEEN '3/01/2016' AND '3/31/2016'
                ORDER BY e_date ASC"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*), e_date FROM Earthquakes
                WHERE e_date BETWEEN '4/01/2016' AND '4/30/2016'
                ORDER BY e_date ASC"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*), e_date FROM Earthquakes
                WHERE e_date BETWEEN '5/01/2016' AND '5/31/2016'
                ORDER BY e_date ASC"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*), e_date FROM Earthquakes
                WHERE e_date BETWEEN '6/01/2016' AND '6/30/2016'
                ORDER BY e_date ASC"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*), e_date FROM Earthquakes
                WHERE e_date BETWEEN '7/01/2016' AND '7/30/2016'
                ORDER BY e_date ASC"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*), e_date FROM Earthquakes
                WHERE e_date BETWEEN '8/01/2016' AND '8/31/2016'
                ORDER BY e_date ASC"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*), e_date FROM Earthquakes
                WHERE e_date BETWEEN '9/01/2016' AND '9/30/2016'
                ORDER BY e_date ASC"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        L1 = list(chart)
        
        final = []
        
        
        for s in L1:
            final.append(s[0])
            
        print(final)
        if request.method == "POST":
            return jsonify(final)  
        return render_template("charts_e2016.html", data = final)

@app.route("/charts_e2017", methods=["GET", "POST"])
def chartse2017():

        chart = []
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Earthquakes
                WHERE e_date BETWEEN '1/01/2017' AND '1/31/2017'
                ORDER BY e_date ASC
                """
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        print(chart)
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*), e_date FROM Earthquakes
                WHERE e_date BETWEEN '2/01/2017' AND '2/28/2017'
                ORDER BY e_date ASC
                """
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*), e_date FROM Earthquakes
                WHERE e_date BETWEEN '3/01/2017' AND '3/31/2017'
                ORDER BY e_date ASC"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*), e_date FROM Earthquakes
                WHERE e_date BETWEEN '4/01/2017' AND '4/30/2017'
                ORDER BY e_date ASC"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*), e_date FROM Earthquakes
                WHERE e_date BETWEEN '5/01/2017' AND '5/31/2017'
                ORDER BY e_date ASC"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*), e_date FROM Earthquakes
                WHERE e_date BETWEEN '6/01/2017' AND '6/30/2017'
                ORDER BY e_date ASC"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*), e_date FROM Earthquakes
                WHERE e_date BETWEEN '7/01/2017' AND '7/30/2017'
                ORDER BY e_date ASC"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*), e_date FROM Earthquakes
                WHERE e_date BETWEEN '8/01/2017' AND '8/31/2017'
                ORDER BY e_date ASC"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*), e_date FROM Earthquakes
                WHERE e_date BETWEEN '9/01/2017' AND '9/30/2017'
                ORDER BY e_date ASC"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        L1 = list(chart)
        
        final = []
        
        
        for s in L1:
            final.append(s[0])
            
        print(final)
        if request.method == "POST":
            return jsonify(final)  
        return render_template("charts_e2017.html", data = final)

@app.route("/charts_e2018", methods=["GET", "POST"])
def chartse2018():
        chart = []
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Earthquakes
                WHERE e_date BETWEEN '1/01/2018' AND '1/31/2018'
                ORDER BY e_date ASC
                """
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        print(chart)
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*), e_date FROM Earthquakes
                WHERE e_date BETWEEN '2/01/2018' AND '2/28/2018'
                ORDER BY e_date ASC
                """
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*), e_date FROM Earthquakes
                WHERE e_date BETWEEN '3/01/2018' AND '3/31/2018'
                ORDER BY e_date ASC"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*), e_date FROM Earthquakes
                WHERE e_date BETWEEN '4/01/2018' AND '4/30/2018'
                ORDER BY e_date ASC"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*), e_date FROM Earthquakes
                WHERE e_date BETWEEN '5/01/2018' AND '5/31/2018'
                ORDER BY e_date ASC"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*), e_date FROM Earthquakes
                WHERE e_date BETWEEN '6/01/2018' AND '6/30/2018'
                ORDER BY e_date ASC"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*), e_date FROM Earthquakes
                WHERE e_date BETWEEN '7/01/2018' AND '7/30/2018'
                ORDER BY e_date ASC"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*), e_date FROM Earthquakes
                WHERE e_date BETWEEN '8/01/2018' AND '8/31/2018'
                ORDER BY e_date ASC"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*), e_date FROM Earthquakes
                WHERE e_date BETWEEN '9/01/2018' AND '9/30/2018'
                ORDER BY e_date ASC"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        L1 = list(chart)
        
        final = []
        
        
        for s in L1:
            final.append(s[0])
            
        print(final)
        if request.method == "POST":
            return jsonify(final)  
        return render_template("charts_e2018.html", data = final)

@app.route("/charts_h", methods=["GET"])
def chartsh():
    return render_template("charts_h.html")

@app.route("/charts_h2016", methods=["GET", "POST"])
def chartsh2016():
        chart = []
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Hurricanes
                WHERE H_dates BETWEEN '20160822' and '20160830'
                """
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        print(chart)
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Hurricanes
                WHERE H_dates BETWEEN '20160901' and '20160919'
                """
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Hurricanes
                WHERE H_dates BETWEEN '20161006' and '20161031'"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Hurricanes
                WHERE H_dates BETWEEN '20161101' and '20161104'"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        L1 = list(chart)
        
        final = []
        
        
        for s in L1:
            final.append(s[0])
            
        print(final)
        if request.method == "POST":
            return jsonify(final)  
        return render_template("charts_h2016.html", data = final)

@app.route("/charts_h2017", methods=["GET", "POST"])
def chartsh2017():
        
        
        chart = []
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Hurricanes
                WHERE H_dates BETWEEN '20170522' and '20170529'
                """
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        print(chart)
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Hurricanes
                WHERE H_dates BETWEEN '20170601' and '20170630'
                """
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Hurricanes
                WHERE H_dates BETWEEN '20170701' and '20170731'"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Hurricanes
                WHERE H_dates BETWEEN '20170801' and '20170831'"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Hurricanes
                WHERE H_dates BETWEEN '20170901' and '20170930'"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Hurricanes
                WHERE H_dates BETWEEN '20171001' and '20171031'"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Hurricanes
                WHERE H_dates BETWEEN '20171101' and '20171105'"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        L1 = list(chart)
        
        final = []
        
        
        for s in L1:
            final.append(s[0])
            
        print(final)
        if request.method == "POST":
            return jsonify(final)  
        return render_template("charts_h2017.html", data = final)

@app.route("/charts_h2018", methods=["GET", "POST"])
def chartsh2018():
        chart = []
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Hurricanes
                WHERE H_dates BETWEEN '20180528' and '20180531'
                """
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        print(chart)
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Hurricanes
                WHERE H_dates BETWEEN '20180601' and '20180618'
                """
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Hurricanes
                WHERE H_dates BETWEEN '20180707' and '20180731'"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Hurricanes
                WHERE H_dates BETWEEN '20180801' and '20180831'"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Hurricanes
                WHERE H_dates BETWEEN '20180901' and '20180930'"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Hurricanes
                WHERE H_dates BETWEEN '20181009' and '20181028'"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Hurricanes
                WHERE H_dates BETWEEN '20181118' and '20181129'"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        L1 = list(chart)
        
        final = []
        
        
        for s in L1:
            final.append(s[0])
            
        print(final)
        if request.method == "POST":
            return jsonify(final)  
        return render_template("charts_h2018.html", data = final)

@app.route("/charts_f", methods=["GET"])
def chartsf():
    return render_template("charts_f.html")

@app.route("/charts_f2016", methods=["GET", "POST"])
def chartsf2016():
        chart = []
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Fires
                WHERE f_started BETWEEN '2016-04-01' AND '2016-04-30';
                """
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        print(chart)
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Fires
                WHERE f_started BETWEEN '2016-05-01' AND '2016-05-30'
                """
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Fires
                WHERE f_started BETWEEN '2016-06-01' AND '2016-06-30'"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Fires
                WHERE f_started BETWEEN '2016-07-01' AND '2016-07-30'"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Fires
                WHERE f_started BETWEEN '2016-08-01' AND '2016-08-30'"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Fires
                WHERE f_started BETWEEN '2016-09-01' AND '2016-09-30'"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Fires
                WHERE f_started BETWEEN '2016-10-01' AND '2016-10-30'"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Fires
                WHERE f_started BETWEEN '2016-11-01' AND '2016-11-30'"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        L1 = list(chart)
        
        final = []
        
        
        for s in L1:
            final.append(s[0])
            
        print(final)
        if request.method == "POST":
            return jsonify(final)  
        return render_template("charts_f2016.html", data = final)

@app.route("/charts_f2017", methods=["GET", "POST"])
def chartsf2017():
        chart = []
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Fires
                WHERE f_started BETWEEN '2017-04-01' AND '2017-04-30';
                """
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        print(chart)
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Fires
                WHERE f_started BETWEEN '2017-05-01' AND '2017-05-30'
                """
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Fires
                WHERE f_started BETWEEN '2017-06-01' AND '2017-06-30'"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Fires
                WHERE f_started BETWEEN '2017-07-01' AND '2017-07-30'"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Fires
                WHERE f_started BETWEEN '2017-08-01' AND '2017-08-30'"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Fires
                WHERE f_started BETWEEN '2017-09-01' AND '2017-09-30'"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Fires
                WHERE f_started BETWEEN '2017-10-01' AND '2017-10-30'"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Fires
                WHERE f_started BETWEEN '2017-11-01' AND '2017-11-30'"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Fires
                WHERE f_started BETWEEN '2017-12-01' AND '2017-12-30'"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        L1 = list(chart)
        
        final = []
        
        
        for s in L1:
            final.append(s[0])
            
        print(final)
        if request.method == "POST":
            return jsonify(final)  
        return render_template("charts_f2017.html", data = final)

@app.route("/charts_f2018", methods=["GET", "POST"])
def chartsf2018():
        
        
        chart = []
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Fires
                WHERE f_started BETWEEN '2018-01-01' AND '2018-01-30';
                """
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        chart = []
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Fires
                WHERE f_started BETWEEN '2018-02-01' AND '2018-02-30';
                """
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        chart = []
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Fires
                WHERE f_started BETWEEN '2018-03-01' AND '2018-03-30';
                """
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        chart = []
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Fires
                WHERE f_started BETWEEN '2018-04-01' AND '2018-04-30';
                """
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        print(chart)
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Fires
                WHERE f_started BETWEEN '2018-05-01' AND '2018-05-30'
                """
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Fires
                WHERE f_started BETWEEN '2018-06-01' AND '2018-06-30'"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Fires
                WHERE f_started BETWEEN '2018-07-01' AND '2018-07-30'"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Fires
                WHERE f_started BETWEEN '2018-08-01' AND '2018-08-30'"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Fires
                WHERE f_started BETWEEN '2018-09-01' AND '2018-09-29'"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Fires
                WHERE f_started BETWEEN '2018-10-01' AND '2018-10-30'"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Fires
                WHERE f_started BETWEEN '2018-11-01' AND '2018-11-30'"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Fires
                WHERE f_started BETWEEN '2018-12-01' AND '2018-12-30'"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        L1 = list(chart)
        
        final = []
        
        
        for s in L1:
            final.append(s[0])
            
        print(final)
        if request.method == "POST":
            return jsonify(final)  
        return render_template("charts_f2018.html", data = final)

@app.route("/charts_s", methods=["GET"])
def chartss():
    return render_template("charts_s.html")

@app.route("/charts_s2016", methods=["GET", "POST"])
def chartss2018():
        
        
        chart = []
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Fires
                WHERE f_started BETWEEN '2018-01-01' AND '2018-01-30';
                """
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        chart = []
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Fires
                WHERE f_started BETWEEN '2018-02-01' AND '2018-02-30';
                """
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        chart = []
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Fires
                WHERE f_started BETWEEN '2018-03-01' AND '2018-03-30';
                """
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        chart = []
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Fires
                WHERE f_started BETWEEN '2018-04-01' AND '2018-04-30';
                """
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        print(chart)
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Fires
                WHERE f_started BETWEEN '2018-05-01' AND '2018-05-30'
                """
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Fires
                WHERE f_started BETWEEN '2018-06-01' AND '2018-06-30'"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Fires
                WHERE f_started BETWEEN '2018-07-01' AND '2018-07-30'"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Fires
                WHERE f_started BETWEEN '2018-08-01' AND '2018-08-30'"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Fires
                WHERE f_started BETWEEN '2018-09-01' AND '2018-09-29'"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Fires
                WHERE f_started BETWEEN '2018-10-01' AND '2018-10-30'"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Fires
                WHERE f_started BETWEEN '2018-11-01' AND '2018-11-30'"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        connection = sqlite3.connect(data)
        cur = connection.cursor()
        sql = """SELECT COUNT(*) FROM Fires
                WHERE f_started BETWEEN '2018-12-01' AND '2018-12-30'"""
        result = cur.execute(sql)
        result = result.fetchall()
        chart.append(result[0])
        
        L1 = list(chart)
        
        final = []
        
        
        for s in L1:
            final.append(s[0])
            
        print(final)
        if request.method == "POST":
            return jsonify(final)  
        return render_template("charts_f2018.html", data = final)


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
