const mysql = require('mysql2');

const connection = mysql.createConnection({
    host : 'localhost',
    port : 3306,
    database : 'sample',
    user : 'root',
    password : 'password'
});

connection.connect((err) => {
    if(err){
        console.log("Error occured while connecting");
        console.log(err);
    }else{
        console.log("Connection created successfully");
    }

    var sql = "create table customers (name varchar(255), address varchar(255))";
    connection.query(sql, (err, result) =>{
        if (err) throw err
        console.log("Table created");
    });
});