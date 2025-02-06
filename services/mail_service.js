const nodemailer = require('nodemailer');
const hbs = require('nodemailer-express-handlebars')

/**
 * Connects to a mail server and send a mail.
 * @param {string} name - The mail sender.
 * @param {string} email - The sender's email address.
 * @param {string} phone - The sender's phone number.
 * @param {string} taxId - The sender's Tax ID number.
 * @param {string} message - The Contents of the mail.
 * @returns {Promise<number>} - A HTTP response code (200 or 500).
 */

const send = async (name, email, phone, taxId, message) => {

  return new Promise((resolve, reject) => {

    try {

      const transporter = nodemailer.createTransport({
        host: process.env.MAIL_HOST,
        port: process.env.MAIL_PORT,
        auth: {
          user: process.env.MAIL_USER,
          pass: process.env.MAIL_PASSWORD
        }
      });

      const hbsOptions = {

        viewEngine: {
          defaultLayout: false
        },
        viewPath: 'views'
      }

      transporter.use('compile', hbs(hbsOptions))

      const mailOptions = {
        from: email,
        to: process.env.MAIL_RECEIVER,
        subject: 'Új üzenet a Matejka Műanyag Nagykereskedelem weboldaláról',
        template: 'mailHtmlTemplate',
        context: {

          name: name,
          email: email,
          phone: phone,
          taxId: taxId,
          message: message

        }
      };

      transporter.sendMail(mailOptions, (err) => {

        if (!err) {
          resolve(200);
        }

      });

    } catch (err) {
      console.error(err);

      reject(500);
    }

  })

}


module.exports = {
  send
};