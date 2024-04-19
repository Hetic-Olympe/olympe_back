import express, { Request, Response } from "express";

import * as service from "../services/roles.service";

const router = express.Router();

router.post("/create", async (req: Request, res: Response) => {
  try {
    const roleData = req.body;
    await service.createRole(roleData);

    res.status(201).send({ success: "Your role successfully created" });
  } catch (error: any) {
    console.error(error);
    switch (error.message) {
      case "ER_DUP_ENTRY":
        error.message = "This role is already existed";
        break;
      default:
        error.message = "An error occurred";
        break;
    }
    res.status(400).send({ error: error.message });
  }
});

export default router;
