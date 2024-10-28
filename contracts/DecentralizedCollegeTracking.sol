// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DecentralizedCollegeTracking {
    struct College {
        string name;
        address collegeAddress;
        address admin;
        string registrationNumber;
        bool canAddStudents;
        uint numberOfStudents;
        mapping(uint => Student) students;
        mapping(string => uint) studentIndexByName;
    }

    struct Student {
        string name;
        uint phoneNumber;
        string courseEnrolled;
    }

    mapping(address => College) public colleges;
    address[] public collegeList; // For listing all colleges

    modifier onlyAdmin(address _collegeAddress) {
        require(msg.sender == colleges[_collegeAddress].admin, "Only college admin can perform this action.");
        _;
    }

    function addCollege(
        string memory _name,
        address _collegeAddress,
        address _admin,
        string memory _registrationNumber
    ) public {
        require(colleges[_collegeAddress].collegeAddress == address(0), "College already exists.");
        
        College storage newCollege = colleges[_collegeAddress];
        newCollege.name = _name;
        newCollege.collegeAddress = _collegeAddress;
        newCollege.admin = _admin;
        newCollege.registrationNumber = _registrationNumber;
        newCollege.canAddStudents = true;
        newCollege.numberOfStudents = 0;

        collegeList.push(_collegeAddress);
    }

    
  function blockCollege(address _collegeAddress) public onlyAdmin(_collegeAddress) {
        colleges[_collegeAddress].canAddStudents = false;
    }

    // 3. Unblock the college to add new students
    function unblockCollege(address _collegeAddress) public onlyAdmin(_collegeAddress) {
        colleges[_collegeAddress].canAddStudents = true;
    }

    
    function addStudent(
        address _collegeAddress,
        string memory _studentName,
        uint _phoneNumber,
        string memory _courseEnrolled
    ) public onlyAdmin(_collegeAddress) {
        require(colleges[_collegeAddress].canAddStudents, "College is blocked from adding students.");

        College storage college = colleges[_collegeAddress];
        uint studentId = college.numberOfStudents;

        college.students[studentId] = Student({
            name: _studentName,
            phoneNumber: _phoneNumber,
            courseEnrolled: _courseEnrolled
        });

        college.studentIndexByName[_studentName] = studentId;
        college.numberOfStudents++;
    }

    
    function changeStudentCourse(
        address _collegeAddress,
        string memory _studentName,
        string memory _newCourse
    ) public onlyAdmin(_collegeAddress) {
        College storage college = colleges[_collegeAddress];
        uint studentId = college.studentIndexByName[_studentName];
        require(keccak256(abi.encodePacked(college.students[studentId].name)) == keccak256(abi.encodePacked(_studentName)), "Student not found.");
        college.students[studentId].courseEnrolled = _newCourse;
    }

    
    function viewCollegeDetails(address _collegeAddress)
        public
        view
        returns (
            string memory name,
            address admin,
            string memory registrationNumber,
            bool canAddStudents,
            uint numberOfStudents
        )
    {
        College storage college = colleges[_collegeAddress];
        return (college.name, college.admin, college.registrationNumber, college.canAddStudents, college.numberOfStudents);
    }

    
    function viewStudentDetails(address _collegeAddress, string memory _studentName)
        public
        view
        returns (
            string memory name,
            uint phoneNumber,
            string memory courseEnrolled
        )
    {
        College storage college = colleges[_collegeAddress];
        uint studentId = college.studentIndexByName[_studentName];
        require(keccak256(abi.encodePacked(college.students[studentId].name)) == keccak256(abi.encodePacked(_studentName)), "Student not found.");
        Student storage student = college.students[studentId];
        return (student.name, student.phoneNumber, student.courseEnrolled);
    }

    function getNumberOfStudents(address _collegeAddress) public view returns (uint) {
        return colleges[_collegeAddress].numberOfStudents;
    }

    function getAllColleges() public view returns (address[] memory) {
        return collegeList;
    }
}
