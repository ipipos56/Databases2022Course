from pprint import pprint

from pymongo import MongoClient

client = MongoClient("mongodb://root:example@localhost")
db = client["admin"]


def insert():
    address = {"building": "1480",
               "coord": [-73.9557413, 40.7720266],
               "street": "2 Avenue",
               "zipcode": "10075"}
    grades = [{"date": "2014-10-01T00:00:00.000Z",
               "grade": "A", "score": 11}]
    return db.restaurants.insert_one({
        "address": address,
        "borough": "Manhattan",
        "cuisine": "Italian",
        "name": "Vella",
        "restaurant_id": 41704620,
        "grades": grades
    })


insert()
pprint(db.restaurants.find_one({"restaurant_id": 41704620}))
