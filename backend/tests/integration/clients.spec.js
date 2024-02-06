const request = require('supertest');
const app = require('../../src/app');
const connectDB = require('../../src/database/connection');

describe('Client', () => {
  beforeEach(async ()=>{
    await connectDB.migrate.rollback();
    await connectDB.migrate.latest();
  });

  afterAll(async ()=>{
    await connectDB.destroy();
  });

  it('should be able to create a new Client', async () => {
    const response = await request(app)
     .post('/clients')
     .set('Authorization', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjo0LCJuYW1lIjoiZ2FicmllbCIsInBhc3N3b3JkIjoiJDJiJDA5JE8yYURtOWY1cG9kbHJnVmQ5ZmZVU09xLkMuQS9IWWtsd2lHRDF1end6MlpaMmh5R3BiVjI2In0sImlhdCI6MTcwNzE1NDI2M30.CKYCZaOIw0IdUbUN6XYuDK99YrVQ7J2z9KEPHhiuMpM')
     .send({
      email: "client@test.cli.com.br",
      tag: {id: 1, name: "Varejo"},
    });

    expect(response.body).toHaveProperty('id');
  });
  
  it('should be able to list all Clients', async () => {
    const response = await request(app).get('/clients').set(
        'Authorization', 
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjo0LCJuYW1lIjoiZ2FicmllbCIsInBhc3N3b3JkIjoiJDJiJDA5JE8yYURtOWY1cG9kbHJnVmQ5ZmZVU09xLkMuQS9IWWtsd2lHRDF1end6MlpaMmh5R3BiVjI2In0sImlhdCI6MTcwNzE1NDI2M30.CKYCZaOIw0IdUbUN6XYuDK99YrVQ7J2z9KEPHhiuMpM'
        );

    expect(response.status).toBe(200);

  });

  it('should be able to delete a Client', async () =>{
    const response = await response(app)
     .delete('/clients/1').set('Authorization', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjo0LCJuYW1lIjoiZ2FicmllbCIsInBhc3N3b3JkIjoiJDJiJDA5JE8yYURtOWY1cG9kbHJnVmQ5ZmZVU09xLkMuQS9IWWtsd2lHRDF1end6MlpaMmh5R3BiVjI2In0sImlhdCI6MTcwNzE1NDI2M30.CKYCZaOIw0IdUbUN6XYuDK99YrVQ7J2z9KEPHhiuMpM');
    
    expect(response.status).toBe(204);
    expect(response.headers).toHaveProperty('X-Total_count')
  });

  it('should be able to get a Client', async () => {
    const response = await response(app)
    .get('/clients/1')
    .set('Authorization',
     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjo0LCJuYW1lIjoiZ2FicmllbCIsInBhc3N3b3JkIjoiJDJiJDA5JE8yYURtOWY1cG9kbHJnVmQ5ZmZVU09xLkMuQS9IWWtsd2lHRDF1end6MlpaMmh5R3BiVjI2In0sImlhdCI6MTcwNzE1NDI2M30.CKYCZaOIw0IdUbUN6XYuDK99YrVQ7J2z9KEPHhiuMpM'
     );
   
     expect(response.status).toBe(200);
  });

  it('should be able to update a Client', async () => {
    const response = await response(app)
    .put('/clients/1')
    .set('Authorization',
     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjo0LCJuYW1lIjoiZ2FicmllbCIsInBhc3N3b3JkIjoiJDJiJDA5JE8yYURtOWY1cG9kbHJnVmQ5ZmZVU09xLkMuQS9IWWtsd2lHRDF1end6MlpaMmh5R3BiVjI2In0sImlhdCI6MTcwNzE1NDI2M30.CKYCZaOIw0IdUbUN6XYuDK99YrVQ7J2z9KEPHhiuMpM'
     ).send({
        email: "client@teste.com.br",
        tag: {id: 1, name: "Varejo"},
      });
   
   expect(response.status).toBe(201);
  });
  
});