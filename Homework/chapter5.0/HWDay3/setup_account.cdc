import NonFungibleToken from 0x02
import CryptoPoops from 0x01

// This transaction is what an account would run
// to set itself up to receive NFTs

transaction {

    prepare(signer: AuthAccount) {
        // Return early if the account already has a collection
        if signer.borrow<&CryptoPoops.Collection>(from: /storage/CryptoPoopsCollection) != nil {
            return
        }

        // Create a new empty collection
        let collection <- CryptoPoops.createEmptyCollection()

        // save it to the account
        signer.save(<-collection, to: /storage/CryptoPoopsCollection)

        // create a public capability for the collection
        signer.link<&{NonFungibleToken.CollectionPublic, CryptoPoops.CollectionPublic}>(
            /public/CryptoPoopsCollection,
            target: /storage/CryptoPoopsCollection
        )
    }
}