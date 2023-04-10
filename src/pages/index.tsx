import { type NextPage } from "next";
import Head from "next/head";
import Link from "next/link";
import { signIn, signOut, useSession } from "next-auth/react";

import { api } from "~/utils/api";
import Layout from "./layout";

const Home: NextPage = () => {
  const hello = api.example.hello.useQuery({ text: "from tRPC" });
  const { data: session } = useSession();

  return( 
    <Layout key={"oi"}>
      <h1 className="text-4xl font-bold text-white">   App!</h1>
      <button onClick={() => signOut()}>Sign out</button> 
    </Layout>
  );

};



export default Home;