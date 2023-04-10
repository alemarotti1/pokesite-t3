import { type NextPage } from "next";
import Head from "next/head";
import Link from "next/link";
import { signIn, signOut, useSession } from "next-auth/react";

import { api } from "~/utils/api";
import { ElementType, ReactNode } from "react";

interface LayoutProps {
    children: ReactNode;
}


const Nav = () => {
    const hello = api.example.hello.useQuery({ text: "from tRPC" });
    const { data: session } = useSession()
  
    if (!session) return <></>;
    return (
        <nav className="w-full sticky">
            <div className="flex flex-row items-center justify-around h-11 bg-slate-600 text-white font-bold">
                    <Link href="/" className="flex flex-row items-center justify-between"> Home </Link>
                    <Link href="/profile" className="flex flex-row items-center justify-between"> Profile </Link>
                    <Link href="/map" className="flex flex-row items-center justify-between"> Map </Link>
                    
                    <a className="flex flex-row items-center justify-between" onClick={() => signOut()}> Sign out </a>
            </div>
        </nav>
    );
  
  };

export default Nav;