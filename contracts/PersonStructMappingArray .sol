// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract PersonStructMappingArray {
    struct Person {
        string name;
        uint age;
    }

     mapping(address => Person[]) public personDetails;

   
    function addPerson(string memory _name, uint _age) public {
        Person memory newPerson = Person(_name, _age);
        personDetails[msg.sender].push(newPerson);
    }

    
    function getPerson(uint index) public view returns (string memory, uint) {
        require(index < personDetails[msg.sender].length, "Person index out of bounds");
        Person memory person = personDetails[msg.sender][index];
        return (person.name, person.age);
    }
  function getPersonCount() public view returns (uint) {
        return personDetails[msg.sender].length;
    }
}
