// Generated by gencpp from file question_one/output.msg
// DO NOT EDIT!


#ifndef QUESTION_ONE_MESSAGE_OUTPUT_H
#define QUESTION_ONE_MESSAGE_OUTPUT_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace question_one
{
template <class ContainerAllocator>
struct output_
{
  typedef output_<ContainerAllocator> Type;

  output_()
    : x(0.0)
    , y(0.0)
    , z(0.0)  {
    }
  output_(const ContainerAllocator& _alloc)
    : x(0.0)
    , y(0.0)
    , z(0.0)  {
  (void)_alloc;
    }



   typedef double _x_type;
  _x_type x;

   typedef double _y_type;
  _y_type y;

   typedef double _z_type;
  _z_type z;





  typedef boost::shared_ptr< ::question_one::output_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::question_one::output_<ContainerAllocator> const> ConstPtr;

}; // struct output_

typedef ::question_one::output_<std::allocator<void> > output;

typedef boost::shared_ptr< ::question_one::output > outputPtr;
typedef boost::shared_ptr< ::question_one::output const> outputConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::question_one::output_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::question_one::output_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::question_one::output_<ContainerAllocator1> & lhs, const ::question_one::output_<ContainerAllocator2> & rhs)
{
  return lhs.x == rhs.x &&
    lhs.y == rhs.y &&
    lhs.z == rhs.z;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::question_one::output_<ContainerAllocator1> & lhs, const ::question_one::output_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace question_one

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::question_one::output_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::question_one::output_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::question_one::output_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::question_one::output_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::question_one::output_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::question_one::output_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::question_one::output_<ContainerAllocator> >
{
  static const char* value()
  {
    return "4a842b65f413084dc2b10fb484ea7f17";
  }

  static const char* value(const ::question_one::output_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x4a842b65f413084dULL;
  static const uint64_t static_value2 = 0xc2b10fb484ea7f17ULL;
};

template<class ContainerAllocator>
struct DataType< ::question_one::output_<ContainerAllocator> >
{
  static const char* value()
  {
    return "question_one/output";
  }

  static const char* value(const ::question_one::output_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::question_one::output_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 x\n"
"float64 y\n"
"float64 z\n"
;
  }

  static const char* value(const ::question_one::output_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::question_one::output_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.x);
      stream.next(m.y);
      stream.next(m.z);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct output_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::question_one::output_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::question_one::output_<ContainerAllocator>& v)
  {
    s << indent << "x: ";
    Printer<double>::stream(s, indent + "  ", v.x);
    s << indent << "y: ";
    Printer<double>::stream(s, indent + "  ", v.y);
    s << indent << "z: ";
    Printer<double>::stream(s, indent + "  ", v.z);
  }
};

} // namespace message_operations
} // namespace ros

#endif // QUESTION_ONE_MESSAGE_OUTPUT_H