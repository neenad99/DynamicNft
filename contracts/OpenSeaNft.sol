// contracts/MyNFT.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@chainlink/contracts/src/v0.6/VRFConsumerBase.sol";

contract OpenSeaNft is ERC721,VRFConsumerBase {
    bytes32 public keyHash;
    address public _vrfCoordinator;
    uint256 internal fee;
    uint256 public randomResult;

    struct Character {
        uint256 strength;
        uint256 speed;
        uint256 stamina;
        string name;
    }

    Character[] public characters;

    mapping(bytes32 => string) requestToCharacterName;
    mapping(bytes32 => address) requestToSender;
    mapping(bytes32 => uint256) requestTokenId;
    
    constructor(address _VRFCordinator, address _LinkToken,bytes32 _keyHash) public
    VRFConsumerBase(_VRFCordinator,_LinkToken)
    ERC721("OpenSeaNft", "NFT") {
        _vrfCoordinator = _VRFCordinator;
        keyHash = _keyHash;
        fee = 0.1 * 10**18;
    }

    function requestNewRandomCharacter (uint256 userProvidedSeed,string memory name)public returns (bytes32){
        bytes32 requestId = requestRandomness(keyHash,fee,userProvidedSeed);
        requestToCharacterName[requestId] = name;
        requestToSender[requestId] = msg.sender;
        return requestId;
    }

    function fulfillRandomness(bytes32 requestId, uint256 randomNumber)
    internal override {
        //define creation of the NFT
        uint256 newId = characters.length;
        uint256 strength = (randomNumber % 100);
        uint256 speed = ((randomNumber % 10000)/100);
        uint256 stamina = ((randomNumber % 1000000)/10000);

        characters.push(
            Character(
                strength,
                stamina,
                speed,
                requestToCharacterName[requestId]
            )
        );
        _safeMint(requestToSender[requestId],newId); //mints nft and sends it to the owner 
    }
    
    function setTokenURI(uint256 tokenId,string memory _tokenURI) public {
        require(
            _isApprovedOrOwner(_msgSender(),tokenId),
            "ERC721: transfer caller is not owner nor approved"
        );
        _setTokenURI(tokenId,_tokenURI); // render the image  of character used for nft
    }
}   