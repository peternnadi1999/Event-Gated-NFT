// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

contract EventRegistration {

    address owner;
    address tokenAdd;
    uint eventCount;


    struct EventName{
        uint id;
        string name;
    }

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
    error YouDonnotHaveTheNFT();

    event Registered(address indexed  _attendeeAdr, uint indexed  _date );
    event EventSuccessfullyCreated();

    mapping (uint => EventName) events;
    mapping (uint => mapping (address => RegistrationDetail)) registrationDetails;

    constructor()  {
        owner = msg.sender;
        tokenAdd = 0x4475A8FBeF5Cf4a92a484B6f5602A91F3abC72D8;
    }

    function onlyOwner() view  private {
        if(msg.sender != owner){
            revert OnlyOwnerCanCallThisFunction();
        }
        
    }


    function createEvent( string memory _name) external {
        onlyOwner();
        eventCount++;
        events[eventCount]=  EventName(eventCount, _name);
        emit EventSuccessfullyCreated();
    }

    function register(
        uint _eventid,
        string memory _name,
        uint _phoneNumber,
        string memory _email) external {

            if(IERC721(tokenAdd).balanceOf(msg.sender) >= 1){
                revert YouDonnotHaveTheNFT();
            }
            if(msg.sender == owner){
                revert OwnerCanNotRegister();
            }
            EventName storage id = events[_eventid];
            RegistrationDetail storage registrationDetail = registrationDetails[id.id][msg.sender];
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

    function getRegisteredUser(address _userAddress, uint _id) external view returns(RegistrationDetail memory  ){
        EventName storage id = events[_id];
        RegistrationDetail storage registrationDetail = registrationDetails[id.id][_userAddress];
       if(_userAddress != registrationDetail.attendeeAdr){
            revert UserDidNotRegister();
       }
        return registrationDetail;
    }
    function getEvent( uint _id) external view returns(EventName memory  ){
        EventName storage eventName = events[_id];
        if(_id != eventName.id){
            revert("No Event with this Id");
       }
        return eventName;
    }

}
