#include "ros/ros.h"
#include "std_msgs/String.h"
#include "question_one/input.h"
#include "question_one/output.h"
#include <sstream>

/**
 * This tutorial demonstrates simple sending of messages over the ROS system.
 */


float temp_x=0, temp_y=0, temp_z = 0;
void inputCallback(const question_one::input::ConstPtr& msg){

  float  x, y, z;
  temp_x = msg->vector[0];
  temp_y = msg->vector[1];
  temp_z = msg->vector[2];


  //rotate in x
  y = temp_y;
  z = temp_z;
  temp_y = (y * cos(msg->angles[0])) - (z * sin(msg->angles[0]));
  temp_z = (y * sin(msg->angles[0])) + (z * cos(msg->angles[0]));


  //rotate in y
  x = temp_x;
  z = temp_z;
  temp_x = (x * cos(msg->angles[1])) + (z * sin(msg->angles[1]));
  temp_z = (z * cos(msg->angles[1])) - (x * sin(msg->angles[1]));

  //rotate in z
  x = temp_x;
  y = temp_y;
  temp_x = (y * sin(msg->angles[2])) - (x * cos(msg->angles[2]));
  temp_y = (y * cos(msg->angles[2])) + (x * sin(msg->angles[2]));

  //translate d in x
  temp_x += msg->d;


}
int main(int argc, char **argv)
{
  /**
   * The ros::init() function needs to see argc and argv so that it can perform
   * any ROS arguments and name remapping that were provided at the command line.
   * For programmatic remappings you can use a different version of init() which takes
   * remappings directly, but for most command-line programs, passing argc and argv is
   * the easiest way to do it.  The third argument to init() is the name of the node.
   *
   * You must call one of the versions of ros::init() before using any other
   * part of the ROS system.
   */
  ros::init(argc, argv, "talker");

  /**
   * NodeHandle is the main access point to communications with the ROS system.
   * The first NodeHandle constructed will fully initialize this node, and the last
   * NodeHandle destructed will close down the node.
   */
  ros::NodeHandle n;

  /**
   * The advertise() function is how you tell ROS that you want to
   * publish on a given topic name. This invokes a call to the ROS
   * master node, which keeps a registry of who is publishing and who
   * is subscribing. After this advertise() call is made, the master
   * node will notify anyone who is trying to subscribe to this topic name,
   * and they will in turn negotiate a peer-to-peer connection with this
   * node.  advertise() returns a Publisher object which allows you to
   * publish messages on that topic through a call to publish().  Once
   * all copies of the returned Publisher object are destroyed, the topic
   * will be automatically unadvertised.
   *
   * The second parameter to advertise() is the size of the message queue
   * used for publishing messages.  If messages are published more quickly
   * than we can send them, the number here specifies how many messages to
   * buffer up before throwing some away.
   */
  ros::Publisher chatter_pub = n.advertise<question_one::output>("chatter", 1000);

  ros::Rate loop_rate(10);

  /**
   * A count of how many messages we have sent. This is used to create
   * a unique string for each message.
   */
    ros::Subscriber sub = n.subscribe("transformer", 1000, inputCallback);

  while (ros::ok())
  {
    /**
     * This is a message object. You stuff it with data, and then publish it.
     */
    question_one::output msg;
    msg.x = temp_x;
    msg.y = temp_y;
    msg.z = temp_z;


    /**
     * The publish() function is how you send messages. The parameter
     * is the message object. The type of this object must agree with the type
     * given as a template parameter to the advertise<>() call, as was done
     * in the constructor above.
     */
    chatter_pub.publish(msg);

    ros::spinOnce();

    loop_rate.sleep();
  }


  return 0;
}