var express = require('express');
var app = express();
app.get('/', function (req, res) {  
  res.status(200).send('Hello World!');
});

app.get('/ruleme', function (req, res) {  
    res.status(200).send('Hello World!');
});

app.listen(3001, function () {
  console.log('Example app listening on port 3001!');
});