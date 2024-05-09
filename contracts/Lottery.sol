// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.5.0 <0.9.0;

contract Lottery{
    address public manager;
    address payable[] public participants;

    constructor()
    {
        manager=msg.sender;
    }

    function participate() public payable
    {
        require(msg.value == 1 ether ,"Please pay 1 ether only.");
        participants.push(payable(msg.sender));
    }

    function getBalance() public view returns(uint)
    {
        require(msg.sender==manager, "You are not the manager.");
        return address(this).balance;
    }
    function Random() internal view returns(uint)
    {
        return uint(keccak256(abi.encodePacked(blockhash(block.number), block.timestamp, participants.length)));
    }
    function Winner() public 
    {
        require(msg.sender==manager, "You are not the manager.");
        require(participants.length >= 3, "Atleast 3 players should be there.");
        uint r = Random();
        address payable winner;
        uint index = r%participants.length;
        winner=participants[index];
        winner.transfer(getBalance());
        participants = new address payable[](0); 
    }

    function allPlayers() public view returns (address payable[] memory){
        return participants;
    }
}