#include <functional>
#include <gazebo/gazebo.hh>
#include <gazebo/physics/physics.hh>
#include <gazebo/common/common.hh>
#include <ignition/math/Vector3.hh>
#include <iostream>
#include "ros/ros.h"
#include <sensor_msgs/JointState.h>
#include "arm_lib/Fk.h"
#include "arm_lib/Ik.h"
#include "arm_lib/position_message.h"


namespace gazebo
{
	class ModelPush : public ModelPlugin
	{

	private:
		void inputCallback(const sensor_msgs::JointState::ConstPtr& msg){
			//set all the angles

			auto position = msg->position;

			std::string joint2 = this->model->GetJoint("arm1_arm2_joint")->GetScopedName();
			this->jointController->SetPositionPID(joint2, common::PID(30.1, 10.01, 10.03));
			this->jointController->SetPositionTarget(joint2, position[0]);

			std::string joint1 = this->model->GetJoint("chasis_arm1_joint")->GetScopedName();
			this->jointController->SetPositionPID(joint1, common::PID(30.1, 10.01, 10.03));
			this->jointController->SetPositionTarget(joint1, position[2]);

			std::string joint3 = this->model->GetJoint("arm2_arm3_joint")->GetScopedName();
			this->jointController->SetPositionPID(joint3, common::PID(30.1, 10.01, 10.03));
			this->jointController->SetPositionTarget(joint3, position[0]);

			std::string joint4 = this->model->GetJoint("arm3_arm4_joint")->GetScopedName();
			this->jointController->SetPositionPID(joint4, common::PID(30.1, 10.01, 10.03));
			this->jointController->SetPositionTarget(joint4, position[0]);
			
			
			
			this->jointController->Update();


		}
	public:
		void positionCallback(const arm_lib::position_message &msg)
		{
			ROS_INFO("Received %f %f %f", msg.x, msg.y, msg.z);
			arm_lib::Ik srv;
			srv.request.link_lengths = {0.1,0.05,2,1,0.5,0.04};
			srv.request.joint_positions = {0, 0, 0, 0, 0, 0};
			srv.request.positions = {msg.x, msg.y, msg.z};
			for (int i = 0; i < jointList.size() - 4; i++)
			{
				srv.request.joint_positions[i] = physics::JointState(jointList[i]).Position(0);
			}

			if (ik_client.call(srv))
			{				
				ROS_INFO("Ik: [%f, %f, %f, %f, %f, %f]", srv.response.target_positions[0], srv.response.target_positions[1], srv.response.target_positions[2], srv.response.target_positions[3], srv.response.target_positions[4], srv.response.target_positions[5]);

				for (int i = 0; i < jointList.size() - 4; i++)
				{
					jointController->SetPositionTarget(jointList[i]->GetScopedName(), srv.response.target_positions[i]);
				}
			}
			else
			{
				ROS_ERROR("Failed to call service ik");
			}
		}

