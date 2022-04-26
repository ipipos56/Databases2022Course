from pymongo import MongoClient

client = MongoClient("mongodb://root:example@localhost")
db = client["admin"]


def do():
    c = {"date": "2022-10-01T00:00:00.000Z",
         "grade": "C", "score": 1}
    for r in db.restaurants.find({"address.street": "Rogers Avenue"}):
        num_of_c = len([g for g in r["grades"] if g["grade"] == "C"])
        id_ = {"_id": r["_id"]}
        if num_of_c > 1:
            assert db.restaurants.delete_one(id_).deleted_count == 1
        else:
            assert db.restaurants.update_one(id_, {"$push": {"grades": c}}).modified_count > 0

do()
