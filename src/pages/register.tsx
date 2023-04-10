import { type NextPage } from "next";
import Head from "next/head";
import Link from "next/link";
import { signIn, signOut, useSession } from "next-auth/react";

import { api } from "~/utils/api";
import Layout from "./layout";




const Register: NextPage = () => {
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
      <div className="w-full min-h-screen flex items-center">
        <div className="flex flex-col items-center md:w-2/6 md:h-5/6  w-full h-full mx-auto border-emerald-600 md:border-2 bg-slate-400 md:rounded-2xl shadow-lg shadow-emerald-600 ">
            <img className="max-h-40 max-w-full pt-8 p-5" src="/img/pokeball.png" alt="logo" />
            <form className="h-auto w-11/12 p-7 flex flex-col items-center" action="">
                <h1 className="text-3xl font-bold py-5 my-auto">Please, fill your details</h1>
                
                <input className="w-full m-2 p-2 rounded bg-slate-700 text-white border-slate-800 border-2" type="name" placeholder="Name" />
                <input className="w-full m-2 p-2 rounded bg-slate-700 text-white border-slate-800 border-2" type="email" placeholder="Email" />
                <input className="w-full m-2 p-2 rounded bg-slate-700 text-white border-slate-800 border-2"  type="password" placeholder="Password" />
                <input className="w-full m-2 p-2 rounded bg-slate-700 text-white border-slate-800 border-2"  type="password" placeholder="Confirm Password" />
                <button id="register" type="submit" onClick={()=>{}} className="w-2/4 m-2 p-2 rounded text-white font-extrabold border-pink-900 bg-blue-800 hover:bg-pink-900 border-2">Register</button>
            </form>
            <div className="mb-auto pb-4">
                <p>Already have an account? <Link href="/" className="text-blue-800 font-bold">Login</Link></p>
            </div>
        </div>
      </div>
    </Layout>
    );


};

export default Register;