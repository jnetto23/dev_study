const express = require('express');
const restful = require('node-restful');
const server = express();
const mongo = restful.mongoose;
const bodyPraser = require('body-parser');
const cors = require('cors');

// Database
mongo.Promise = global.Promise;
mongo.connect('mongodb://db/mydb');

// Middlewares
server.use(bodyPraser.urlencoded({extended:true}));
server.use(bodyPraser.json());
server.use(cors());

// ODM
const Client = restful.model('Client', {
    name: { type: String, require: true }
});

// Rest API
Client.methods(['get', 'post', 'put', 'delete']);
Client.updateOptions({new: true, runValidators: true});

// Routes
server.get('/', (req, res, next) => res.send('Backend'));
Client.register(server, '/clients');


// Start Server
server.listen(3000);