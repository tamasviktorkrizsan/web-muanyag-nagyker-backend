# web-muanyag-nagyker-backend

This repository contains the back-end Node.js source code of the Matejka Műanyagárú Nagykereskedelem.
 
## Stack / Features

- Node.js
- REST API
- Backend validation
- Database search Web Service
- Mail sending Web Service
- Unittests with Mocha & Chai

## Install on localhost

1. Make sure these programs installed on your local machine.

  - Node
  - XAMPP (or equivalent for MySQL service provider)
  - OPTIONAL: Postman (or equivalent for making http requests)

2. Clone this repostiory to your local drive and open a terminal window in your local git folder and install the dependencies.

```
npm -i
```

3. Fire up XAMPP with Apache + Mysql and import the catalog database from the db folder. 

4. Create a '.env' file in the root directory of this repository with the following variables.

 ```
PORT=3000
DB_HOST='localhost'
DB_USER='root'
DB_PASSWORD=''
DATABASE='matejka_muanyag_nagykereskedelem'
MAIL_HOST='<your_smtp_server_url>'
MAIL_PORT=<your_smtp_server_portnumber>
MAIL_USER='<your_smtp_server_username>'
MAIL_PASSWORD='<your_smtp_server_password>'
MAIL_RECEIVER='<your_target_email>'
```
If you want to run tests add the following to this list.

```
TEST_API_HOST='http://localhost:3000'
```

## running on localhost

1. Fire up XAMPP with Mysql.
   
3. Start the Node.js server in the root directory of this repository.

```
node api
```

And you can send the following requests in Postman or run a front-end app on this API.


## services

### catalog search service 

**request type:** post

**endpoint:** http://localhost:3000/catalog

**request body**:

```
{"search": "product name"}
```


### mail sending service

**request type:** post

**endpoint:** http://localhost:3000/mail

**request body:**

```
{
    "name": "Your name",
    "email": "youremail@hostname.domain",
    "phone": "06301234567",
    "taxId": "123456789",
    "message": "Your message"
}
```

## Running tests

While the Node.js server is running. Open a new terminal window, and run the "test" script.

```
npm test
```

## Important notes for production

If you want to run this app in production environments, make sure you put these headers in the api.js file in a block comment.

```
/* 

app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();
});

 */

```


## Developer notes

### Code Style
The code in this repository formatted according the standards of the Google Style Guides.

https://google.github.io/styleguide/


### Commit Message Style
The commits in this repository formatted according the standards of the Angular Commit Message Guidelines.

https://github.com/angular/angular/blob/22b96b9/CONTRIBUTING.md#type

