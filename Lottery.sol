// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;
contract lotery
{
    address public manager;
    address  payable[] public participant;

    constructor()
    {
        manager = msg.sender;
    }
    receive() external payable //We can use recieve function only once in smart contract
    {
        require(msg.value==1 ether);
        participant.push(payable(msg.sender));
    }
    function getBalance() public view returns(uint)
    {
        require(msg.sender==manager);
        return address(this).balance;
    }
    function random() public view returns(uint)
    {
        return uint(keccak256(abi.encodePacked(block.difficulty,block.timestamp,participant.length)));
    }
    function Select_Winner() public{
        require(msg.sender==manager);
        require(participant.length>=3);
        uint r = random();
        uint index = r%participant.length;
        address payable winner;
        winner = participant[index];
        winner.transfer(getBalance());
        participant = new address payable[](0); //reset participant array
            }
}
