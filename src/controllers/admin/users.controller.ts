import express, { Request, Response } from "express";
import * as service from "../../services/users.service";
import { excludeNonUpdatableFields } from "../../utils/excludeNonUpdatableFields";
import { extractSortsFromFilters } from "../../utils/extractSortsFromFilters";
import { ILike } from "typeorm";
import { extractPaginationFromFilters } from "../../utils/extractPaginationFromFilters";

const router = express.Router();
const isAdmin = true;

router.get("/", async (req: Request, res: Response) => {
  try {
    const where: any = {};
    const filters = req.query;
    const { page, limit, skip } = extractPaginationFromFilters(req);

    // Filter
    if (filters.fullname) {
      where.fullname = ILike(`%${filters.fullname}%`);
    }
    if (filters.roleId) {
      where.role = { id: filters.roleId };
    }
    if (filters.isConnected === "true" || filters.isConnected === "false") {
      where.isConnected = filters.isConnected.toUpperCase();
    }

    const sortableKey = [
      { paramsKey: "fullname", accessKey: "fullname" },
      { paramsKey: "isConnected", accessKey: "isConnected" },
      { paramsKey: "role", accessKey: "role.label" },
    ];

    const { order } = extractSortsFromFilters(req, sortableKey);

    const { users, total } = await service.getUsers(where, skip, limit, order);

    const totalPages = Math.ceil(total / limit);

    res.status(200).send({ users, total, page, totalPages });
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
  const fieldsToUpdate = excludeNonUpdatableFields(req.body, [
    "id",
    "password",
    "createdAt",
    "isConnected",
  ]);
  try {
    const updatedUser = await service.updateUser(id, fieldsToUpdate, isAdmin);
    res.status(200).send(updatedUser);
  } catch (error) {
    res
      .status(500)
      .send({ error: "An error occurred while updating the user." });
  }
});

export default router;
