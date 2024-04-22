import { Request, Response, NextFunction } from "express";
import jwt, { JwtPayload } from "jsonwebtoken";
import { RoleEnum } from "../enums/RoleEnum";
import * as service from "../services/users.service";

export const authMiddleware = (roles?: RoleEnum[]) => {
  console.log("HELLO FROM AUTH");
  return async (req: Request, res: Response, next: NextFunction) => {
    const token = req.headers.authorization?.split(" ")[1];

    if (!token) {
      return res.status(401).json({ error: "Missing authorization token" });
    }

    try {
      const JWT_SECRET = "THIS_IS_A_JWT_SECRET_KEY";
      const decodedToken = jwt.verify(token, JWT_SECRET);

      console.log("DECODED TOKEN", decodedToken);
      if (typeof decodedToken === "string") {
        throw new Error("Invalid token");
      }

      const user = await service.getUserById(decodedToken.userId);

      if (user === null) {
        throw new Error("No user found");
      }

      if (roles && roles.length > 0) {
        if (!roles.includes(user.role.libel)) {
          throw new Error("Roles not authorized");
        }
      }

      req.user = user;
      next();
    } catch (error: any) {
      console.log(error.message);
      return res.status(401).json({ message: "Not authorized" });
    }
  };
};
