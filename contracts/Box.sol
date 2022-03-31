// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract Box is Initializable {
  uint256 public value;
  event Deploy();
  event Increment();
  // event Decrement();

  function initialize(uint256 _value) public initializer {
    value = _value;
    emit Deploy();
  }

  function increment() public {
    value++;
    emit Increment();
  }

  // function decrement() public {
  //   value--;
  //   emit Decrement();
  // }
}
