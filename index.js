const express = require('express')
const MongoClient = require('mongodb').MongoClient

const app = express()
const port = 3000
const mongoURL = 'mongodb://mongodb:27017'

const dbName = 'myDatabase'

app.get('/', async (req,res) => {
    try {
        const client = await MongoClient.connect(mongoURL);
        const db = client.db(dbName);
        const collection = db.collection('dane');

        const result = await collection.find({}).toArray()
        res.send(result)
        client.close();
    }
    catch (err) {
        console.error(err);
        res.status(500).send('Błąd serwera')
    }
});

app.listen(port, () => {
    console.log('Aplikacja nasłuchuje na porcie ${port}')
})