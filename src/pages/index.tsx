import { type NextPage } from "next";
import Head from "next/head";
import Link from "next/link";
import { signIn, signOut, useSession } from "next-auth/react";

import { api } from "~/utils/api";
import Layout from "./layout";

const Home: NextPage = () => {
  const hello = api.example.hello.useQuery({ text: "from tRPC" });
  const { data: session } = useSession()

  if(session) return (
    <Layout key={"oi"}>
        <h1 className="text-4xl font-bold text-white">Welcome to T3 App!</h1>  
        <h2>Signed in as {session.user.email}</h2><br/>
        <button onClick={() => signOut()}>Sign out</button>  
    </Layout>
  );
  return (
    <Layout key={"oi"}>
      <div className="w-full h-screen flex items-center">
        <div className="md:bg-emerald-400 md:w-4/5 md:h-4/5 w-full h-full flex md:flex-row flex-col items-center mx-auto rounded-xl">  
          <div className="flex md:w-7/12 md:h-full flex-row items-center text-center md:bg-[url('/img/background2.png')] bg-bottom m-auto" >
            <div className="md:w-full md:h-full backdrop-blur-md md:bg-slate-700/30 flex flex-col items-center">
              <h1 className="text-3xl font-black font-serif md:text-rose-600 text-slate-900 m-auto md:bg-slate-900/60 p-5 rounded-lg md:block hidden">Welcome to our cozy abode<br/>Hope you have fun</h1>
              <h1 className="text-3xl font-black font-serif md:text-rose-600 text-slate-900 m-auto md:bg-slate-900/60 p-5 rounded-lg md:hidden">Please sign in to continue</h1>
              <img className="md:w-1/2 m-auto w-40 p-3" src="/img/pokeball.png" alt="logo" />
            </div>
          </div>
          <div className="md:w-5/12 p-2 m-auto">
            <div className="flex flex-col w-full items-center p-4 m-auto">
              <h1 className="text-3xl font-bold text-slate-900 md:block hidden py-5">Login</h1>
              <input className="w-full m-2 p-2 rounded bg-slate-700 text-white border-slate-800 border-2" type="email" placeholder="Email" />
              <input className="w-full m-2 p-2 rounded bg-slate-700 text-white border-slate-800 border-2"  type="password" placeholder="Password" />
              <button className="w-2/4 m-2 p-2 rounded text-white font-extrabold border-pink-900 bg-blue-800 hover:bg-pink-900 border-2" onClick={() => signIn()}>Sign in</button>
              <div className="bg-slate-500/20 backdrop-blur-0 rounded-lg m-4">
                <Link className="p-5 text-slate -900 font-bold blur-none" href="/signup">Register</Link>
              </div>
            </div>
          </div>
        </div> 
      </div>
    </Layout>
    );


};

export default Home;