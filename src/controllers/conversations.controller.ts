import express, { Request, Response } from "express";
import * as service from "../services/conversations.service";
import * as serviceUser from "../services/users.service";

const router = express.Router();

router.get("/", async (req: Request, res: Response) => {
  try {
    const conversations = await service.getConversations();
    res.status(200).send(conversations);
  } catch (error: any) {
    console.error(error);
    res.status(400).send({ error: error.message });
  }
});

router.get("/:userId", async (req: Request, res: Response) => {
  try {
    const user_id: number = parseInt(req.params.userId, 10);
    const conversations = await service.getConversationsByUserId(user_id);
    const conversationsWithUser = await Promise.all(
      conversations.map(async (conversation: any) => {
        const contactId =
          conversation.user_id_1 === Number(user_id)
            ? conversation.user_id_2
            : conversation.user_id_1;

        const contact = await serviceUser.getUserById(contactId);

        if (contact === undefined) {
          throw new Error("User doesn't exist");
        }

        return {
          id: conversation.id,
          contact: {
            id: contact.id,
            email: contact.email,
            full_name: contact.full_name,
          },
        };
      })
    );

    res.status(200).send(conversationsWithUser);
  } catch (error: any) {
    console.error(error);
    res.status(400).send({ error: error.message });
  }
});

router.post("/", async (req: Request, res: Response) => {
  try {
    const data: any = req.body;

    data.created_at = new Date();
    data.updated_at = new Date();

    const insertId = await service.createConversation(data);

    if (!insertId) {
      throw new Error("This conversation can't be added");
    }

    res.status(200).send({ success: "Conversation added successfully" });
  } catch (error: any) {
    console.error(error);
    res.status(400).send({ error: error.message });
  }
});

export default router;
