import React from "react";

import Spinner from "../components/Spinner";
import logo from "../assets/img/logo.png";

const Loading = () => {
  return (
    <div className="duration-500">
      <div className="flex flex-col justify-center items-center h-screen bg-slate-100">
        <div>
          <img className="max-h-[64px] mb-2" src={logo} alt="logo" />
        </div>
        <div className="flex justify-center items-center">
          <Spinner loading />
        </div>
      </div>
    </div>
  );
};

export default Loading;
