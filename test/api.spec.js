require('@dotenvx/dotenvx').config();
const chai = require('chai');
const chaiHttp = require('chai-http');
const chaiJsonEqual = require('chai-json-equal');
const { expect } = chai;

chai.use(chaiHttp);
chai.use(chaiJsonEqual);

// TODO: put the test env variables in a separate .env file

const server = process.env.TEST_API_HOST;


describe('Catalog API Testing', () => {

  it('should return a category name: "szemetesek"', (done) => {
        chai
            .request(server)
            .post('/catalog')
            .send({
                search: 'Furba'
            })
            .end((err, res) => {
                if (err) done(err);
                expect(res.body[0]).to.have.property('category', 'szemetesek');
                done();
            });
    })

    it('should return status 200 for the catalog search POST request', (done) => {
    chai
        .request(server)
        .post('/catalog')
        .send({
          search: 'Furba'
        })
        .end((err, res) => {
            if (err) done(err);
          expect(res).to.have.status(200);
          done();
        });
  })

    it('should not return anything', (done) => {
        chai
            .request(server)
            .post('/catalog')
            .send({
                search: 'xy'
            })
            .end((err, res) => {
                if (err) done(err);
                //console.log(res);
                expect(res).to.have.status(400);
                done();
            });
    });

})


describe('Mail API Testing', () => {

  const inputData = {
    name: "Tamás Krizsán",
    email: "xy@krizsanmunka.hu",
    phone: "06301234567",
    taxId: "123456789",
    message: "Ez az üzenet"
  };


  it('should return status 200 for the mail POST request', (done) => {
    chai
        .request(server)
        .post('/mail')
        .send(inputData)
        .end((err, res) => {
          if (err) done(err);
          expect(res).to.have.status(200);
          done();
        });

  });


    it('should return an error message about a invalid name', (done) => {

        let invalidNameData = inputData;

        invalidNameData['name'] = "xy";

        chai
            .request(server)
            .post('/mail')
            .send(invalidNameData)
            .end((err, res) => {
                if (err) done(err);
                expect(res).to.have.status(400);
                done();
            });

    })


  it('should return an error message about a invalid email', (done) => {

    let invalidNameData = inputData;

    invalidNameData['email'] = "xy";

    chai
        .request(server)
        .post('/mail')
        .send(invalidNameData)
        .end((err, res) => {
          if (err) done(err);
          expect(res).to.have.status(400);
          done();
        });

  })


  it('should return an error message about an invalid phone number', (done) => {

    let invalidNameData = inputData;

    invalidNameData['phone'] = "xy";

    chai
        .request(server)
        .post('/mail')
        .send(invalidNameData)
        .end((err, res) => {
          if (err) done(err);
          expect(res).to.have.status(400);
          done();
        });

  })


  it('should return an error message about an invalid tax id', (done) => {

    let invalidNameData = inputData;

    invalidNameData['taxId'] = "xy";

    chai
        .request(server)
        .post('/mail')
        .send(invalidNameData)
        .end((err, res) => {
          if (err) done(err);
          expect(res).to.have.status(400);
          done();
        });
  })



  it('should return an error message about an invalid message', (done) => {

    let invalidNameData = inputData;

    invalidNameData['message'] = "xy";

    chai
        .request(server)
        .post('/mail')
        .send(invalidNameData)
        .end((err, res) => {
          if (err) done(err);
          expect(res).to.have.status(400);
          done();
        });
  })
})
