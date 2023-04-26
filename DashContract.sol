pragma solidity ^0.8.0;

contract SustainabilityData {
    struct SensorData {
        uint256 timestamp;
        uint256 value;
    }

    mapping(address => SensorData[]) private sensorData;

    // Function to post data to the blockchain
    function postSensorData(uint256 _value) public {
        SensorData memory newData = SensorData({
            timestamp: block.timestamp,
            value: _value
        });
        sensorData[msg.sender].push(newData);
    }

    // Function to verify integrity and authenticity of sensor data
    function verifySensorData(address _sensor, uint256 _index, uint256 _timestamp, uint256 _value, bytes memory _signature) public view returns(bool) {
        SensorData memory data = sensorData[_sensor][_index];

        // Verify that the provided data matches the stored data
        if (data.timestamp != _timestamp || data.value != _value) {
            return false;
        }

        // Verify the digital signature
        bytes32 messageHash = keccak256(abi.encodePacked(_sensor, _index, _timestamp, _value));
        address recoveredSigner = recoverSigner(messageHash, _signature);
        if (recoveredSigner != _sensor) {
            return false;
        }

        return true;
    }

    // Function to recover signer from a digital signature
function recoverSigner(bytes32 _messageHash, bytes memory _signature) internal pure returns (address) {
    bytes32 r;
    bytes32 s;
    uint8 v;

    // Split the signature into its components
    assembly {
        r := mload(add(_signature, 32))
        s := mload(add(_signature, 64))
        v := byte(0, mload(add(_signature, 96)))
    }

    // Recover the signer's address from the signature
    return ecrecover(_messageHash, v, r, s);
}


}
