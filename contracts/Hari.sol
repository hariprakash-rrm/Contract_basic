pragma solidity ^0.5.0;

contract Hari {
    //name represents the name of the token.
    string public name = "Hari";

    //represents the symbol of the token
    string public symbol = "HI";

    //Total supply
    uint256 public totalSupply = 100000000000000000000000;
    uint256 public decimals = 18;

    // store the data in the form of key-value pairs
    mapping(address => uint256) public balanceOf;

    // approve other people to spend the tokens.
    mapping(address => mapping(address => uint256)) public allowance;

    // This is the address from which the tokens are sent.
    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    // This event must trigger when a successful call is made to the approve function.
    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );



    constructor() public {
        balanceOf[msg.sender] = totalSupply;
    }




 // Returns a boolean value indicating whether the operation succeeded.
 //    This value changes when "transfer" function is called.
    function transfer(address _to, uint256 _value)   public   returns (bool success)  {
        //  require that the value is greater or equal for transfer
        require(balanceOf[msg.sender] >= _value, "insufficient balance");

        // transfer the amount and subtract the balance
        balanceOf[msg.sender] -= _value;
        
          // add the balance
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }



    function approve(address _spender, uint256 _value) public returns (bool success)   {
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }



    //  This value changes when {approve} or {transferFrom} are called.
    function tranferFrom( address _from, address _to,   uint256 _value ) public returns (bool success) {
        require(_value <= balanceOf[_from]);
        require(_value <= allowance[_from][msg.sender]);

         // add the balance for transferFrom
        balanceOf[_to] += _value;

         // subtract the balance for transferFrom
        balanceOf[_from] -= _value;
        allowance[msg.sender][_from] -= _value;
        emit Transfer(_from, _to, _value);
        return true;
    }
}
