# SQL Query Exercises — DDL / DML & Hand-Written Queries

SQL exercises for the **Relational Databases** M1 course — DDL / DML on two graded-practice schemas (Cultural House, Books) and a seeded film database, with hand-written query solutions covering joins, aggregation, subqueries, and `HAVING`.

## Highlights
- **Cultural House schema** — `Person`, `Activity`, `Workshop`, `Participation`, `Occurs` (rooms / slots).
- **15 graded-practice queries** — multi-join, self-join, nested aggregation, `HAVING` with subqueries, and a query that returns rooms hosting every activity.
- **Books schema** — `Contributor`, `Publisher`, `Book`, `Contribution` / role linking.
- **Film seed database** — `personne`, `Film`, `Role1`, `MES` with a real filmography for practice queries.

## Quick start
```bash
# Any PostgreSQL-compatible engine
psql -h localhost -U postgres -d your_db -f graded-practice/Cultural_House_DB.sql
psql -h localhost -U postgres -d your_db -f graded-practice/solutions.sql
```

## Layout
```
graded-practice/
  Cultural_House_DB.sql   DDL + seed for the cultural-house schema
  books.sql               DDL for the books schema
  solutions.sql           15 hand-written query solutions against Cultural House
practical-session/
  film-schema-and-seed.sql  DDL + seed for the film / personne / role / MES schema
```

## Notes
- Coursework / graded practical session for the Relational Databases M1 course at Université Paris-Saclay.
- Standard SQL (PostgreSQL-flavoured `DROP TABLE ... CASCADE`); runs on most modern engines.
- Only the `.sql` / query files are committed; lecture PDFs and exercise statement PDFs are excluded.
