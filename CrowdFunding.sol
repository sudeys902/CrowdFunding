// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
contract CrowdFunding {
    string private campaignName;
    string private campaignDesription;
    uint256 private fundingGoal;
    uint256 private totalRaised;
    address private owner;
    uint256 private campaignDeadline;
    uint256 private minContributionAmount;
    bool private isActive;
    constructor(
        uint256 _fundingGoal,
        uint256 _totalRaised,
        string memory _campaignName,
        string memory _campaignDesription,
        uint256 _campaignDeadline,
        uint256 _minContributionAmount,
        bool _isActive
    ) {
        fundingGoal = _fundingGoal;
        totalRaised = _totalRaised;
        campaignName = _campaignName;
        campaignDesription = _campaignDesription;
        owner = msg.sender;
        campaignDeadline = _campaignDeadline;
        minContributionAmount = _minContributionAmount;
        isActive = _isActive;
    }
    function getCampaignName() public view returns (string memory) {
        return campaignName;
    }
    function getCampaignDescription() public view returns (string memory) {
        return campaignDesription;
    }
    function getFundingGoal() public view returns (uint256) {
        return fundingGoal;
    }
    function getTotalRaised() public view returns (uint256) {
        return totalRaised;
    }
    function getOwner() public view returns (address) {
        return owner;
    }
    function getCampaignDeadline() public view returns (uint256) {
        return campaignDeadline;
    }
    function getminContributionAmount() public view returns (uint256) {
        return minContributionAmount;
    }
    function getRemainingFunding() public view returns (uint256) {
        return fundingGoal - totalRaised;
    }
    function getDaysUntilDeadline() public view returns (uint256) {
        if (block.timestamp >= campaignDeadline) {
            return 0;
        }

        return (campaignDeadline - block.timestamp) / 86400;

    }
    function canAcceptDonations() public view returns (bool) {
        return block.timestamp < campaignDeadline && isActive && totalRaised < fundingGoal;
    }
}



