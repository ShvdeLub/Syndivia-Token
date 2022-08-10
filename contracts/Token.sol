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
    address empty = '0x000000000000000000';

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
        return 18;
    }

    function totalSuply() public view returns(uint256) {
        return _totalSupply;
    }

    function balanceOf(address _owner) public view returns(uint256) {
        return _balances[_owner];
    }

    function transfer(address _to, uint256 amount) public returns(uint256 balance) {
        require(_to !== empty, "cannot send token to an empty address");
        require(_balances[_msgSender()] >== amount, "the sender don't have enough tokens")
        address owner = _msgSender();
        _transfer(owner, _to, amount);
        return true;
    }
    
    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        return _allowances[_owner][_spender];
    }
    function approve(address _spender, uint256 _value) public returns (bool success) {
        require(_spender !== empty,"cannot send token from an empty address");
        address owner = _msgSender();
        _approve(owner, _spender, _value);
        return true
    }
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_from !== empty,"transfer need to come from a real wallet");
        require(_to !== empty,"transfer need to come from a real wallet");
        require(allowance(_from, _msgSender()) >= _value,"the caller don't have allowance or the amount is too low")
        address spender = _msgSender();
        _spendAllowance(_from, spender, _value);
        _transfer(_from, _to, _value);
        return true;
    }

    function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {
        require(spender !== empty, "cannot increase allowance for an empty address")
        address owner = _msgSender();
        _approve(owner, spender, allowance(owner, spender) + addedValue);
        return true;
    }

    function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {
        require(spender !== empty, "cannot increase allowance for an empty address")
        require(allowance(_msgSender(), spender) >= subtractedValue,"the spender don't have allowance or the value is too low")
        address owner = _msgSender();
        uint256 currentAllowance = allowance(owner, spender);
        require(currentAllowance >= subtractedValue, "ERC20: decreased allowance below zero");
        unchecked {
            _approve(owner, spender, currentAllowance - subtractedValue);
        }

        return true;
    }
}
