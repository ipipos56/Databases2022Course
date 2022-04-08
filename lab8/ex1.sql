explain SELECT * FROM customer;


explain SELECT * FROM customer c
where review = 'Event training expert include name bed clear. Political town describe bad process its. Me budget issue ask war require case. Exactly notice onto will knowledge including difference set.';

explain SELECT * FROM customer c
ORDER BY name;

explain SELECT * FROM customer c
ORDER BY address;


CREATE INDEX hashInd ON customer USING HASH (review);

CREATE INDEX btreeInd ON customer USING btree (address);
