import NonFungibleToken from 0x02
import CryptoPoops from 0x01

// This script uses the NFTMinter resource to mint a new NFT
// It must be run with the account that has the minter resource
// stored in /storage/NFTMinter

transaction(
    recipient: Address,
    _name:String,
    _favouriteFood: String,
    _luckyNumber: Int,
) {

    // local variable for storing the minter reference
    let minter: &CryptoPoops.Minter

    prepare(signer: AuthAccount) {
        // borrow a reference to the NFTMinter resource in storage
        self.minter = signer.borrow<&CryptoPoops.Minter>(from: /storage/Minter)
            ?? panic("Could not borrow a reference to the NFT minter")
    }

    execute {
        // Borrow the recipient's public NFT collection reference
        let receiver = getAccount(recipient)
            .getCapability(/public/CryptoPoopsCollection)
            .borrow<&{NonFungibleToken.CollectionPublic}>()
            ?? panic("Could not get receiver reference to the NFT Collection")

        // Mint the NFT and deposit it to the recipient's collection
        let nft <- self.minter.createNFT(
            name:_name,
            favouriteFood: _favouriteFood,
            luckyNumber: _luckyNumber,
        )
        receiver.deposit(token: <- nft)
        log("Deposit Done")

    }
}