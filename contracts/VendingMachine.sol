// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract E_Mile {
    address private owner;
    mapping(address => uint256) private milesBalance;
    uint256 private pricePurchase;
    uint256 private priceSell;

    constructor() {
        owner = msg.sender;
        milesBalance[address(this)] = 100;
        pricePurchase = 1 gwei;
        priceSell = 1 gwei;
    }

    function getMiles() public view returns (uint256) {
        return milesBalance[address(this)];
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function getEtherBalanceClient() public view returns (uint256) {
        return msg.sender.balance;
    }

    function getBalanceMilesClient() public view returns (uint256) {
        return milesBalance[msg.sender];
    }

    function getPricePurchase() public view returns (uint256) {
        return pricePurchase;
    }

    function getPriceSell() public view returns (uint256) {
        return priceSell;
    }

    function restokMiles(uint256 _amount) public {
        require(
            msg.sender == owner,
            unicode"Somente o proprietário da máquina de venda automática pode reabastecer."
        );
        require(
            _amount >= 1,
            unicode"O valor mínimo para reabastecer é 1 E-Mile"
        );
        milesBalance[address(this)] += _amount;
    }

    function restokEther() public payable {
        require(
            msg.sender == owner,
            unicode"Somente o proprietário da máquina de venda automática pode reabastecer."
        );
        require(
            msg.value >= 1 wei,
            unicode"O valor mínimo para reabastecer é 1 wei"
        );
    }

    function convert(uint256 _amount, string calldata _partition)
        private
        pure
        returns (uint256)
    {
        uint256 amountReal;
        if (keccak256(bytes(_partition)) == keccak256(bytes("wei"))) {
            amountReal = _amount * 1 wei;
        } else if (keccak256(bytes(_partition)) == keccak256(bytes("gwei"))) {
            amountReal = _amount * 1 gwei;
        } else if (keccak256(bytes(_partition)) == keccak256(bytes("ether"))) {
            amountReal = _amount * 1 ether;
        } else {
            amountReal = 0;
        }
        return amountReal;
    }

    function withdraw(uint256 _amount, string calldata _partition)
        public
        payable
    {
        uint256 amountReal = convert(_amount, _partition);

        require(
            msg.sender == owner,
            unicode"Somente o proprietário da máquina de venda automática pode efetuar saques."
        );
        require(
            amountReal <= address(this).balance,
            unicode"Saldo para saque insuficiente."
        );
        require(
            amountReal > 0,
            unicode"O valor para ser sacado deve ser superior a 0"
        );

        payable(owner).transfer(amountReal);
    }

    function priceMilesPurchase(uint256 _amount, string calldata _partition)
        public
    {
        uint256 priceValid = convert(_amount, _partition);

        require(
            msg.sender == owner,
            unicode"Somente o proprietário da máquina de venda automática pode mudar o preço de compra."
        );

        require(
            priceValid > 0,
            unicode"O valor para compra de E-Miles não pode ser 0"
        );

        pricePurchase = priceValid;
    }

    function priceMilesSell(uint256 _amount, string calldata _partition)
        public
    {
        uint256 priceValid = convert(_amount, _partition);
        require(
            msg.sender == owner,
            unicode"Somente o proprietário da máquina de venda automática pode o preço de venda."
        );

        require(
            priceValid > 0,
            unicode"O valor para venda de E-Miles não pode ser 0"
        );

        priceSell = priceValid;
    }

    function purchaseMiles(uint256 _amount) public payable {
        uint256 ticket = _amount * pricePurchase;

        require(
            _amount > 0,
            unicode"O valor mínimo para compra de E-Miles deve ser igual ou superior a 1"
        );
        
        require(
            msg.value == ticket,
            unicode"Não há ether suficiente para comprar uma E-Mile"
        );
        require(
            milesBalance[address(this)] >= _amount,
            unicode"Não há E-Miles suficientes na máquina de venda automática."
        );

        milesBalance[address(this)] -= _amount;
        milesBalance[msg.sender] += _amount;
    }

    function sellMiles(uint256 _amount) public payable {
        uint256 ticket = _amount * priceSell;

        require(
            address(this).balance >= priceSell,
            unicode"Desculpe, no momento não há ether suficiente para comprar suas E-Miles, tente novamente mais tarde."
        );

        require(
            milesBalance[msg.sender] >= _amount,
            unicode"Você não possui essa quantidade de E-Miles."
        );

        require(
            _amount > 0,
            unicode"O valor mínimo para venda de E-Miles deve ser igual ou superior a 1"
        );
        milesBalance[address(this)] += _amount;
        milesBalance[msg.sender] -= _amount;

        payable(msg.sender).transfer(ticket);
    }
<<<<<<< HEAD

=======
>>>>>>> 7f219b3bc552c5544c471e9ed824c2b9bb44a72d
}
