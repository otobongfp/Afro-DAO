//SPDX-License-Identifier: MIT


pragma solidity >= 0.7.0 <0.9.0;

contract theDAO{

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


    mapping(address => Voter) public voters;
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
       Proposals[id] = Proposal({
           name: _name,
           description: _description,
           proposer: _proposer,
           voteCount: num
        });
    }
    
    
    function registerAddress(address voterAddress, string memory _name) public{
        if(voterAddress == msg.sender ){
            
            voters[voterAddress] = Voter({
               name: _name,
               voted: false,
               vote: 1,
               eligibility: true
            });
        }
    }
    
    
    function getVoters(address _voter) public view returns(string memory){
        return voters[_voter].name;
    }
    


    function vote(uint id) public {
        Voter storage sender = voters[msg.sender];
        Proposals[id].voteCount ++;
    }
    
    
    // function registeredAddress(address register) public{
        
    // }

    
}
