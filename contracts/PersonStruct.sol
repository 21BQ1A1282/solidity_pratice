// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;
contract PersonStruct{
    struct Person{
        string name;
        uint age;
    }
     Person p;
     constructor(string memory _name, uint _age){
        p=Person(_name,_age);
     }
     function updatePerson(string memory _name, uint _age)public{
        p.name=_name;
        p.age=_age;
     }
     function getPerson()public view returns(string memory,uint){
        return(p.name,p.age);
     }
}
