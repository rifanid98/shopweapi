**shopweapi** is a simple api endpoint for [shopwe](https://github.com/rifanid98/shopwe) shop application built with Node.js, Express Js as a framework of Node.js and MySQL as a database which has [features](https://github.com/rifanid98/#features) such as login / register using JWT, pasword hashing, CORS, etc.

## :memo: Table Of Content

-   [Prerequisites](#prerequisites)
-   [Installation](#installation)
-   [Features](#features)
-   [Examples](#examples)
-   [Built wtih](#features)
-   [Author](#author)
-   [Contributor](#contributor)
-   [License](#license)

## Prerequisites

-   NPM or Yarn as package manager.
-   Node.js installed on the local machine.
-   MySQL intalled on the local machine (ex. XAMPP)

## Installation

1. Clone this repository:
   `git clone https://github.com/rifanid98/shopweapi`
2. Start XAMPP
3. Database configuration:
    - Open http://localhost/phpmyadmin in the browser
    - Import database, select `shopwe.sql` file from project folder
4. Start the server:
    - Open root project folder with command line (terminal, linux. cmd, windows. etc.)
    - Type and run this command `npm start` to start the server.
    - Make sure there are no other processes that use port 3000
5. Run app with api testing tools like postman, etc. on http://localhost:3000/shopwe/api/v1/ or using local ip like http://192.168.43.88:3000/shopwe/api/v1/ as an example.

## Features

-   [x] CRUD
-   [x] Search, Sort, Pagination
-   [x] CORS allowed
-   [x] Login/Register with JWT
-   [x] Password hashing

## Examples

[How to use](https://github.com/rifanid98/shopweapi/blob/master/examples.md)

## Built with

-   [Node.js](http://nodejs.org/) - JavaScript runtime environment
-   [Express.js](https://expressjs.com/) - Node.js framework
-   [MySQL](https://www.mysql.com/) Database
-   [JWT](https://jwt.io/) - Login/Register authentication
-   [Bcrypt](https://github.com/kelektiv/node.bcrypt.js) - Password Hashing

## Author

This project was made by team 2, talent academy tech academy batch 16 group 3.

## Contributor

#### Adnin Rifandi Sutanto Putra

-   <p><img align="left" alt="shopwe" width="22px" src="https://cdn.jsdelivr.net/npm/simple-icons@v3/icons/github.svg" /> <a href="https://github.com/rifanid98">Adnin Rifandi</a></p>
-   <p><img align="left" alt="shopwe" width="22px" src="https://cdn.jsdelivr.net/npm/simple-icons@v3/icons/facebook.svg" /> <a href="https://https://web.facebook.com/adnin.rifandi754">Adnin Rifandi</a></p>
-   <p><img align="left" alt="shopwe" width="22px" src="https://cdn.jsdelivr.net/npm/simple-icons@v3/icons/linkedin.svg" /> <a href="https://www.linkedin.com/in/adnin-rifandi/">Adnin Rifandi</a></p>

#### Muhammad Rizky Ramadhan

-   <p><img align="left" alt="shopwe" width="22px" src="https://cdn.jsdelivr.net/npm/simple-icons@v3/icons/github.svg" /> <a href="https://github.com/MuhammadRizkyRamadhan24">Muhammad Rizky Ramadhan</a></p>
-   <p><img align="left" alt="shopwe" width="22px" src="https://cdn.jsdelivr.net/npm/simple-icons@v3/icons/facebook.svg" /> <a href="https://www.facebook.com/zidan.muh40/ ">MUhammad Rizky Ramadhan</a></p>
-   <p><img align="left" alt="shopwe" width="22px" src="https://cdn.jsdelivr.net/npm/simple-icons@v3/icons/linkedin.svg" /> <a href="https://www.linkedin.com/in/muhammad-rizky-ramadhan-258a8b194/ ">Muhammad Rizky Ramadhan</a></p>

## License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/rifanid98/shopweapi/blob/master/LICENSE) file for details
