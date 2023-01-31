pragma solidity >=0.8.0 <0.9.0;

contract Airdrop{
    address[] public recipients;
    constructor(){
        balance();
    }
    function balance() internal view returns(uint){
        return address(this).balance;
    }
    receive() external payable{
        require(msg.value == 0.1 ether, "Only 0.1 ether is accepted by the contract");
        require(address(this).balance > 10.1 ether, "Insufficient balance!");
        require(check(msg.sender) == true, "Only allowed once!");
        payable(msg.sender).transfer(10 ether);
        recipients.push(msg.sender);
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