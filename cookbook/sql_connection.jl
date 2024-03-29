using Pkg

Pkg.add(url="https://github.com/JuliaComputing/MySQL.jl")
Pkg.add(url="https://github.com/JuliaDB/DBI.jl")
# Pkg.add(url="https://github.com/JuliaDB/PostgreSQL.jl")
Pkg.add("SQLite")


# MySQL
using MySQL
using DBInterface

host = "localhost"
user = "root"
passwd = "qwerty123"
db = "example"

conn = DBInterface.connect(MySQL.Connection, host, user, passwd, db=db, port=3306)

query = """
CREATE TABLE Student 
(
    ID INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(255),
    Attendance FLOAT,
    JoinDate DATE,
    Enrolments INT,
    PRIMARY KEY (ID)
);"""

params = Dict(
    :a => "a",
    :b => "b"
)

query = """
SHOW TABLES;
"""

stmt = DBInterface.prepare(conn, query)

result =  DBInterface.execute(stmt)
df = DataFrame()

