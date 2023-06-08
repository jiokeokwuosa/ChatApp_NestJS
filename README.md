# Scanworks
A chat application

## Features

- Users can submit name to enter chat room
- Users should be able to post on the chat in real time
- User should be able to see existing chat
- Users should be able to see who is currently typing on the chat

## Technologies

- Typescript
- Node JS(Nest Js)
- Socket.io
- Prisma
- CockroachDB (based on PostgreSQL)

## Requirements and Installation

To install and run this project you would need to have installed:
- Node Js
- Git

To run:
```
$ git clone https://github.com/jiokeokwuosa/ChatApp_NestJS.git
$ cd ChatApp_NestJS
$ create .env and add the necessarily values
$ npm install
$ npm run start:dev
```

## Testing
```
- Unit Test: npm run test
- Integration Test: npm run test:e2e
```

## Tracker stories

None

## Template UI

None

## API

The API is currently in version 1 (v1) and can be accessed locally via [http://localhost:3001](http://localhost:3001)

## API Documentation Link

None

## Messages to subscribe to via socket.io

| Endpoint                                         | Functionality                            |
| ------------------------------------------------ | -----------------------------------------|
| createMessage     | Create a comment on the chat            |
| findAllMessages   | Returns existing chat messages          |
| join           | Join a chatroom                            |
| typing   | Keep track of who is currently typing            |

## Author

Okwuosa Chijioke (Okwuosachijioke@gmail.com)

## License

This is licensed for your use, modification and distribution under the [MIT license.](https://opensource.org/licenses/MIT)

## My Env Variables
PORT=3001
DATABASE_URL=postgressql url

