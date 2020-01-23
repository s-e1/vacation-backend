const express = require('express');
const cors = require('cors');
var mysql = require('mysql');
var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'project3'
});
const app = express();
app.use(express.json());
app.use(cors());

connection.connect(function (err) {
    if (err) {
        console.error('error connecting: ' + err.stack);
        return;
    }
    console.log('connected as id ' + connection.threadId);
});

//1 login (user,pw) => check credentials => return all vacations [user or admin]
app.post('/login', (req, res) => {
    var { username, password } = req.body;
    if (!username || !password) {
        return res.status(404).json('fill all fields')
    }
    //get info about user from db
    let sql = `SELECT * FROM users WHERE username like '${username}'`;
    connection.query(sql, (err, result) => {
        if (err) throw err;
        if (result[0] && password == result[0].password) {
            //get all trips
            let sql2 = `SELECT * FROM vacations`;
            connection.query(sql2, (err2, result2) => {
                if (err2) throw err2;
                else {
                    //get all trips user is following
                    let sql3 = `SELECT trip_id FROM follow WHERE user_id=${result[0].id}`;
                    connection.query(sql3, (err3, result3) => {
                        if (err3) throw err3;
                        else {
                            let following = result3.map(item => item.trip_id);
                            res.status(200).json([result[0].id, username, result2, following]);
                        }
                    })
                }
            })
        } else {
            res.status(400).json('wrong credentials');
        }
    })
})
//2 register first,last,user,pw => check credentials => update db, return all vacations
app.post('/register', (req, res) => {
    var { firstname, lastname, username, password } = req.body;
    if (!firstname || !lastname || !username || !password) {
        return res.status(400).json('fill all fields')
    }
    //check db if user exists
    let sql = `SELECT * FROM users WHERE username like '${username}'`;
    connection.query(sql, (err, result) => {
        if (err) throw err;
        console.log(1, result);
        if (result[0]) {
            res.json('user exists');
        } else {
            //put users data in db
            let sql2 = 'INSERT INTO users SET ?';
            connection.query(sql2, req.body, (err2, result2) => {
                if (err2) throw err2;
                console.log(2, result2);
                //get all trips
                let sql3 = `SELECT * FROM vacations`;
                connection.query(sql3, (err3, result3) => {
                    if (err3) throw err3;
                    console.log(3, result3);
                    res.json([result2.insertId, username, result3, []]);
                })
            })
        }
    })
})
//3 follow => add follow to db, return all vacations
app.post('/follow', (req, res) => {
    var { userId, tripId } = req.body;
    var sql = `INSERT INTO follow(user_id, trip_id) VALUES (${userId},${tripId})`;
    connection.query(sql, (err, result) => {
        if (err) {
            console.log('err', err);
            res.status(400).json('follow exists')
        } else {
            console.log('result', result);
            res.status(200).json('follow updated')
        }
    })
})
//4 unfollow => delete follow from db, return all vacations
app.delete('/follow', (req, res) => {
    var { userId, tripId } = req.body;
    var sql = `DELETE FROM follow WHERE user_id = ${userId} AND trip_id = ${tripId}`;
    connection.query(sql, (err, result) => {
        if (err) throw err;
        console.log(result);
        res.json('follow deleted')
    })
})
//5 add a vacation => update db, return all vacations
app.post('/trip', (req, res) => {
    var { description, location, img, begin, end, price } = req.body;
    if (!description || !location || !img || !begin || !end || !price) {
        return res.status(400).json('fill all fields')
    }
    let sql = 'INSERT INTO vacations SET ?';
    connection.query(sql, req.body, (err, result) => {
        if (err) throw err;
        console.log(result);
        let sql2 = `SELECT * FROM vacations`;
        connection.query(sql2, (err2, result2) => {
            if (err2) throw err2;
            else {
                res.status(200).json([1, 'admin', result2, []]);
            }
        })
    })
})
//6 edit a vacation => update db, return all vacations
app.put('/trip', (req, res) => {
    var { id, description, location, img, begin, end, price } = req.body;
    if (!id || !description || !location || !img || !begin || !end || !price) {
        return res.status(400).json('no empty fields')
    }
    var sql = `UPDATE vacations SET ? WHERE id='${req.body.id}'`;
    connection.query(sql, req.body, (err, result) => {
        if (err) throw err;
        console.log(result);
        let sql2 = `SELECT * FROM vacations`;
        connection.query(sql2, (err2, result2) => {
            if (err2) throw err2;
            else {
                res.status(200).json([1, 'admin', result2, []]);
            }
        })
    })
})
//7 delete a vacation => update db, return all vacations
app.delete('/trip/:id', (req, res) => {
    let sql = `DELETE FROM vacations WHERE id = ${req.params.id}`;
    connection.query(sql, (err, result) => {
        if (err) throw err;
        console.log(result);
        let sql2 = `SELECT * FROM vacations`;
        connection.query(sql2, (err2, result2) => {
            if (err2) throw err2;
            else {
                res.status(200).json([1, 'admin', result2, []]);
            }
        })
    })
})
//8 data for graph => return vacations followed and count
app.get('/follow', (req, res) => {
    let sql = `SELECT vacations.location, COUNT(follow.user_id) AS Following FROM follow
    INNER JOIN vacations ON follow.trip_id = vacations.id
    GROUP BY vacations.location`;
    connection.query(sql, (err, result) => {
        if (err) throw err;
        console.log(result);
        res.json(result);
    })
})

app.listen('3001', () => {
    console.log('works');
})