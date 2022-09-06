// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract E_Mile {

    address public owner;
    mapping(address => uint256) private milesBalance;

    constructor() {
        owner = msg.sender;
        milesBalance[address(this)] = 100;

    }

    function getMiles() public view returns (uint256) {
        return milesBalance[address(this)];
    }

    function getBalance() public view returns (uint256){
      return address(this).balance;
    }

    function getEtherBalanceClient() public view returns (uint256) {
        return msg.sender.balance;
    }

    function getBalanceMilesClient() public view returns (uint256){
      return milesBalance[msg.sender];
    }

    function restokMiles(uint256 amount) public {
        require(
            msg.sender == owner,
            unicode"Somente o proprietário da máquina de venda automática pode reabastecer."
        );
        milesBalance[address(this)] += amount;
    }

    function RestokEther() public payable {
        require(
            msg.sender == owner,
            unicode"Somente o proprietário da máquina de venda automática pode reabastecer."
        );
        require(
            msg.value >=  1 gwei,
            unicode"O valor mínimo para reabastecer é 1 gwei"
        );

    }

    //TODO: Definir quando pode fazer saque de ether
    function Withdrawal() public {}

    //TODO: Definir valor de compra
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

        require(
          amount > 0,
          unicode"O valor mínimo para compra de milhas deve ser igual ou superior a 1"
        );

        milesBalance[address(this)] -= amount;
        milesBalance[msg.sender] += amount;
    }

    function PurchaseEther(uint256 amount) public payable {
        require(
          address(this).balance >= amount * 1 gwei,
          unicode"Desculpe, no momento não há ether suficiente para comprar suas milhas, tente novamente mais tarde."
        );

        require(
          milesBalance[msg.sender] >= amount,
          unicode"Você não possui essa quantidade de milhas."
        );

        require(
          amount > 0,
          unicode"O valor mínimo para venda de milhas deve ser igual ou superior a 1"
        );
       milesBalance[address(this)] += amount;
       milesBalance[msg.sender] -= amount;

       payable(msg.sender).transfer( amount * 1 gwei);
    }


}
