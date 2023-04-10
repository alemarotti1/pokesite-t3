import { type GetServerSidePropsContext } from "next";
import {
  getServerSession,
  type NextAuthOptions,
  type DefaultSession,
} from "next-auth";
import { PrismaAdapter } from "@next-auth/prisma-adapter";
import { prisma } from "~/server/db";
import CredentialsProvider from "next-auth/providers/credentials";
import GoogleProvider from "next-auth/providers/google";

/**
 * Module augmentation for `next-auth` types. Allows us to add custom properties to the `session`
 * object and keep type safety.
 *
 * @see https://next-auth.js.org/getting-started/typescript#module-augmentation
 */
declare module "next-auth" {
  interface Session extends DefaultSession {
    user: {
      id: string;
      name: string;
      master: boolean;
    } & DefaultSession["user"];
  }
}

/**
 * Options for NextAuth.js used to configure adapters, providers, callbacks, etc.
 *
 * @see https://next-auth.js.org/configuration/options
 */
export const authOptions: NextAuthOptions = {
  callbacks: {
    session({ session, user }) {
      if (session.user) {
        session.user.id = user.id;
      }
      return session;
    },
  },
  adapter: PrismaAdapter(prisma),
  providers: [
    // CredentialsProvider({
    //   // The name to display on the sign in form (e.g. "Sign in with...")
    //   name: "user and password",
    //   // `credentials` is used to generate a form on the sign in page.
    //   // You can specify which fields should be submitted, by adding keys to the `credentials` object.
    //   // e.g. domain, username, password, 2FA token, etc.
    //   // You can pass any HTML attribute to the <input> tag through the object.
    //   credentials: {
    //     username: { label: "Username", type: "text", placeholder: "Digite seu usuário"},
    //     password: { label: "Password", type: "password", placeholder: "Digite sua senha"},
    //   },
    //   authorize: async (credentials) => {
    //     if(!credentials) return null;
    //     if (!credentials.username || !credentials.password) return null;
        
    //     const user = await prisma.player.findMany({
    //       where: {
    //         AND: [
    //           { username: credentials.username },
    //           { password: credentials.password },
    //         ],
    //       },
    //       select: {
    //         username: true,
    //         master: true,
    //       },
    //     });
    //     if (user.length == 0) return null;
        
    //     console.log(user);
        
    //     const returnedUser = user[0];

    //     console.log(user);
    //     if (returnedUser) return {
    //       id: returnedUser.username,
    //       name: returnedUser.username,
    //       master: returnedUser.master==0 ? false : true,
    //     };
    //     return null;

    //   },
    // }),
    GoogleProvider({
      clientId: process.env.GOOGLE_CLIENT_ID ? process.env.GOOGLE_CLIENT_ID : "",
      clientSecret: process.env.GOOGLE_CLIENT_SECRET ? process.env.GOOGLE_CLIENT_SECRET : "",
      profile(profile) {
        return {
          id: profile.id,
        }
      },
    }),
    
  ],  
  theme: {
    brandColor: "#FF0000",
    logo: "/img/pokeball.png",
    colorScheme: "dark",
    buttonText: "Entrar",
  },
};

/**
 * Wrapper for `getServerSession` so that you don't need to import the `authOptions` in every file.
 *
 * @see https://next-auth.js.org/configuration/nextjs
 */
export const getServerAuthSession = (ctx: {
  req: GetServerSidePropsContext["req"];
  res: GetServerSidePropsContext["res"];
}) => {
  return getServerSession(ctx.req, ctx.res, authOptions);
};
