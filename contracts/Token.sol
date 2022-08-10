pragma solidity ^0.8.9;

contract Token {

    import "@openzeppelin/contracts/token/ERC20/IERC20.sol"
    import "@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol"
    import "@openzeppelin/contracts/utils/Context.sol"
    

    mapping(address => uint256) private _balances;
    mapping(address => mapping(address => uint256)) private _allowances;

    uint256 private _totalSupply;

    string private _name;
    string private _symbol;

     constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }

    function name() public view virtual override returns (string memory) {
        return _name;
    }

    function symbol() public view virtual override returns (string memory) {
        return _symbol;
    }

    function decimals() public view virtual override returns (uint8) {
        return 8;
    }

    function totalSuply() public view returns(uint8) {
        return _totalSupply;
    }

    function balanceOf(address _owner) public view returns(uint256) {
        return _balances[_owner];
    }

    function transfer(address _to, uint256 amount) public returns(uint256 balance) {
        address owner = _msgSender();
        _transfer(owner, _to, amount);
        return true;
    }
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        address spender = _msgSender();
        _spendAllowance(_from, spender, _value);
        _transfer(_from, _to, _value);
        return true;
    }
    function approve(address _spender, uint256 _value) public returns (bool success) {
        address owner = _msgSender();
        _approve(owner, _spender, _value);
        return true
    }
    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        return _allowances[_owner][_spender];
    }
}
