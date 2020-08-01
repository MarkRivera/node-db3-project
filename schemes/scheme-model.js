const knex = require("knex");
const config = require("../knexfile.js");
const db = knex(config.development);

function find() {
  return db("schemes");
}

function findById(id) {
  return db("schemes").where({ id }).first();
}

function add(user) {
  return db("schemes")
    .insert(user)
    .then((ids) => {
      return findById(ids[0]);
    });
}

function update(changes, id) {
  return db("schemes").where({ id }).update(changes);
}

function remove(id) {
  return db("schemes").where({ id }).del();
}

module.exports = {
  find,
  findById,
  add,
  update,
  remove,
};
