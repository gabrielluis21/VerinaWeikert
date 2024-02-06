/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> } 
 */
exports.seed = async function(knex) {
   // Deletes ALL existing entries
   await knex("user").del();
   // Inserts seed entries
   await knex("user").insert(
       { id: 1, name: "admin", password: "$2a$09$He7dyFhU/aLdkSAHucPZ0emH3U9e2dVRkDSaf56raAQgItHfELeKW" },);
};
