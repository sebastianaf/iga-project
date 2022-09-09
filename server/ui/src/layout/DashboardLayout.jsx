import React from "react";

const DashboardLayout = ({children}) => {
  return (
    <div className={`flex justify-center items-start w-full `}>
      <div className={`flex flex-row flex-wrap max-w-[1280px] w-full`}>
        <div
          className={`p-1 md:p-2 w-full h-auto`}
        >
          <div
            className={`w-full h-full`}
          >
            {children}
          </div>
        </div>
      </div>
    </div>
  );
};

export default DashboardLayout;
