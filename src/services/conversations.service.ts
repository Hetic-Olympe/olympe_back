import { Pool, RowDataPacket, OkPacket } from "mysql2/promise";
import { Conversation } from "../types/conversation";

const mysqlPool: Pool = require("../database/config");

export const getConversations = async (): Promise<Conversation[]> => {
  const [results] = await mysqlPool.query(
    "SELECT * FROM Conversations C INNER JOIN Conversations_To_Users CTU ON CTU.conversation_id = C.id INNER JOIN Users U ON U.id = CTU.id "
  );
  return results as Conversation[];
};

export const getConversationsByUserId = async (id: number): Promise<Conversation[]> => {
  const [results] = await mysqlPool.query(
    "SELECT * FROM Conversations WHERE user_id_1 = ? OR user_id_2 = ? ",
    [id, id]
  );
  return results as Conversation[];
};

export const createConversation = async (data: Conversation): Promise<number> => {
  const [result] = await mysqlPool.query<OkPacket>(
    "INSERT INTO Conversations (user_id_1, user_id_2, created_at, updated_at) VALUES (?, ?, ?, ?)",
    [data.user_id_1, data.user_id_2, data.created_at, data.updated_at]
  );
  return result.insertId!;
};
