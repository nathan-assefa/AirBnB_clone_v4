#!/usr/bin/python3
""" This script lets the flask app connects to mysql database and
fetch all the data from the states table.

ip address 0.0.0.0 is going to be used to all the machines within the
the network to have access to our app. Port 5000 will be used at entry
point """


from flask import Flask, render_template
from models import storage
from models.state import State
from models.amenity import Amenity
import uuid


app = Flask(__name__)


@app.teardown_appcontext
def close_dp(exit):
    """This context function gives back the
    connection once request is done"""
    storage.close()


@app.route("/2-hbnb", strict_slashes=False)
def db_app():
    """this function fetches all the states from mysql database"""
    states = list(storage.all(State).values())
    amenities = list(storage.all(Amenity).values())
    cache_id = str(uuid.uuid4())

    return render_template(
        "2-hbnb.html",
        states=states,
        amenities=amenities,
        cache_id=cache_id
    )


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
