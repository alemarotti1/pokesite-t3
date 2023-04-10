import { type NextPage } from "next";
import Head from "next/head";
import Link from "next/link";

import { signIn, signOut, useSession } from "next-auth/react";

import { api } from "~/utils/api";
import { Query } from "@tanstack/react-query";

const Map: NextPage = () => {
    const hello = api.example.hello.useQuery({ text: "from tRPC" });
    const session = useSession();
    //if not logged in, redirect to login page
    if(!session.data) signIn();
    return (
    <>
        <Head>
            <title>Create T3 App</title>
            <meta name="description" content="Generated by create-t3-app" />
            <link rel="icon" href="/favicon.ico" />
        </Head>
        <nav className="bg-slate-700 p-4 text-white font-bold flex justify-around">
            <Link href="/"> Home </Link>
            <Link href="/map"> Map </Link>
        </nav>
        <main className="flex min-h-screen flex-col items-center justify-center bg-gray-400">
            
        </main>
    </>
    );
};

export default Map;