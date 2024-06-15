// ∙∙·▫▫ᵒᴼᵒ▫ₒₒ▫ᵒᴼᵒ▫ₒₒ▫ᵒᴼᵒ    AmirAliZandi  ᵒᴼᵒ▫ₒₒ▫ᵒᴼᵒ▫ₒₒ▫ᵒᴼᵒ▫▫·∙∙
//SPDX-License-Identifier:  GPL-3-0

    pragma solidity >=0.8.5 <0.8.22;

contract Address {

    address public  ownerAdd;
    address public  contractAdd;
    address public  secondAdd = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
    

    address payable public zeroAdd = payable (address(0));  
//payable یعنی ادرسی که ما می توانیم به ان پولی پرداخت کنیم 

    uint256 private  somebalance;// wie - 1Eth = 10^18 wie = 1000000000000000000

    constructor() {
        ownerAdd = msg.sender;
        contractAdd = address(this);
    }

    function payToContract() payable public  {
        //msg.value; در حساب گیرنده می شیند 
        //somebalance = msg.value;  عدد قبلی را را پاک میکند و جدید را در نظر می گیرد 
       //somebalance += msg.value; دو عدد را با هم جمع می کند 
        somebalance += msg.value;
    
    }

    function getSomeBalance() public  view returns  (uint256) {
        return somebalance;
    }

    function getContractBalance() public  view  returns (uint256) {
        return contractAdd.balance / 10**18; // address(this).balance;
    }

    function destructContract() public {
        if(msg.sender == ownerAdd) {   //msg.sender : مالک owner ادرس هست 
            selfdestruct(payable (ownerAdd));
        }
    }

}
/*
______________________________
    نوع /تایپ عددی   
______________________________
                     
        اعداد علامت دار 
    int8 - int16 - int32 - int64 - int128 - int256
    int ~ int256 : [ 0 - (2^256)-1 ]
    int8 : [ 0 - (2^8)-1 ] ~ [ 0 - 255 ]
     
        اعداد بدون علامت 
    uint8 - uint16 - uint32 - uint64 - uint128 - uint256
    uint ~ uint256 : [ 0 - (2^256)-1 ]  
    uint8 : [ 0 - (2^8)-1 ] ~ [ 0 - 255 ]
*/