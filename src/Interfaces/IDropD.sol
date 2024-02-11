// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

interface IDropD {
	/** 
		@dev Returns the Balance of the address
	*/
	function balance(address account) external view returns(uint256);

	/** 
		@dev Moves `amount` to the `recipient`

		It returns True if Sucessfull
	*/
	function transfer(address recipient, uint256 amount) external returns(bool);

	/** 
		@dev Moves `amount` from the `sender` to `recipient`

		It returns True if Sucessfull
	*/
	function transferFrom(
		address sender,
		address recipient,
		uint256 amount
	) external returns(bool);
}