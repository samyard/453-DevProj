# 453 Data Dashboard Developer Project

  This end of semester project is to design a data dashboard for
BU students and faculty to both visualize sustainability data
as well as browse recommendations for limiting waste. These 
suggestions will be created from the data blockchain that is
verified and authenticated via a Solidity Smart Contract.

## DashContract.sol
  A Solidity Smart Contrract that authenticates the data that 
is pulled from the blockchain. The data is verified by hashing 
the sensor address supplied to the verifySensorData function, 
using the solidity keccak256 cryptographic function.
The recoverSigner fucntion then recovers the signer from the
digital signature and recreates the hash from the original message.
Lastly, the function compares the claimed signer and the recovered
signer from the signature and hash, it returns false if they are
not identical.

## dashboard_backend.py
  This file currently includes pseudocode to the backend of the 
data dashboard. This includes aggregating the data from the 
blockchain, using the Solidity contract for data verification, 
as well as launching the data dashboard and providing the user 
with recommendations to possibly improve sustainability on campus.

## DashPrototype.py
  This file uses dash, which allows interactive data dashboards
using only python, HTML/CSS is not necessary, though it is an option.
This specific file uses sample code, and an unrelated, sample dataset
just to show an example of how dash could be used to implement my
described dashboard model.
