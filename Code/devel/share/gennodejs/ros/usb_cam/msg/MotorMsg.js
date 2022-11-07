// Auto-generated. Do not edit!

// (in-package usb_cam.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class MotorMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.x_sector = null;
      this.y_sector = null;
      this.x = null;
      this.y = null;
      this.motor_action = null;
    }
    else {
      if (initObj.hasOwnProperty('x_sector')) {
        this.x_sector = initObj.x_sector
      }
      else {
        this.x_sector = 0;
      }
      if (initObj.hasOwnProperty('y_sector')) {
        this.y_sector = initObj.y_sector
      }
      else {
        this.y_sector = 0;
      }
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = 0;
      }
      if (initObj.hasOwnProperty('y')) {
        this.y = initObj.y
      }
      else {
        this.y = 0;
      }
      if (initObj.hasOwnProperty('motor_action')) {
        this.motor_action = initObj.motor_action
      }
      else {
        this.motor_action = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MotorMsg
    // Serialize message field [x_sector]
    bufferOffset = _serializer.int64(obj.x_sector, buffer, bufferOffset);
    // Serialize message field [y_sector]
    bufferOffset = _serializer.int64(obj.y_sector, buffer, bufferOffset);
    // Serialize message field [x]
    bufferOffset = _serializer.int64(obj.x, buffer, bufferOffset);
    // Serialize message field [y]
    bufferOffset = _serializer.int64(obj.y, buffer, bufferOffset);
    // Serialize message field [motor_action]
    bufferOffset = _serializer.string(obj.motor_action, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MotorMsg
    let len;
    let data = new MotorMsg(null);
    // Deserialize message field [x_sector]
    data.x_sector = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [y_sector]
    data.y_sector = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [x]
    data.x = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [y]
    data.y = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [motor_action]
    data.motor_action = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.motor_action);
    return length + 36;
  }

  static datatype() {
    // Returns string type for a message object
    return 'usb_cam/MotorMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd31343a4c82aa80a88c6a541c909111d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 x_sector
    int64 y_sector
    int64 x
    int64 y
    string motor_action
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MotorMsg(null);
    if (msg.x_sector !== undefined) {
      resolved.x_sector = msg.x_sector;
    }
    else {
      resolved.x_sector = 0
    }

    if (msg.y_sector !== undefined) {
      resolved.y_sector = msg.y_sector;
    }
    else {
      resolved.y_sector = 0
    }

    if (msg.x !== undefined) {
      resolved.x = msg.x;
    }
    else {
      resolved.x = 0
    }

    if (msg.y !== undefined) {
      resolved.y = msg.y;
    }
    else {
      resolved.y = 0
    }

    if (msg.motor_action !== undefined) {
      resolved.motor_action = msg.motor_action;
    }
    else {
      resolved.motor_action = ''
    }

    return resolved;
    }
};

module.exports = MotorMsg;
