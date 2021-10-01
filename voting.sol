//SPDX-License-Identifier: MIT

pragma solidity >= 0.7.0 <0.9.0;

// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.0.0/contracts/token/ERC20/IERC20.sol";
// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.0.0/contracts/token/ERC20/ERC20.sol";

// Yet to integrate the Coin

contract voting{

    address voteOwner;


    constructor() {
        voteOwner = msg.sender;
    }
    
    
    struct Voter{
        address voter;
        uint uniqueVote;
        bool voted;
        //bool eligibility; //voter is required to have a certain amount of votes in order
    }

    
    Voter[] public voters;
    mapping(address => Voter) votersId;
    address[] votedList;
    
    
    struct Proposal{
        string name;
        string description;
        address proposer;
        uint voteCount;
    }
    
    
    //Proposal[] ProposalsList;
    mapping(uint => Proposal) public Proposals;
    
    //Events
    event Voted();
    
    uint id;
    
    function makeProposal(string memory _name, string memory _description, address _proposer) public {
        uint num = 0;
        id += 1;
        
        require(voteOwner == msg.sender);
        
        Proposals[id] = Proposal({
           name: _name,
           description: _description,
           proposer: _proposer,
           voteCount: num
        });
        
        Proposals[id];
    }
    
    
    
    function registerVoter() public{
        uint num = 1;

        if(voteOwner == msg.sender ){
            voters.push(Voter({
              voter: msg.sender,
              uniqueVote: num,
              voted: false
            }));
        }
    }
    

    
    function vote(uint Proposal_id) public {
        require(msg.sender == voteOwner);
        
        if(votersId[msg.sender].voted == false){
            votedList.push(msg.sender);
        }
        
        for(uint i=0; i<votedList.length; i++){
            if(votedList[i] == msg.sender && Proposals[Proposal_id].voteCount <= votersId[msg.sender].uniqueVote){
            votedList.push(msg.sender);
            Proposals[Proposal_id].voteCount += 1;
            votersId[msg.sender].voted = true;
            }
        }
        Proposals[Proposal_id].voteCount;
        
    }
    
    
    function checkVotedList() public view returns(bool voted){
        
        for(uint i=0; i<votedList.length; i++){
            if(msg.sender == votedList[i]){
                voted = votersId[msg.sender].voted;
                return voted;
            }
        }
    }
}
