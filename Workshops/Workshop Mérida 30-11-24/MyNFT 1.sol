// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyNFT is ERC721URIStorage, Ownable {
    uint256 public nextTokenId; // Contador para el ID del siguiente token

    // Evento para el minting de un nuevo NFT
    event Minted(address indexed recipient, uint256 tokenId, string metadataURI);

    // Constructor para inicializar el contrato
    constructor() ERC721("MainnetNFT", "MNFT") Ownable(msg.sender) {
        // Define al creador como el propietario inicial
    }

    // Función para acuñar (mint) un nuevo NFT
    function mint(address recipient, string memory metadataURI) public onlyOwner {
        require(recipient != address(0), "Recipient cannot be zero address");
        require(bytes(metadataURI).length > 0, "Metadata URI cannot be empty");

        uint256 tokenId = nextTokenId; // Asigna el siguiente ID disponible
        nextTokenId++;                 // Incrementa el contador para el siguiente token

        _mint(recipient, tokenId);     // Acuñar el token
        _setTokenURI(tokenId, metadataURI); // Asignar el URI del metadata

        emit Minted(recipient, tokenId, metadataURI); // Emitir el evento
    }

    // Función para obtener el URI del token
    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        return super.tokenURI(tokenId); // Llama a la implementación de ERC721URIStorage
    }
}