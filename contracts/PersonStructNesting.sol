// SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract PersonStructNesting{

    struct Person{
        string name;
        uint age;
    }

    struct Car{
        string model;
        uint year;
        Person owner;
    }

    Car public Car1;

    function setCar(string memory _model, uint _year,string memory _ownername, uint _ownerage)public {
        Car1=Car(_model,_year,Person(_ownername,_ownerage));
    }
    
    function  getCar()public view returns(string memory,uint,string memory,uint){
        return(Car1.model,Car1.year,Car1.owner.name,Car1.owner.age);
    }
    }
