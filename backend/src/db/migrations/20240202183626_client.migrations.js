/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function(knex) {
    return knex.schema.createTable("clients", 
    (table) => {
        table.increments("id").primary()
        table.string("email")
        table.integer("tag_id").unsigned().nullable()
        table.foreign("tag_id").references("tags.id")
    });
};

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function(knex) {
    return knex.schema.dropTable("clients")
  };
