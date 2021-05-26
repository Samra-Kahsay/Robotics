// Auto-generated. Do not edit!

// (in-package question_one.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class input {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.vector = null;
      this.angles = null;
      this.d = null;
    }
    else {
      if (initObj.hasOwnProperty('vector')) {
        this.vector = initObj.vector
      }
      else {
        this.vector = new Array(3).fill(0);
      }
      if (initObj.hasOwnProperty('angles')) {
        this.angles = initObj.angles
      }
      else {
        this.angles = new Array(3).fill(0);
      }
      if (initObj.hasOwnProperty('d')) {
        this.d = initObj.d
      }
      else {
        this.d = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type input
    // Check that the constant length array field [vector] has the right length
    if (obj.vector.length !== 3) {
      throw new Error('Unable to serialize array field vector - length must be 3')
    }
    // Serialize message field [vector]
    bufferOffset = _arraySerializer.float64(obj.vector, buffer, bufferOffset, 3);
    // Check that the constant length array field [angles] has the right length
    if (obj.angles.length !== 3) {
      throw new Error('Unable to serialize array field angles - length must be 3')
    }
    // Serialize message field [angles]
    bufferOffset = _arraySerializer.float64(obj.angles, buffer, bufferOffset, 3);
    // Serialize message field [d]
    bufferOffset = _serializer.float64(obj.d, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type input
    let len;
    let data = new input(null);
    // Deserialize message field [vector]
    data.vector = _arrayDeserializer.float64(buffer, bufferOffset, 3)
    // Deserialize message field [angles]
    data.angles = _arrayDeserializer.float64(buffer, bufferOffset, 3)
    // Deserialize message field [d]
    data.d = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 56;
  }

  static datatype() {
    // Returns string type for a message object
    return 'question_one/input';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b13874c5ea905eae4aac5b1fd6887b8e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[3] vector
    float64[3] angles
    float64 d
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new input(null);
    if (msg.vector !== undefined) {
      resolved.vector = msg.vector;
    }
    else {
      resolved.vector = new Array(3).fill(0)
    }

    if (msg.angles !== undefined) {
      resolved.angles = msg.angles;
    }
    else {
      resolved.angles = new Array(3).fill(0)
    }

    if (msg.d !== undefined) {
      resolved.d = msg.d;
    }
    else {
      resolved.d = 0.0
    }

    return resolved;
    }
};

module.exports = input;
