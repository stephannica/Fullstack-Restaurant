import { InfoIcon } from "lucide-react";
import Link from "next/link";

const HomePage = () => {
  return (
    <div className="flex h-screen items-center justify-center">
      <div className="space-y-4 rounded-lg bg-gray-100 p-6 text-center shadow-lg">
          <InfoIcon className="m-auto"/> 
        <h1 className="font-bold" >
          Este projeto está inicialmente em resolução para celular 
        </h1>
        <h1 className="text-lg">
          Olá, caso você tenha vindo para este link, para acessar o restaurante,
          digite na URL <span className="font-bold">/fsw-donalds</span>.
        </h1>
        <h2 className="text-lg font-semibold">ou clique aqui ↓</h2>
        <div>
            <Link
            href="https://stephannica-fullstack-restaurant.vercel.app/fsw-donalds"
            className="inline-block rounded-full border border-gray-300 bg-white px-5 py-2.5 text-gray-900 transition hover:bg-gray-500 hover:text-white"
            >
            Acessar Restaurante
            </Link>
        </div>
      </div>
    </div>
  );
};

export default HomePage;
