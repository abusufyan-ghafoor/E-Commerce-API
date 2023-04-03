E-Commerce API Backend

This is a Ruby on Rails API backend for an e-commerce site. It provides endpoints for managing products, orders, and customers.

Getting Started
Prerequisites
To run this API, you'll need the following:
Ruby (version 2.7.1)
Rails (version 6.1.4)
PostgreSQL (version 14.6)

Installing

Clone the repository:
git clone https://github.com/abusufyan-ghafoor/E-Commerce-API.git

Install dependencies:
bundle install

Create the database:
rails db:create

Run migrations:
rails db:migrate

Start the server:
rails s

Endpoints
The API provides the following endpoints:

Products
GET /api/v1/products: list all products
POST /api/v1/products: create a new product
GET /api/v1/products/:id: show a single product
PATCH /api/v1/products/:id: update a product
DELETE /api/v1/products/:id: delete a product

