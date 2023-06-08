import { Test } from '@nestjs/testing';
import { INestApplication } from '@nestjs/common';
import { AppModule } from '../src/app.module';
import { io, Socket } from 'socket.io-client';

describe('MessageGateway', () => {
  let app: INestApplication;
  let socket: Socket;
  const testTime = 120000;

  beforeAll(async () => {
    const moduleRef = await Test.createTestingModule({
      imports: [AppModule],
    }).compile();

    app = moduleRef.createNestApplication();
    await app.listen(3001);
  });

  beforeEach(() => {
    socket = io('http://localhost:3001');
    socket.connect();
  });

  describe('findAll', () => {
    it(
      'should return existing chats',
      (done) => {
        socket.emit('findAllMessages', {}, (res) => {
          expect(res).toBe('array');
        });
        done();
      },
      testTime,
    );
  });

  describe('join', () => {
    it(
      'should return user data after joining chat',
      (done) => {
        socket.emit('join', { name: 'kate' }, (res) => {
          expect(res).toBe('object');
        });
        done();
      },
      testTime,
    );
  });

  afterEach(() => {
    socket.disconnect();
  });

  afterAll(async () => {
    await app.close();
  });
});
