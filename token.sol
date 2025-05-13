// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/// @title NEXO Token
/// @notice NEXO es un token diseñado para escalabilidad en medios de pago digitales y tangibles.
/// Compatible con múltiples redes blockchain y optimizado para juegos y plataformas de intercambio.
contract NexoToken is ERC20, Ownable {
    uint256 private constant INITIAL_SUPPLY = 10_000_000 * 10 ** 18; // 10,000,000 tokens con 18 decimales

    /// @notice Constructor del contrato NEXO
    constructor() ERC20("NEXO", "NEXO") {
        _mint(msg.sender, INITIAL_SUPPLY); // Crea el suministro inicial y lo asigna al deployer
    }

    /// @notice Función para que el propietario del contrato emita nuevos tokens
    /// @param account La dirección a la que se enviarán los nuevos tokens
    /// @param amount La cantidad de tokens a emitir
    function mint(address account, uint256 amount) external onlyOwner {
        _mint(account, amount);
    }

    /// @notice Función para que el propietario del contrato queme tokens
    /// @param amount La cantidad de tokens a quemar
    function burn(uint256 amount) external onlyOwner {
        _burn(msg.sender, amount);
    }
}
