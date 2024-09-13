// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;


contract EventRegistration {

    address owner;
    struct RegistrationDetail{
        address attendeeAdr;
        string name;
        uint date;
        uint phoneNumber;
        string email;
    }

    error OwnerCanNotRegister();
    error UserDidNotRegister();
    error UserAlreadyRegistered();
    error OnlyOwnerCanCallThisFunction();

    event Registered(address indexed  _attendeeAdr, uint indexed  _date );

    mapping (address => RegistrationDetail) registrationDetails;

    constructor()  {
        owner = msg.sender;
    }

    function onlyOwner() view  private {
        if(msg.sender != owner){
            revert OnlyOwnerCanCallThisFunction();
        }
        
    }

    function register(
        string memory _name,
        uint _phoneNumber,
        string memory _email) external {

            if(msg.sender == owner){
                revert OwnerCanNotRegister();
            }
            
            RegistrationDetail storage registrationDetail = registrationDetails[msg.sender];
            if(msg.sender == registrationDetail.attendeeAdr){
                revert UserAlreadyRegistered();
            }
            registrationDetail.attendeeAdr = msg.sender;
            registrationDetail.name = _name;
            registrationDetail.date = block.timestamp;
            registrationDetail.email = _email;
            registrationDetail.phoneNumber = _phoneNumber;

            emit Registered(registrationDetail.attendeeAdr, registrationDetail.date);
    }

    function getRegisteredUser(address _userAddress) external view returns(RegistrationDetail memory  ){
        onlyOwner();
        RegistrationDetail storage registrationDetail = registrationDetails[_userAddress];
       if(_userAddress != registrationDetail.attendeeAdr){
            revert UserDidNotRegister();
       }
        return registrationDetail;
    }

}
