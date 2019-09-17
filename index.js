var express = require('express')
var app = express()

app.get('/', function (req, res) {
  res.sendFile(__dirname+'/head.html')
})

app.listen(process.env.PORT || 5050) 