const express = require("express");
const router = express.Router();
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

const service = require("../services/users.service");

router.get("/", async (req, res) => {
  try {
    const users = await service.getUsers();
    const usersData = users.map((user) => {
      return { id: user.id, full_name: user.full_name, email: user.email };
    });
    res.status(200).send(usersData);
  } catch (error) {
    console.error(error);
    res.status(400).send({ error: error.message });
  }
});

router.get("/:id", async (req, res) => {
  try {
    const user = await service.getUserById(req.params.id);
    if (user === undefined) {
      throw new Error("This user can't be found");
    }
    res.status(200).send(user);
  } catch (error) {
    res.status(404).send({ error: error.message });
  }
});

router.delete("/:id", async (req, res) => {
  try {
    const affectedRows = await service.deleteUserById(req.params.id);
    if (affectedRows === 0) {
      throw new Error("This user can't be deleted");
    }
    res.status(200).send({ success: "Deleted successfully" });
  } catch (error) {
    res.status(404).send({ error: error.message });
  }
});

router.post("/sign-up", async (req, res) => {
  try {
    const data = req.body;
    const hashedPassword = await bcrypt.hash(data.password, 10);

    if (!hashedPassword) {
      throw new Error();
    }

    data.password = hashedPassword;
    const affectedRows = await service.createUser(data);

    if (affectedRows === 0) {
      throw new Error("This user can't be added");
    }

    res.status(201).send({ success: "Votre compte à été créer avec succès" });
  } catch (error) {
    if (error.message.includes("email_UNIQUE")) {
      error.message = "Cette adress email est déjà liée à un compte";
    }

    if (error.message.includes("full_name_UNIQUE")) {
      error.message = "Ce nom est déjà utilisé";
    }

    res.status(404).send({ error: error.message });
  }
});

router.put("/:id", async (req, res) => {
  try {
    const data = req.body;
    const id = req.params.id;
    const user = await service.getUserById(id);

    console.log(data);

    if (user === undefined) {
      throw new Error("User not found");
    }

    let updatedData = { ...data };

    if (data.password) {
      const newHashedPassword = await bcrypt.hash(data.password, 10);

      if (newHashedPassword) {
        updatedData = { ...data, password: newHashedPassword };
      } else {
        throw new Error();
      }
    }

    const affectedRows = await service.updateUser(
      { ...user, ...updatedData },
      id
    );

    if (affectedRows === 0) {
      throw new Error("This user can't be updated");
    }

    res.status(200).send({ success: "User updated successfully" });
  } catch (error) {
    if (error.message.includes("email_UNIQUE")) {
      error.message = "Cette adress email est déjà liée à un compte";
    }

    if (error.message.includes("full_name_UNIQUE")) {
      error.message = "Ce nom est déjà utilisé";
    }

    res.status(404).send({ error: error.message });
  }
});

router.post("/sign-in", async (req, res) => {
  try {
    const data = req.body;
    const user = await service.getUserByEmail(data.email);

    if (user === undefined) {
      throw new Error("Mauvais identifiants");
    }

    const verifyPassword = await bcrypt.compare(data.password, user.password);

    if (!verifyPassword) {
      throw new Error("Mauvais identifiants");
    }

    const payload = { userId: user.id, email: user.email };
    const JWT_SECRET = process.env.JWT_SECRET || "THIS_IS_A_JWT_SECRET_KEY";
    const token = jwt.sign(payload, JWT_SECRET, { expiresIn: 846000 });

    const affectedRows = await service.updateUser(
      { ...user, token: token },
      user.id
    );

    if (affectedRows === 0) {
      throw new Error("This user can't be updated");
    }

    res.status(200).send({
      success: "User loggin",
      user: {
        id: user.id,
        email: user.email,
        full_name: user.full_name,
        password: user.password,
        token: user.token,
      },
    });
  } catch (error) {
    console.error(error);
    res.status(404).send({ error: error.message });
  }
});

module.exports = router;
