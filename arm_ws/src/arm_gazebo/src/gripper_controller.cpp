#include <ros/ros.h>
#include <functional>
#include <gazebo/gazebo.hh>
#include <gazebo/physics/physics.hh>
#include <gazebo/common/common.hh>
#include <ignition/math/Vector3.hh>
#include <iostream>
#include "ros/ros.h"
#include "arm_lib/gripper_message.h"
namespace gazebo
{
	class GripperController : public ModelPlugin
	{
   public:
		  void commandCallback(const arm_lib::gripper_message &msg){
        std::string cmd_name = msg->command_name;
        std::string arm6_arm8 = this->model->GetJoint("arm6_arm8_joint")->GetScopedName();
			  std::string arm6_arm7 = this->model->GetJoint("arm6_arm7_joint")->GetScopedName();
        ROS_INFO("<<<<<<<command>>>>>>" cmd_name.c_str());
        if (cmd_name == "catch")
			  {
				  this->jointController->SetPositionTarget(arm6_arm8, -0.4);
				  this->jointController->SetPositionTarget(arm6_arm7, 0.4);
		  	}
			  else if (cmd_name == "release")
			  {
				this->jointController->SetPositionTarget(arm6_arm8, 0.7);
				this->jointController->SetPositionTarget(arm6_arm7, -0.7);
			  }
      }
    public:
		  void Load(physics::ModelPtr _parent, sdf::ElementPtr /*_sdf*/)
		{
      ros::init(0, NULL, "rosController");
      sub = n.subscribe("grip_chatter", 1000, &GripperController::commandCallback, this);
			ros::spinOnce();


			// Store the pointer to the model
			this->model = _parent;
	    // intiantiate the joint controller
			this->jointController = this->model->GetJointController();
      this->updateConnection = event::Events::ConnectWorldUpdateBegin(
				std::bind(&GripperController::OnUpdate, this));

    }
    	// Called by the world update start event
	  public:
		  void OnUpdate()
		{
        ros::spinOnce();

    }
    private:
		physics::ModelPtr model;

		physics::JointControllerPtr jointController;

		event::ConnectionPtr updateConnection;

		ros::NodeHandle n;

		ros::Subscriber sub;
	};

	GZ_REGISTER_MODEL_PLUGIN(GripperController)
  
}

