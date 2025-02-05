require('@dotenvx/dotenvx').config();
const express = require('express');
const bodyParser = require('body-parser');
const { body, validationResult } = require('express-validator');
const app = express ();
const catalog = require("./services/catalog_service");
const mail = require("./services/mail_service");

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
  console.log("Server Listening on PORT:", PORT);
});

app.use(bodyParser.json())


// ONLY enable these on localhost/development environments to disable CORS, DO NOT USE THESE HEADERS IN PRODUCTION!



app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();
});




app.post('/catalog',
    [
      body('search')
          .escape()
          .isString()
          .isLength({min: 3, max: 30})

    ],
    (req, res) => {
      const errors = validationResult(req);

      if (errors.isEmpty()) {

      let search_results = catalog.search(req.body.search);

      search_results.then(function (results) {

        if (results === []){
          res.status(404).send();
        }
        else {
          res.status(200).json(results).send();
        }

      });

    }

      else {
        res.status(400).send();
      }
});


app.post('/mail', [

    body('name')
        .isLength({min: 3, max: 30})
      .withMessage('A megadott névnek legalább 3-30 karakter hosszúságúnak kell lennie'),

  body('email')
      .isEmail()
      .withMessage('Érvénytelen email cím'),

  body('phoneNumber')
      .optional()
      .isString()
      .isLength({min: 6, max: 16})
      .matches(/^[0-9]+$/)
      .withMessage("érvénytelen telefonszám"),

  body("taxId")
      .optional()
      .isString()
      .optional()
      .withMessage("érvénytelen adószám"),

  body("message")
      .isString()
      .withMessage("A szöveg hosszának 3 és 1000 közötti karakterszámnak kell lennie")

  ],(req, res) => {

    const errors = validationResult(req);

    if (errors.isEmpty()) {

      const mail_contents = req.body;

      mail.send(mail_contents.name,
        mail_contents.email,
        mail_contents.phone,
        mail_contents.taxId,
        mail_contents.message).then((responseStatusCode) => {

        res.status(responseStatusCode).send();

      })
    }

    // if errors occured with the validation
    else {
      res.status(400).json().send();
    }

  });

module.exports = {

  app

};
