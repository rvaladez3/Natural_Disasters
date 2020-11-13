from flask import Flask, redirect, url_for, render_template
# # THE REDIRECT WILL ALLOW US TO REDIRECT THE USER TO APPROPIATE PAGES
# # THE URL_FOR MAKES IT EASIER TO WRITE THE REDIRECTS

# app = Flask(__name__)

# # CREATING THE ROUTES FOR THE DIFFERENT PAGES


# @app.route("/")
# def home():
#     return "HELLO WORLD <h2> USING html </h2>"


# # THE "<>" NOTATION WHATEVER I TYPE IT WILL PASS IT AS A PARAMETER
# # TO THE NAME


# @app.route("/<name>")
# def user(name):
#     return f"Hello {name}"


# @app.route("/admin")
# def admin():
#     return redirect(url_for("home"))


# if __name__ == "__main__":
#     app.run()


# VIDEO TWO(HTML TEMPLATES)

# render_template allows us to use html files for the set of each website

# app = Flask(__name__)


# BRINGing IN THE index.html file
# s
# @app.route("/test")
# def test():
#     return render_template("new.html")


# NOW we are goin to return the url for user and pass arg in admin
# @app.route("/admin")
# def admin():
#     return redirect(url_for("user", name="Admin!"))


# USING "DEBUG = TRUE" WILL RERUN THE PROGRAM EVERY TIME THERE IS A SAVED CHANGE

# if __name__ == "__main__":
#     app.run(debug=True)


# VIDEO 3 WILL BE ADDDING IN BOOTSTRAP AND TEMPLATE INHERITANCE

# VIDEO 4

# from flask import Flask, redirect, url_for, render_template, request

# app = Flask(__name__)


# @app.route("/")
# def home():
#     return render_template("index.html")

# ON DEFAULT ALL USER REQUEST WILL BE GET REQUEST BUT THERE ARE WAYS TO MAKE THEM POST AND UPDATE

# HERE WE ARE CHECKING IF WHETHER OR NOT THORUGH THE LOGIN.HTML IF THE REQUEST WAS A POST
# USING THE NAME OF FORM BEING FILLED AS AN ARGUMENT


# @app.route("/login", methods=["POST", "GET"])
# def login():
#     if request.method == "POST":
#         user = request.form["nm"]
#         return redirect(url_for("user", usr=user))
#     else:
#         return render_template("Login.html")


# @app.route("/<usr>")
# def user(usr):
#     return "<h1>{usr}</h1>"

# VIDEO 5 SESSIONS

# Sessions are something you'll load in and then as soon as they leave it will dissapear
# They are temporary
# if __name__ == "__main__":
#     app.run(debug=True)


# from flask import Flask, redirect, url_for, render_template, request, session
# from datetime import timedelta


# app = Flask(__name__)
# app.secret_key = "hello"
# # This is how long we can store our permanent session data this case 5 days
# app.permanent_session_lifetime = timedelta(days=5)


# @app.route("/")
# def home():
#     return render_template("index.html")


# @app.route("/login", methods=["POST", "GET"])
# def login():
#     if request.method == "POST":
#         session.permanent = True
#         user = request.form["nm"]
#         # Session data based on what they input
#         session["user"] = user
#         return redirect(url_for("user", usr=user))
#     else:
#         if "user" in session:
#             return redirect(url_for("user"))
#         return render_template("Login.html")


# @app.route("/user")
# def user():
#     if "user" in session:
#         user = session["user"]
#         return "<h1>{user}</h1>"
#     else:
#         return redirect(url_for("login"))


# @app.route("/logout")
# def logout():
#     session.pop("user", None)
#     return redirect(url_for("login"))


# if __name__ == "__main__":
#     app.run(debug=True)


# Video 6 Message Flashing
# Showing on the previous page to the current page

# from flask import Flask, redirect, url_for, render_template, request, session, flash
# from datetime import timedelta


# app = Flask(__name__)
# app.secret_key = "hello"
# # This is how long we can store our permanent session data this case 5 days
# app.permanent_session_lifetime = timedelta(days=5)


# @app.route("/")
# def home():
#     return render_template("index.html")


# @app.route("/login", methods=["POST", "GET"])
# def login():
#     if request.method == "POST":
#         session.permanent = True
#         user = request.form["nm"]
#         # Session data based on what they input
#         session["user"] = user
#         flash("LOGIN SUCCESSFUL")
#         return redirect(url_for("user", usr=user))

#     else:
#         if "user" in session:
#             flash("Already Logged IN")
#             return redirect(url_for("user"))
#         return render_template("Login.html")


# @app.route("/user")
# def user():
#     if "user" in session:
#         user = session["user"]
#         return render_template("user.html")
#     else:
#         return redirect(url_for("login"))


# @app.route("/logout")
# def logout():
#     flash("YOU HAVE BEEN LOGGED OUT", "info")
#     session.pop("user", None)
#     return redirect(url_for("login"))


# if __name__ == "__main__":
#     app.run(debug=True)


# VIDEO 7 USING SQLALCHEMY DATABASE

from flask import Flask, redirect, url_for, render_template, request, session, flash
from datetime import timedelta
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.secret_key = "hello"
# configurations so the database can be used
app.config["SQLALCHEMY_DATABASE_URI"] = 'sqlite:///users.sqlite3'
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
# This is how long we can store our permanent session data this case 5 days
app.permanent_session_lifetime = timedelta(days=5)

db = SQLAlchemy(app)

# Uses a database model


class users(db.Model):
    _id = db.Column("id", db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    email = db.Column(db.String(100), nullable=False)

    def __init__(self, name, email):
        self.name = name
        self.email = email


@app.route("/")
def home():
    return render_template("index.html")


@app.route("/view")
def view():
    return render_template("view.html", values=users.query.all())


@app.route("/login", methods=["POST", "GET"])
def login():
    if request.method == "POST":
        session.permanent = True
        user = request.form["nm"]
        # Session data based on what they input
        session["user"] = user

        # This will query the data base to find the user that is tryint to login again. And only returns the first one.
        found_user = users.query.filter_by(name=user).first()

        for user in found_user:
            user.delete()
        if found_user:
            session["email"] = found_user.email
        else:
            usr = users(user, "")
            db.session.add(usr)
            db.session.commit()

        flash("LOGIN SUCCESSFUL")
        return redirect(url_for("user"))
    else:
        if "user" in session:
            flash("Already Logged IN")
            return redirect(url_for("user"))
        return render_template("Login.html")


@ app.route("/user", methods=["POST", "GET"])
def user():
    email = None
    if "user" in session:
        user = session["user"]

        if request.method == "POST":
            email = request.form["email"]
            session["email"] = email
            found_user = users.query.filter_by(name=user).first()
            found_user.email = email
            db.session.commit()
            flash("EMAIL WAS SAVED")
        else:
            if "email" in session:
                email = session["email"]

        return render_template("user.html", email=email)
    else:
        flash("You not logged in")
        return redirect(url_for("login"))


@ app.route("/logout")
def logout():
    flash("YOU HAVE BEEN LOGGED OUT", "info")
    session.pop("user", None)
    return redirect(url_for("login"))


if __name__ == "__main__":
    # this next line will create a database depending on whether or not there is already a table
    db.create_all()
    app.run(debug=True)
