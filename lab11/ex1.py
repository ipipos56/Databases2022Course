from pprint import pprint

from pymongo import MongoClient

client = MongoClient("mongodb://root:example@localhost")
db = client["admin"]


def indian_cuisines():
    return db.restaurants.find({"cuisine": "Indian"})


def indian_or_thai_cuisines():
    return db.restaurants.find({"cuisine": {"$in": ["Indian", "Thai"]}})


def with_address():
    return db.restaurants.find({"address.building": "1115",
                                "address.street": "Rogers Avenue",
                                "address.zipcode": "11226"})


print(len(list(indian_cuisines())))
print(len(list(indian_or_thai_cuisines())))
pprint(list(with_address()))

