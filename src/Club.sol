// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;
import "./Interfaces/IDropD.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CLUB is Ownable {
    
	IDropD public DROPD;
    address public clubCreator;
    uint256 public memberCount;
    uint256 public entryFees;
	mapping(address => bool) public isMember;

    event ClubJoined(address _clubAddress, address _joiner);
	event FeesChanged(address _clubAdress, uint256 _newAmount);

	constructor(address _DROPD, address _clubCreator) Ownable(_clubCreator) {
		DROPD = IDropD(_DROPD);
		clubCreator = _clubCreator;
		entryFees = 20e18;
		memberCount = 0;
	}

    function joinClub(address _joiner) public{
		require(isMember[_joiner] == false, "DROPD Foundation: Already a Member.");
		// DROPD.transferFrom(_joiner, clubCreator, entryFees);
		isMember[_joiner] = true;
		emit ClubJoined(address(this), _joiner);
    }

	function changeFee(uint256 _newAmount) public onlyOwner {
		require(_newAmount >= 20e18, "DROPD Foundation: Fees should be minimum 20 DRPD.");
		entryFees = _newAmount;
		emit FeesChanged(address(this), _newAmount);
	}
}