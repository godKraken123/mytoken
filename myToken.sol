// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/// @title Custom ERC-20 Token with mint and burn
/// @author Rafael
/// @notice Basic implementation of an ERC-20 token, written from scratch for learning purposes
/// @dev Compliant with EIP-20 specification. Built without OpenZeppelin.
contract MyToken {
    //State Variables
    address public owner;
    string public name;
    string public symbol;
    uint public decimals = 18; //десятичные знаки
    uint256 public totalSupply; //общее колич токена


    modifier onlyOwner(){
        require(msg.sender == owner, "you are not owner!");
        _;
    }

    mapping (address => uint256) public balanceOf; //балансы
    mapping(address => mapping(address => uint256)) public allowance; //разрешения

    // События из спецификации (для отслеживания переводов) логирование данных, запись в транзакционный лог
    event Transfer(address indexed from, address indexed to, uint256 value); //для отслеживания переводов
    event Approval(address indexed owner, address indexed spender, uint256 value); //для отслеживания разрешений

    constructor(string memory _name, string memory _symbol, uint256 _initialSupply) {
        owner = msg.sender;
        totalSupply = _initialSupply;  //Запомнили сколько всего    
        name = _name;
        symbol = _symbol;
        decimals = 18;
        balanceOf[msg.sender] = _initialSupply;
    }

    function transfer(address _to, uint256 _value) external returns (bool) { //функция для перевода
        require(_to != address(0), "transfer to zero address");
        require(balanceOf[msg.sender] >= _value, "Not enough tokens");
        //действия
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        //событие
        emit Transfer(msg.sender, _to, _value);
        //результат
        return true;
    }
    //чтобы давать другим адресам разрешение переводить с пользователя кошелька токены
    function approve(address _spender, uint256 _value) external returns (bool) { 
        require(_spender != address(0), "approve to zero address");
        allowance[msg.sender][_spender] = _value; //"Я, msg.sender, разрешаю адресу _spender потратить до _value моих токенов
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
        //_from это владелец
    function transferFrom(address _from, address _to, uint256 _value) external returns (bool){
        require(_from != address(0), "transferFrom to zero address");
        require(balanceOf[_from] >= _value, "Not enough tokens");          
        require(allowance[_from][msg.sender] >= _value, "not enough allowansed");  // 2. Проверить, что у msg.sender есть разрешение от _from на _value
        allowance[_from][msg.sender] -= _value; //уменьшить сумму из разрешения 
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(_from, _to, _value);
        return true;
    }

    function mint(address _to, uint256 _value) public onlyOwner returns (bool){
        require(_to != address(0), "transfer to zero address");
        totalSupply += _value;
        balanceOf[_to] += _value;
        emit Transfer(address(0), _to, _value);
        return true;
    }
    function burn(uint256 _value) external returns(bool){
        require(balanceOf[msg.sender] >= _value, "Not enough tokens");
        totalSupply -=_value;
        balanceOf[msg.sender] -=_value;
        emit Transfer(msg.sender, address(0), _value);
        return true;
    }
}
