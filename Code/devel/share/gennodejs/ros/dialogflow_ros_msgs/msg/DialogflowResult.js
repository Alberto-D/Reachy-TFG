// Auto-generated. Do not edit!

// (in-package dialogflow_ros_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let DialogflowParameter = require('./DialogflowParameter.js');
let DialogflowContext = require('./DialogflowContext.js');

//-----------------------------------------------------------

class DialogflowResult {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.action = null;
      this.query_text = null;
      this.fulfillment_text = null;
      this.parameters = null;
      this.contexts = null;
      this.intent = null;
    }
    else {
      if (initObj.hasOwnProperty('action')) {
        this.action = initObj.action
      }
      else {
        this.action = '';
      }
      if (initObj.hasOwnProperty('query_text')) {
        this.query_text = initObj.query_text
      }
      else {
        this.query_text = '';
      }
      if (initObj.hasOwnProperty('fulfillment_text')) {
        this.fulfillment_text = initObj.fulfillment_text
      }
      else {
        this.fulfillment_text = '';
      }
      if (initObj.hasOwnProperty('parameters')) {
        this.parameters = initObj.parameters
      }
      else {
        this.parameters = [];
      }
      if (initObj.hasOwnProperty('contexts')) {
        this.contexts = initObj.contexts
      }
      else {
        this.contexts = [];
      }
      if (initObj.hasOwnProperty('intent')) {
        this.intent = initObj.intent
      }
      else {
        this.intent = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DialogflowResult
    // Serialize message field [action]
    bufferOffset = _serializer.string(obj.action, buffer, bufferOffset);
    // Serialize message field [query_text]
    bufferOffset = _serializer.string(obj.query_text, buffer, bufferOffset);
    // Serialize message field [fulfillment_text]
    bufferOffset = _serializer.string(obj.fulfillment_text, buffer, bufferOffset);
    // Serialize message field [parameters]
    // Serialize the length for message field [parameters]
    bufferOffset = _serializer.uint32(obj.parameters.length, buffer, bufferOffset);
    obj.parameters.forEach((val) => {
      bufferOffset = DialogflowParameter.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [contexts]
    // Serialize the length for message field [contexts]
    bufferOffset = _serializer.uint32(obj.contexts.length, buffer, bufferOffset);
    obj.contexts.forEach((val) => {
      bufferOffset = DialogflowContext.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [intent]
    bufferOffset = _serializer.string(obj.intent, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DialogflowResult
    let len;
    let data = new DialogflowResult(null);
    // Deserialize message field [action]
    data.action = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [query_text]
    data.query_text = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [fulfillment_text]
    data.fulfillment_text = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [parameters]
    // Deserialize array length for message field [parameters]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.parameters = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.parameters[i] = DialogflowParameter.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [contexts]
    // Deserialize array length for message field [contexts]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.contexts = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.contexts[i] = DialogflowContext.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [intent]
    data.intent = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.action);
    length += _getByteLength(object.query_text);
    length += _getByteLength(object.fulfillment_text);
    object.parameters.forEach((val) => {
      length += DialogflowParameter.getMessageSize(val);
    });
    object.contexts.forEach((val) => {
      length += DialogflowContext.getMessageSize(val);
    });
    length += _getByteLength(object.intent);
    return length + 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'dialogflow_ros_msgs/DialogflowResult';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7af2326075f5db031043836d68eb1ad3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new DialogflowResult(null);
    if (msg.action !== undefined) {
      resolved.action = msg.action;
    }
    else {
      resolved.action = ''
    }

    if (msg.query_text !== undefined) {
      resolved.query_text = msg.query_text;
    }
    else {
      resolved.query_text = ''
    }

    if (msg.fulfillment_text !== undefined) {
      resolved.fulfillment_text = msg.fulfillment_text;
    }
    else {
      resolved.fulfillment_text = ''
    }

    if (msg.parameters !== undefined) {
      resolved.parameters = new Array(msg.parameters.length);
      for (let i = 0; i < resolved.parameters.length; ++i) {
        resolved.parameters[i] = DialogflowParameter.Resolve(msg.parameters[i]);
      }
    }
    else {
      resolved.parameters = []
    }

    if (msg.contexts !== undefined) {
      resolved.contexts = new Array(msg.contexts.length);
      for (let i = 0; i < resolved.contexts.length; ++i) {
        resolved.contexts[i] = DialogflowContext.Resolve(msg.contexts[i]);
      }
    }
    else {
      resolved.contexts = []
    }

    if (msg.intent !== undefined) {
      resolved.intent = msg.intent;
    }
    else {
      resolved.intent = ''
    }

    return resolved;
    }
};

module.exports = DialogflowResult;
