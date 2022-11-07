// Auto-generated. Do not edit!

// (in-package dialogflow_ros_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class DialogflowParameter {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.param_name = null;
      this.value = null;
    }
    else {
      if (initObj.hasOwnProperty('param_name')) {
        this.param_name = initObj.param_name
      }
      else {
        this.param_name = '';
      }
      if (initObj.hasOwnProperty('value')) {
        this.value = initObj.value
      }
      else {
        this.value = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DialogflowParameter
    // Serialize message field [param_name]
    bufferOffset = _serializer.string(obj.param_name, buffer, bufferOffset);
    // Serialize message field [value]
    bufferOffset = _arraySerializer.string(obj.value, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DialogflowParameter
    let len;
    let data = new DialogflowParameter(null);
    // Deserialize message field [param_name]
    data.param_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [value]
    data.value = _arrayDeserializer.string(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.param_name);
    object.value.forEach((val) => {
      length += 4 + _getByteLength(val);
    });
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'dialogflow_ros_msgs/DialogflowParameter';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7c0d6bbe30a09bc819df8f08f331971d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string param_name
    string[] value
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DialogflowParameter(null);
    if (msg.param_name !== undefined) {
      resolved.param_name = msg.param_name;
    }
    else {
      resolved.param_name = ''
    }

    if (msg.value !== undefined) {
      resolved.value = msg.value;
    }
    else {
      resolved.value = []
    }

    return resolved;
    }
};

module.exports = DialogflowParameter;
