import express, { Request, Response } from "express";
import * as service from "../../services/users.service";
import { excludeNonUpdatableFields } from "../../utils/excludeNonUpdatableFields";

const router = express.Router();
const isAdmin = true;

router.get("/", async (req: Request, res: Response) => {
    try {
        const users = await service.getUsers();
        res.status(200).send(users);
    } catch (error) {
        res.status(500).send({ error: "An error occurred" });
    }
});

router.get("/:id", async (req: Request, res: Response) => {
    const id = req.params.id;
    try {
        const users = await service.getUserDetail(id, isAdmin);
        res.status(200).send(users);
    } catch (error) {
        res.status(500).send({ error: "An error occurred" });
    }
});

router.patch("/:id", async (req: Request, res: Response) => {
    const id = req.params.id;
    const fieldsToUpdate = excludeNonUpdatableFields(req.body, ['id', 'password', 'createdAt', 'isConnected']);
    try {
        const updatedUser = await service.updateUser(id, fieldsToUpdate, isAdmin);
        res.status(200).send(updatedUser);
    } catch (error) {
        res.status(500).send({ error: "An error occurred while updating the user." });
    }
});


export default router;
