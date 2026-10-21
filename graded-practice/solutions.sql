exercise 1
SELECT workshopid
FROM occurs
WHERE room = 'Jean P';

exercise 2
SELECT workshopid, room
FROM occurs
WHERE day = 1 AND slot = 'A';

exercise 3
SELECT DISTINCT a.name
FROM activity a
JOIN workshop w ON a.activityid = w.activityid
JOIN participation p ON w.workshopid = p.workshopid
JOIN person pe ON p.ssn = pe.ssn
WHERE pe.name = 'Jean';

exercise 4
SELECT DISTINCT a.name 
FROM activity a
JOIN workshop w ON a.activityid = w.activityid
JOIN occurs o ON w.workshopid = o.workshopid
WHERE o.room IN (
    SELECT DISTINCT o2.room
    FROM occurs o2
    JOIN workshop w2 ON o2.workshopid= w2.workshopid
    JOIN activity a2 ON w2.activityid = a2.activityid
    WHERE a2.name = 'violin'
);

exercise 5
SELECT o.room
FROM occurs o
JOIN workshop w ON o.workshopid = w.workshopid
JOIN activity a ON w.activityid = a.activityid
GROUP BY o.room
HAVING COUNT(DISTINCT a.activityid) = 1;

exercise 6 (Answer with Aggregation)
SELECT o.room
FROM occurs o
JOIN workshop w ON o.workshopid = w.workshopid
JOIN activity a ON w.activityid = a.activityid
GROUP BY o.room
HAVING COUNT(DISTINCT a.activityid) >= 2;

exercise 6 (Answer without Aggregation)
SELECT DISTINCT o1.room
FROM occurs o1
JOIN workshop w1 ON o1.workshopid= w1.workshopid
JOIN activity a1 ON w1.activityid= a1.activityid
JOIN occurs o2 ON o1.room = o2.room
JOIN workshop w2 ON o2.workshopid= w2.workshopid
JOIN activity a2 ON w2.activityid = a2.activityid
WHERE a1.activityid <> a2.activityid;

exercise 7
SELECT DISTINCT p.name
FROM person p
JOIN participation pa ON p.ssn = pa.ssn
JOIN occurs o ON pa.workshopid = o.workshopid
WHERE o.room IN ('Keaton', 'Rimbaud');

exercise 8
SELECT p.ssn
FROM person p
JOIN participation pa ON p.ssn = pa.ssn
JOIN workshop w ON pa.workshopid= w.workshopid
GROUP BY p.ssn
HAVING COUNT(DISTINCT CASE WHEN w.level <> 1 THEN 1 END) = 0;

exercise 9
SELECT a.name
FROM activity a
JOIN workshop w ON a.activityid = w.activityid
GROUP BY a.activityid, a.name
HAVING COUNT(w.workshopid) > 1;

exercise 10
SELECT o.workshopid
FROM occurs o
JOIN workshop w ON o.workshopid = w.workshopid
JOIN activity a ON w.activityid = a.activityid
WHERE o.Room = 'Jean P' AND a.Name = 'circus';

exercise 11
SELECT p.name
FROM person p 
LEFT JOIN workshop w on w.instructorssn = p.ssn
WHERE w.instructorssn ISNULL;

exercise 12
SELECT o.room, COUNT (o.workshopid) as num_workshop
FROM occurs o 
GROUP by o.room
HAVING COUNT (o.workshopid) > (
  SELECT AVG (num_workshop)
  FROM (
    SELECT COUNT (o.workshopid) AS num_workshop
    FROM occurs o 
    GROUP BY room
    )
)
ORDER by num_workshop DESC;

exercise 13
SELECT A.name, w.level
FROM activity A 
JOIN workshop w ON a.activityid = w.activityid 
WHERE w.level = ( 
  SELECT max(level) 
  FROM workshop 
);

exercise 14
SELECT o.room
FROM occurs o
JOIN workshop w ON o.workshopid = w.workshopid
GROUP BY o.room
HAVING COUNT(DISTINCT w.activityid) = (SELECT COUNT(*) FROM activity);

exercise 15
SELECT a.name
FROM activity a
JOIN workshop w ON a.activityid = w.activityid
JOIN participation p ON w.workshopid = p.workshopid
JOIN person pe ON p.ssn = pe.ssn
GROUP BY a.activityid, a.name
HAVING COUNT(DISTINCT pe.age) = (SELECT COUNT(DISTINCT age) FROM person);