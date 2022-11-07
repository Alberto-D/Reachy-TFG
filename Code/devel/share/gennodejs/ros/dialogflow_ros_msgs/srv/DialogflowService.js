// Auto-generated. Do not edit!

// (in-package dialogflow_ros_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

let DialogflowResult = require('../msg/DialogflowResult.js');

//-----------------------------------------------------------

class DialogflowServiceRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.voice = null;
      this.text = null;
    }
    else {
      if (initObj.hasOwnProperty('voice')) {
        this.voice = initObj.voice
      }
      else {
        this.voice = false;
      }
      if (initObj.hasOwnProperty('text')) {
        this.text = initObj.text
      }
      else {
        this.text = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DialogflowServiceRequest
    // Serialize message field [voice]
    bufferOffset = _serializer.bool(obj.voice, buffer, bufferOffset);
    // Serialize message field [text]
    bufferOffset = _serializer.string(obj.text, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DialogflowServiceRequest
    let len;
    let data = new DialogflowServiceRequest(null);
    // Deserialize message field [voice]
    data.voice = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [text]
    data.text = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.text);
    return length + 5;
  }

  static datatype() {
    // Returns string type for a service object
    return 'dialogflow_ros_msgs/DialogflowServiceRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6a0f44890f843243fefe4cc775c82cf7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool voice
    string text
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DialogflowServiceRequest(null);
    if (msg.voice !== undefined) {
      resolved.voice = msg.voice;
    }
    else {
      resolved.voice = false
    }

    if (msg.text !== undefined) {
      resolved.text = msg.text;
    }
    else {
      resolved.text = ''
    }

    return resolved;
    }
};

class DialogflowServiceResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
      this.result = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
      if (initObj.hasOwnProperty('result')) {
        this.result = initObj.result
      }
      else {
        this.result = new DialogflowResult();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DialogflowServiceResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    // Serialize message field [result]
    bufferOffset = DialogflowResult.serialize(obj.result, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DialogflowServiceResponse
    let len;
    let data = new DialogflowServiceResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [result]
    data.result = DialogflowResult.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += DialogflowResult.getMessageSize(object.result);
    return length + 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'dialogflow_ros_msgs/DialogflowServiceResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c95c5dffc4f22b0fa3bc4010eb94bc9c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool success
    DialogflowResult result
    
    ================================================================================
    MSG: dialogflow_ros_msgs/DialogflowResult
    string action
    string query_text
    string fulfillment_text
    DialogflowParameter[] parameters
    DialogflowContext[] contexts
    string intent
    ================================================================================
    MSG: dialogflow_ros_msgs/DialogflowParameter
    string param_name
    string[] value
    ================================================================================
    MSG: dialogflow_ros_msgs/DialogflowContext
    string name
    int32 lifespan_count
    DialogflowParameter[] parameters
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DialogflowServiceResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    if (msg.result !== undefined) {
      resolved.result = DialogflowResult.Resolve(msg.result)
    }
    else {
      resolved.result = new DialogflowResult()
    }

    return resolved;
    }
};

module.exports = {
  Request: DialogflowServiceRequest,
  Response: DialogflowServiceResponse,
  md5sum() { return '70029259094fc3123850886da266641c'; },
  datatype() { return 'dialogflow_ros_msgs/DialogflowService'; }
};
