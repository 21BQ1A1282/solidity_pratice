// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract StudentRecords {
   address public teacher;
   struct Student {
        uint rollNo;
        string name;
        uint[5] marks; 
    }
    mapping(address => Student) private studentRecords;
    
    modifier onlyTeacher() {
        require(msg.sender == teacher, "Only the teacher can perform this action.");
        _;
    }
    constructor() {
        teacher = msg.sender; 
    }

  function addRecord(address _studentAddress, uint _rollNo, string memory _name, uint[5] memory _marks) public onlyTeacher {
        studentRecords[_studentAddress] = Student({
            rollNo: _rollNo,
            name: _name,
            marks: _marks
        });
    }
  function getRecord(address _studentAddress) public view returns (uint, string memory, uint[5] memory) {
        Student memory student = studentRecords[_studentAddress];
        require(student.rollNo != 0, "Student record does not exist."); // Check if the student exists
        return (student.rollNo, student.name, student.marks);
    }
  function deleteRecord(address _studentAddress) public onlyTeacher {
        require(studentRecords[_studentAddress].rollNo != 0, "Student record does not exist."); 
        delete studentRecords[_studentAddress];
    }
}
