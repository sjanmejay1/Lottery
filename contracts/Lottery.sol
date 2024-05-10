// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.5.0 <0.9.0;

contract Lottery{
    address public manager;
    address payable[] public players;
    address payable public winner;

    constructor()
    {
        manager=msg.sender;
    }

    receive() external payable
    {
        require(msg.value == 1 ether ,"Please pay 1 ether only.");
        players.push(payable(msg.sender));
    }

    function getBalance() public view returns(uint)
    {
        require(msg.sender==manager, "You are not the manager.");
        return address(this).balance;
    }
    function random() internal view returns(uint)
    {
        return uint(keccak256(abi.encodePacked(blockhash(block.number), block.timestamp, players.length)));
    }
    function pickWinner() public 
    {
        require(msg.sender==manager, "You are not the manager.");
        require(players.length >= 3, "Atleast 3 players should be there.");
        uint r = random();
        uint index = r%players.length;
        winner=players[index];
        winner.transfer(getBalance());
        players = new address payable[](0); 
    }

    function allPlayers() public view returns (address payable[] memory){
        return players;
    }
}