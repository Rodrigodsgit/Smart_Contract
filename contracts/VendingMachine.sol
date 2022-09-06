// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract VendingMachine {
    address public owner;
    mapping(address => uint256) public milesBalance;
    mapping(address => uint256) public etherBalance;

    constructor() {
        owner = msg.sender;

        milesBalance[address(this)] = 100;
        etherBalance[address(this)] = 10;
    }

    function GetMiles() public view returns (uint256) {
        return milesBalance[address(this)];
    }

    function GetEtherBalance() public view returns (uint256) {
        return etherBalance[address(this)];
    }

    function RestokMiles(uint256 amount) public {
        require(
            msg.sender == owner,
            unicode"Somente o proprietário da máquina de venda automática pode reabastecer."
        );
        milesBalance[address(this)] += amount;
    }

    function RestokEther(uint256 amount) public {
        require(
            msg.sender == owner,
            unicode"Somente o proprietário da máquina de venda automática pode reabastecer."
        );
        etherBalance[address(this)] += amount;
    }

    //TODO: Definir quando pode fazer saque de ether
    function Withdrawal() public {}

    //TODO: Definir valor de compra/venda
    function PriceMiles() public {}

    function PurchaseMiles(uint256 amount) public payable {
        require(
            msg.value >= amount * 1 gwei,
            unicode"Não há ether suficiente para comprar um milha, o preço é de 1 ether por milha"
        );

        require(
            milesBalance[address(this)] >= amount,
            unicode"Não há milhas suficientes na máquina de venda automática."
        );

        milesBalance[address(this)] -= amount;
        milesBalance[msg.sender] += amount;
    }
}
