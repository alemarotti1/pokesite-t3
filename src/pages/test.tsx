import { type NextPage } from "next";
import Head from "next/head";
import Link from "next/link";
import { signIn, signOut, useSession } from "next-auth/react";

import { api } from "~/utils/api";
import Layout from "./layout";
import { redirect } from "next/dist/server/api-utils";
import { useEffect } from "react";
import { useFormik } from "formik";




const Test: NextPage = () => {
    const growth : string = "grow-1";
  return (
      <div className="w-full min-h-screen flex flex-col">
        <div className="flex flex-row w-full">
            <div className="bg-slate-100 text-sky-600 rounded-md p-6">Logo</div>
            <div className="bg-red-400 flex flex-row justify-between p-6 text-white font-bold grow">
                
                <div className="">Home</div>
                <div className="">FAQ</div>
                <div className="">ABOUT US</div>
                <div className="flex flex-row">
                    <input className="rounded-l-md" type="text" />
                    <div className="w-6 bg-blue-600 p-1 rounded-r-md">
                    <svg className="max-h-6" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" transform="rotate(0)matrix(1, 0, 0, 1, 0, 0)" stroke="#e6e6e6"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <path d="M16.6725 16.6412L21 21M19 11C19 15.4183 15.4183 19 11 19C6.58172 19 3 15.4183 3 11C3 6.58172 6.58172 3 11 3C15.4183 3 19 6.58172 19 11Z" stroke="#e6e6e6" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path> </g></svg>
                    </div>
                </div>
                
            </div>
            
        </div>
        <div className="bg-green-500">
            <div>
                <div>
                    titulo
                </div>
                <div>
                    textinho
                </div>
            </div>
            <div>
                <div>
                    botão
                </div>
                <div>
                    redes sociais
                </div>
            </div>
        </div>
      </div>
    );


};

export default Test;