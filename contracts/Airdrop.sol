pragma solidity >=0.8.0 <0.9.0;

contract Airdrop{
    address[] public recipients;
    address public admin;
    constructor(){ 
        admin = msg.sender;
    }
    receive() external payable{
        require(msg.sender != admin, "Admin cannot transact!");
        require(msg.value == 0.1 ether || msg.value == 50 ether,"Exactly 0.1 ether should be transacted");
        require(address(this).balance > 1 ether, "Insufficient balance!");
        if(msg.value == 0.1 ether){
        require(!check(msg.sender), "Only allowed once!");
        payable(msg.sender).transfer(1 ether);
        recipients.push(msg.sender);
        }
    }
    function check(address current) internal view returns(bool){
        for(uint i =0; i<recipients.length; i++){
            if(current == recipients[i]){
                return true;
            }
        }
        return false;
    }
}