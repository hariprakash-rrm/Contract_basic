pragma solidity ^0.5.0;


contract Hari{
    string public name = 'Hari';
    string public symbol = "HI";
    uint public totalSupply = 100000000000000000000000;
    uint public decimals =18;


mapping (address => uint256) public balanceOf;
mapping (address =>mapping(address => uint256))public allowance;

  
  event Transfer(
      address indexed _from,
      address indexed _to,
      uint _value
  );

  event Approval(
      address indexed _owner,
      address indexed _spender,
      uint _value
  );


    constructor()public{
        balanceOf[msg.sender] = totalSupply;
    }

   
  function transfer(address _to,uint256 _value)public returns(bool success){
      require(balanceOf[msg.sender]>= _value, "insufficient balance");
      balanceOf[msg.sender]-=_value;
      balanceOf[_to]+=_value;
      emit Transfer(msg.sender, _to, _value);
      return true;


  }

  function approve(address _spender,uint _value)public returns(bool success){
      allowance[msg.sender][_spender]= _value;
      emit Approval(msg.sender,_spender,_value);
      return true;
  }
    function transferFrom (address _from,address _to,uint _value) public returns(bool success){
        require(_value <= balanceOf[msg.sender],"insufficient funds");
        require(_value <= allowance[_from][msg.sender],"allowance err");
        balanceOf[_to]+=_value;
        balanceOf[_from]-= _value;
        allowance[_from][msg.sender] -= _value;
        emit Transfer(_from,_to,_value);
        return true;
    }




}