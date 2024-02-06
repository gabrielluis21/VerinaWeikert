import { request } from "express";

describe('Session', () => {
  beforeEach(async ()=>{
    await connectDB.migrate.rollback();
    await connectDB.migrate.latest();
  });

  afterAll(async ()=>{
    await connectDB.destroy();
  });

  it('should be able to create a new Session',()=>{
    const response = request(app)
     .post('/sessions/signIn')
     .send({
       name: "admin",
       password: "12345678"
     });
     
    expect(response.status).toBe(200);
    expect(response.body).toHaveProperty(token);
  });
  
  it('should be able to create a new user',()=>{
    const response = request(app)
     .post('/sessions/signIn')
     .send({
       name: "test",
       password: "test@1234"
     });
     
    expect(response.status).toBe(200);
    expect(response.body).toHaveProperty(token);
  });
});