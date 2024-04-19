<<<<<<< Updated upstream
// // Import
// const express = require("express");
// const cors = require("cors");
// const app = express();
// require("express-async-errors");
// const io = require("socket.io")(4080, {
//   cors: {
//     origin: process.env.URL_FRONT || "localhost",
//     methods: ["GET", "POST"],
//     credentials: true,
//     allowedHeaders: ["Content-Type"],
//   },
// });

// const mysqlPool = require("./database/config");

// // app Use
// app.use(cors());
// app.use(express.json());
// app.use(express.urlencoded({ extended: false }));
// const port = process.env.PORT || 4000;

// // Middlewares
// const usersRoutes = require("./controllers/users.controller");
// const conversationsRoutes = require("./controllers/conversations.controller");

// app.use("/api/users", usersRoutes);
// app.use("/api/conversations", conversationsRoutes);

// app.use((err, req, res, next) => {
//   console.error(err);
//   res
//     .status(err.status || 500)
//     .send({ message: "Something went wrong", error: err.message });
// });

// // Run socket.io
// let users = [];
// io.on("connection", (socket) => {
//   socket.on("addUser", async (userId) => {
//     const isUserExist = users.find((user) => user.userId === userId);
//     if (!isUserExist) {
//       const user = { userId, socketId: socket.id };
//       users.push(user);
//       io.emit("getUsers", users);
//     }
//   });
//   socket.on("disconnect", () => {
//     users = users.filter((user) => user.socketId !== socket.id);
//     io.emit("getUsers", users);
//     io.emit("disconnectUser");
//   });

//   socket.on("userDeleted", () => {
//     users = users.filter((user) => user.socketId !== socket.id);
//     io.emit("getUsersWhenOneDeleted", users);
//   });

//   socket.on("userCreatedOrUpdate", () => {
//     io.emit("getUsersWhenOneCreatedOrUpdate");
//   });
// });

// // Database services
// const serviceUser = require("./services/users.service");

// // Connect DB
// mysqlPool
//   .query("SELECT 1")
//   .then(() => {
//     console.log("DB connected");
//     // Run server
//     app.listen(port, async () => {
//       console.log(`Server started on http://localhost:${port}`);
//     });
//   })
//   .catch((error) => console.error("DB connection failed :", error));

import express from "express";
import "reflect-metadata";
import { AppDataSource } from "./database/data-source";

const app = express();
async function bootstrap(): Promise<void> {
  try {
    // Connexion à la base de donnée (Attente de la connexion avant de passer à la suite)
    await AppDataSource.initialize().then(() => {
      console.log("DB connected");
    });
    // Start Express server
    const server = app.listen(5001, () => {
      console.log("Server is running!");
    });

    console.log(
      `Server is running, GraphQL Playground available at http://localhost:5001`
    );
  } catch (error) {
    console.log("DB connexion failed");
    console.log(error);
  }
}

// Call the bootstrap function to start the application
bootstrap();
=======
import express, { Request, Response, NextFunction } from "express";
import cors from "cors";
import * as http from "http";
import { Server, Socket } from "socket.io";
import usersRoutes from "./controllers/users.controller"; // Importez les routes des utilisateurs
import conversationsRoutes from "./controllers/conversations.controller"; // Importez les routes des conversations

const app = express();
const server = http.createServer(app);
const io = new Server(server, {
  cors: {
    origin: "*",
    methods: ["GET", "POST"],
    credentials: true,
    allowedHeaders: ["Content-Type"],
  },
});

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
const port = process.env.PORT || 5001;

app.get('/test', (req, res) => {
  res.send('Hello, World!');
});

// Montez les routes des utilisateurs et des conversations sur votre application
app.use("/api/users", usersRoutes);
app.use("/api/conversations", conversationsRoutes);


app.use((err: Error, req: Request, res: Response, next: NextFunction) => {
  console.error(err);
  res
    .status(500)
    .send({ message: "Something went wrong", error: err.message });
});

let users: { userId: string; socketId: string }[] = [];
io.on("connection", (socket: Socket) => {
  socket.on("addUser", async (userId: string) => {
    const isUserExist = users.find((user) => user.userId === userId);
    if (!isUserExist) {
      const user = { userId, socketId: socket.id };
      users.push(user);
      io.emit("getUsers", users);
    }
  });
  socket.on("disconnect", () => {
    users = users.filter((user) => user.socketId !== socket.id);
    io.emit("getUsers", users);
    io.emit("disconnectUser");
  });

  socket.on("userDeleted", () => {
    users = users.filter((user) => user.socketId !== socket.id);
    io.emit("getUsersWhenOneDeleted", users);
  });

  socket.on("userCreatedOrUpdate", () => {
    io.emit("getUsersWhenOneCreatedOrUpdate");
  });
});

/* mysqlPool
  .query("SELECT 1")
  .then(() => {
    console.log("DB connected");
    server.listen(port, async () => {
      console.log(`Server started on http:localhost:${port}`);
    });
  })
  .catch((error:Error) => console.error("DB connection failed :", error));
 */


app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
>>>>>>> Stashed changes
