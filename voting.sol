//SPDX-License-Identifier: MIT

pragma solidity >= 0.7.0 <0.9.0;


contract voting{

    address voteOwner;


    constructor(){
        voteOwner = msg.sender;
    }
    
    
    struct Voter{
        string name;
        bool vote;
        //bool eligibility; //voter is required to have a certain amount of votes in order
        address voted;
    }

    
    Voter[] public voters;
    mapping(address=>Voter) votersName;
    address[] votedList;
    
 
    struct Proposal{
        string name;
        string description;
        address proposer;
        uint voteCount;
    }
    
    
    uint id;
    
    mapping(uint => Proposal) public Proposals;
    
    //Events
    event Voted();
    
    
    function makeProposal(string memory _name, string memory _description, address _proposer) public {
        uint num = 0;
        id+=1;
        
        require(voteOwner == msg.sender);
        
        Proposals[id] = Proposal({
           name: _name,
           description: _description,
           proposer: _proposer,
           voteCount: num
        });
        
        Proposals[id];
    }
    

    
    function registerAddress(address voterAddress, string memory _name) public{
        if(voterAddress == msg.sender ){
            voters.push(Voter({
              name: _name,
              vote: false,
              voted: msg.sender
            }));
        }
    }
    
    
    
    function getVoter(address _voter) public view returns(string memory){
        return votersName[_voter].name;
    }
    
    

    function vote(uint Proposal_id) public {
        require(msg.sender == voteOwner);
        Proposals[Proposal_id].voteCount += 1;
        votedList.push(votersName[msg.sender].voted);
        
        for(uint i=0; i<votedList.length; i++){
            if(votedList[i] == msg.sender ){
                revert("Already Voted");
            }
        }
    }
    
}
