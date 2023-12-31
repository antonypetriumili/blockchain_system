// SPDX-License-Identifier: Apache-2.0
// !! THIS FILE WAS AUTOGENERATED BY abi-to-sol v0.6.6. SEE SOURCE BELOW. !!
pragma solidity >=0.7.0 <0.9.0;
pragma experimental ABIEncoderV2;

interface AirSwap {
    fallback() external payable;

    function provideDelegateOrder(Types.Order memory order, address delegate)
        external
        payable;

    function swap(Types.Order memory order) external payable;

    function swapContract() external view returns (address);

    function wethContract() external view returns (address);
}

interface Types {
    struct Order {
        uint256 nonce;
        uint256 expiry;
        Party signer;
        Party sender;
        Party affiliate;
        Signature signature;
    }

    struct Party {
        bytes4 kind;
        address wallet;
        address token;
        uint256 amount;
        uint256 id;
    }

    struct Signature {
        address signatory;
        address validator;
        bytes1 version;
        uint8 v;
        bytes32 r;
        bytes32 s;
    }
}

// THIS FILE WAS AUTOGENERATED FROM THE FOLLOWING ABI JSON:
/*
[{"inputs":[{"internalType":"address","name":"wrapperSwapContract","type":"address"},{"internalType":"address","name":"wrapperWethContract","type":"address"}],"stateMutability":"nonpayable","type":"constructor"},{"stateMutability":"payable","type":"fallback"},{"inputs":[{"components":[{"internalType":"uint256","name":"nonce","type":"uint256"},{"internalType":"uint256","name":"expiry","type":"uint256"},{"components":[{"internalType":"bytes4","name":"kind","type":"bytes4"},{"internalType":"address","name":"wallet","type":"address"},{"internalType":"address","name":"token","type":"address"},{"internalType":"uint256","name":"amount","type":"uint256"},{"internalType":"uint256","name":"id","type":"uint256"}],"internalType":"struct Types.Party","name":"signer","type":"tuple"},{"components":[{"internalType":"bytes4","name":"kind","type":"bytes4"},{"internalType":"address","name":"wallet","type":"address"},{"internalType":"address","name":"token","type":"address"},{"internalType":"uint256","name":"amount","type":"uint256"},{"internalType":"uint256","name":"id","type":"uint256"}],"internalType":"struct Types.Party","name":"sender","type":"tuple"},{"components":[{"internalType":"bytes4","name":"kind","type":"bytes4"},{"internalType":"address","name":"wallet","type":"address"},{"internalType":"address","name":"token","type":"address"},{"internalType":"uint256","name":"amount","type":"uint256"},{"internalType":"uint256","name":"id","type":"uint256"}],"internalType":"struct Types.Party","name":"affiliate","type":"tuple"},{"components":[{"internalType":"address","name":"signatory","type":"address"},{"internalType":"address","name":"validator","type":"address"},{"internalType":"bytes1","name":"version","type":"bytes1"},{"internalType":"uint8","name":"v","type":"uint8"},{"internalType":"bytes32","name":"r","type":"bytes32"},{"internalType":"bytes32","name":"s","type":"bytes32"}],"internalType":"struct Types.Signature","name":"signature","type":"tuple"}],"internalType":"struct Types.Order","name":"order","type":"tuple"},{"internalType":"contract IDelegate","name":"delegate","type":"address"}],"name":"provideDelegateOrder","outputs":[],"stateMutability":"payable","type":"function"},{"inputs":[{"components":[{"internalType":"uint256","name":"nonce","type":"uint256"},{"internalType":"uint256","name":"expiry","type":"uint256"},{"components":[{"internalType":"bytes4","name":"kind","type":"bytes4"},{"internalType":"address","name":"wallet","type":"address"},{"internalType":"address","name":"token","type":"address"},{"internalType":"uint256","name":"amount","type":"uint256"},{"internalType":"uint256","name":"id","type":"uint256"}],"internalType":"struct Types.Party","name":"signer","type":"tuple"},{"components":[{"internalType":"bytes4","name":"kind","type":"bytes4"},{"internalType":"address","name":"wallet","type":"address"},{"internalType":"address","name":"token","type":"address"},{"internalType":"uint256","name":"amount","type":"uint256"},{"internalType":"uint256","name":"id","type":"uint256"}],"internalType":"struct Types.Party","name":"sender","type":"tuple"},{"components":[{"internalType":"bytes4","name":"kind","type":"bytes4"},{"internalType":"address","name":"wallet","type":"address"},{"internalType":"address","name":"token","type":"address"},{"internalType":"uint256","name":"amount","type":"uint256"},{"internalType":"uint256","name":"id","type":"uint256"}],"internalType":"struct Types.Party","name":"affiliate","type":"tuple"},{"components":[{"internalType":"address","name":"signatory","type":"address"},{"internalType":"address","name":"validator","type":"address"},{"internalType":"bytes1","name":"version","type":"bytes1"},{"internalType":"uint8","name":"v","type":"uint8"},{"internalType":"bytes32","name":"r","type":"bytes32"},{"internalType":"bytes32","name":"s","type":"bytes32"}],"internalType":"struct Types.Signature","name":"signature","type":"tuple"}],"internalType":"struct Types.Order","name":"order","type":"tuple"}],"name":"swap","outputs":[],"stateMutability":"payable","type":"function"},{"inputs":[],"name":"swapContract","outputs":[{"internalType":"contract ISwap","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"wethContract","outputs":[{"internalType":"contract IWETH","name":"","type":"address"}],"stateMutability":"view","type":"function"}]
*/