	public:
		void Load(physics::ModelPtr _parent, sdf::ElementPtr /*_sdf*/)
		{

//			sub = n.subscribe("input", 1000, &ModelPush::inputCallback, this);
//
		//	int x = 0;
  		//	ros::init(x, NULL, "controller");
			
			//this->pub = n.advertise<sensor_msgs::JointState>("angles", 1000);


			// Store the pointer to the model
			this->model = _parent;

			// // intiantiate the joint controller
			this->jointController = this->model->GetJointController();

			// // set your PID values
			this->pid = common::PID(400.0, 100.0, 100.0);
			std::string name = this->model->GetJoint("arm1_arm2_joint")->GetScopedName();
			this->jointController->SetPositionPID(name, common::PID(30.1, 10.01, 10.03));
			jointController->SetPositionPID(model->GetJoint("arm6_arm7_joint")->GetScopedName(), this->pid2);
			jointController->SetPositionPID(model->GetJoint("arm6_arm8_joint")->GetScopedName(), this->pid2);

			jointController->SetPositionTarget(model->GetJoint("arm1_arm2_joint")->GetScopedName(), -0.4);
			jointController->SetPositionTarget(model->GetJoint("arm6_arm7_joint")->GetScopedName(), -0.7);
			jointController->SetPositionTarget(model->GetJoint("arm6_arm8_joint")->GetScopedName(), 0.7);
      		ros::init(0, NULL, "inverse_controller");

			// Listen to the update event. This event is broadcast every
			// simulation iteration.
			sub = n.subscribe("/positions", 1000, &ModelPush::positionsCallback, this);

			fk_client = n.serviceClient<arm_lib::Fk>("fk");
			ik_client = n.serviceClient<arm_lib::Ik>("ik");

			ros::spinOnce();
			this->updateConnection = event::Events::ConnectWorldUpdateBegin(
				std::bind(&ModelPush::OnUpdate, this));
		}
		void fk(double a1, double a2, double a3, double a4, double a5, double a6)
		{
			arm_lib::Fk srv;
			srv.request.link_lengths = {0.05, 2, 1, 0.5, 0.02, 0.02};
			srv.request.joint_positions = {a1, a2, a3, a4, a5, a6};

			if (fk_client.call(srv))
			{
				ROS_INFO("Fk: [%f, %f, %f]", srv.response.position[0], srv.response.position[1], srv.response.position[2]);
			}
			else
			{
				ROS_ERROR("Failed to call service fk");
			}
		}

		// Called by the world update start event
	public:
		void OnUpdate()
		{
			float angleDegree = -90;
			float rad = M_PI * angleDegree / 180;

			std::string name = this->model->GetJoint("arm1_arm2_joint")->GetScopedName();
			// this->jointController->SetPositionPID(name, pid);
			// this->jointController->SetPositionTarget(name, rad);
			// this->jointController->Update();

			// Get joint position by index. 
			// 0 returns rotation accross X axis
			// 1 returns rotation accross Y axis
			// 2 returns rotation accross Z axis
			// If the Joint has only Z axis for rotation, 0 returns that value and 1 and 2 return nan

			double a1 = physics::JointState(this->model->GetJoint("chasis_arm1_joint")).Position(0);
			double a2 = physics::JointState(this->model->GetJoint("arm1_arm2_joint")).Position(0);
			double a3 = physics::JointState(this->model->GetJoint("arm2_arm3_joint")).Position(0);
			double a4 = physics::JointState(this->model->GetJoint("arm3_arm4_joint")).Position(0);
			double a5 = physics::JointState(this->model->GetJoint("arm4_arm5_joint")).Position(0);
			double a6 = physics::JointState(this->model->GetJoint("arm5_arm6_joint")).Position(0);
			fk(a1, a2, a3, a4, a5, a6);

			ros::spinOnce();
			// std::cout << "Current arm1_arm2_joint values: " << a1 * 180.0 / M_PI << std::endl;

			// sensor_msgs::JointState jj;
		

			// jj.position.resize(4);

			// jj.position.at(0) = a1 * 180.0 / M_PI;
			// jj.position.at(1) = a2 * 180.0 / M_PI;
			// jj.position.at(2) = a3 * 180.0 / M_PI;
			// jj.position.at(3) = a4 * 180.0 / M_PI;

			// this->pub.publish(jj);
			
		}

		// a pointer that points to a model object
	private:
		physics::ModelPtr model;
		ros::NodeHandle n;
		ros::Subscriber sub;
		ros::Publisher pub;
		ros::ServiceClient fk_client;

		ros::ServiceClient ik_client;

		// 	// A joint controller object
		// 	// Takes PID value and apply angular velocity
		// 	//  or sets position of the angles
	private:
		physics::ModelPtr model;

		physics::JointControllerPtr jointController;
	private:
		physics::JointControllerPtr jointController;
		

	private:
		event::ConnectionPtr updateConnection;

		// // 	// PID object
	private:
		common::PID pid;
	};

	// Register this plugin with the simulator
	GZ_REGISTER_MODEL_PLUGIN(ModelPush)
}
