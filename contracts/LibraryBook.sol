// SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

contract LibraryBook{

    struct Book{
        string booktitle;
        string author;
        uint year;
    }
   Book public b;
   function setBook(string memory _booktitle,string memory _author,uint _year)public{
        b=Book(_booktitle,_author,_year);
    }
    function getBook()public view returns(Book memory){
        return b;
    }

}
