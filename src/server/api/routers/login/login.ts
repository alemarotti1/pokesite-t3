import { z } from "zod";

import {
  createTRPCRouter,
  publicProcedure,
  protectedProcedure,
} from "~/server/api/trpc";

export const loginRouter = createTRPCRouter({
  login: publicProcedure
    .input(z.object({ user: z.string(), password: z.string() }))
    .query(({ input }) => {

      return {
        value: input.user
      };
    }),
});
