from pymongo import MongoClient

client = MongoClient("mongodb://root:example@localhost")
db = client["admin"]


def delete_one():
    return db.restaurants.delete_one({"borough": "Manhattan"})


def delete_many():
    return db.restaurants.delete_many({"cuisine": "Thai"})


res = delete_one()
res2 = delete_many()

print(res, res2)