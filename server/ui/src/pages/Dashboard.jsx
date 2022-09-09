import React from "react";
import DefaultLayout from "../layout/DefaultLayout";
import ProtectedRoute from "../routes/ProtectedRoute";
import DashboardLayout from "../layout/DashboardLayout";

const Dashboard = () => {
  return (
    <ProtectedRoute>
      <DefaultLayout>
        <DashboardLayout>
          <div className="flex flex-col">
            <div className="flex flex-col lg:flex-row justify-around flex-grow min-h-[500px] lg:min-h-[700px]">
              <div className="flex flex-col flex-grow border">
                <div className="flex flex-grow border">
                  <div className="flex flex-grow border"></div>
                  <div className="flex flex-grow border"></div>
                </div>
                <div className="flex-grow border"></div>
              </div>
              <div className="flex flex-col lg:flex-row flex-grow border">
                <div className="flex flex-grow border"></div>
                <div className="flex flex-col flex-grow border">
                  <div className="flex flex-grow border"></div>
                  <div className="flex flex-grow border"></div>
                  <div className="flex flex-grow border"></div>
                </div>
              </div>
            </div>
            <div className="flex justify-around min-h-[500px] border"></div>
            <div className="flex justify-around min-h-[500px] border"></div>
          </div>
        </DashboardLayout>
      </DefaultLayout>
    </ProtectedRoute>
  );
};
export default Dashboard;
