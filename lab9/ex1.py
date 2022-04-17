#!/usr/bin/python
import psycopg2
from geopy.geocoders import Nominatim


def function(address_contains, city_id_from, city_id_to):
    connection = None
    connection = psycopg2.connect(
        host="127.0.0.1",
        database="dvdrental",
        user="root",
        password="root", port="5433", connect_timeout=3)

    cur = connection.cursor()

    cur.callproc('ex1', (address_contains, city_id_from, city_id_to))
    return cur.fetchall()
    cur.close()
    if conn is not None:
            conn.close()


if __name__ == '__main__':
    addresses = function("11", 400, 600)
    print(addresses)

    connection = psycopg2.connect(
        host="127.0.0.1",
        database="dvdrental",
        user="root",
        password="root", port="5433", connect_timeout=3)

    cur = connection.cursor()
    for address in addresses:
        geolocator = Nominatim(user_agent="postgres")
        location = geolocator.geocode(address)
        print((location.latitude, location.longitude))
        cur.execute(
            "UPDATE address SET address2=(%s)"
            " WHERE address = (%s)",
            ("(" + str(location.latitude) + "," + str(location.longitude) + ")", address,));
    connection.commit()
    cur.close()
    connection.close()

