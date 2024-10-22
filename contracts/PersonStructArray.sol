// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract PersonStructArray{
    struct Person{
        string name;
        uint age;
    }
     Person[] public p;
     function addPerson(string memory _name,uint _age)public {
        p.push(Person(_name,_age));
     }
     function getPerson(uint index)public view returns(string memory,uint){
        require(index<p.length,"Index Out of Bounds Exception");
        return(p[index].name,p[index].age);
     }
}
