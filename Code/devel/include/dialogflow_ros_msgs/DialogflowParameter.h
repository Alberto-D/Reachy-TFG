// Generated by gencpp from file dialogflow_ros_msgs/DialogflowParameter.msg
// DO NOT EDIT!


#ifndef DIALOGFLOW_ROS_MSGS_MESSAGE_DIALOGFLOWPARAMETER_H
#define DIALOGFLOW_ROS_MSGS_MESSAGE_DIALOGFLOWPARAMETER_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace dialogflow_ros_msgs
{
template <class ContainerAllocator>
struct DialogflowParameter_
{
  typedef DialogflowParameter_<ContainerAllocator> Type;

  DialogflowParameter_()
    : param_name()
    , value()  {
    }
  DialogflowParameter_(const ContainerAllocator& _alloc)
    : param_name(_alloc)
    , value(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _param_name_type;
  _param_name_type param_name;

   typedef std::vector<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > , typename ContainerAllocator::template rebind<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::other >  _value_type;
  _value_type value;





  typedef boost::shared_ptr< ::dialogflow_ros_msgs::DialogflowParameter_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::dialogflow_ros_msgs::DialogflowParameter_<ContainerAllocator> const> ConstPtr;

}; // struct DialogflowParameter_

typedef ::dialogflow_ros_msgs::DialogflowParameter_<std::allocator<void> > DialogflowParameter;

typedef boost::shared_ptr< ::dialogflow_ros_msgs::DialogflowParameter > DialogflowParameterPtr;
typedef boost::shared_ptr< ::dialogflow_ros_msgs::DialogflowParameter const> DialogflowParameterConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::dialogflow_ros_msgs::DialogflowParameter_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::dialogflow_ros_msgs::DialogflowParameter_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::dialogflow_ros_msgs::DialogflowParameter_<ContainerAllocator1> & lhs, const ::dialogflow_ros_msgs::DialogflowParameter_<ContainerAllocator2> & rhs)
{
  return lhs.param_name == rhs.param_name &&
    lhs.value == rhs.value;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::dialogflow_ros_msgs::DialogflowParameter_<ContainerAllocator1> & lhs, const ::dialogflow_ros_msgs::DialogflowParameter_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace dialogflow_ros_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::dialogflow_ros_msgs::DialogflowParameter_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::dialogflow_ros_msgs::DialogflowParameter_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::dialogflow_ros_msgs::DialogflowParameter_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::dialogflow_ros_msgs::DialogflowParameter_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::dialogflow_ros_msgs::DialogflowParameter_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::dialogflow_ros_msgs::DialogflowParameter_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::dialogflow_ros_msgs::DialogflowParameter_<ContainerAllocator> >
{
  static const char* value()
  {
    return "7c0d6bbe30a09bc819df8f08f331971d";
  }

  static const char* value(const ::dialogflow_ros_msgs::DialogflowParameter_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x7c0d6bbe30a09bc8ULL;
  static const uint64_t static_value2 = 0x19df8f08f331971dULL;
};

template<class ContainerAllocator>
struct DataType< ::dialogflow_ros_msgs::DialogflowParameter_<ContainerAllocator> >
{
  static const char* value()
  {
    return "dialogflow_ros_msgs/DialogflowParameter";
  }

  static const char* value(const ::dialogflow_ros_msgs::DialogflowParameter_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::dialogflow_ros_msgs::DialogflowParameter_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string param_name\n"
"string[] value\n"
;
  }

  static const char* value(const ::dialogflow_ros_msgs::DialogflowParameter_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::dialogflow_ros_msgs::DialogflowParameter_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.param_name);
      stream.next(m.value);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct DialogflowParameter_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::dialogflow_ros_msgs::DialogflowParameter_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::dialogflow_ros_msgs::DialogflowParameter_<ContainerAllocator>& v)
  {
    s << indent << "param_name: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.param_name);
    s << indent << "value[]" << std::endl;
    for (size_t i = 0; i < v.value.size(); ++i)
    {
      s << indent << "  value[" << i << "]: ";
      Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.value[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // DIALOGFLOW_ROS_MSGS_MESSAGE_DIALOGFLOWPARAMETER_H