import CryptoPoops from 0x01

pub fun main(account:Address) {
    let acc = getAccount(account)
    let collectionRef = acc.getCapability(/public/CryptoPoopsCollection)
                            .borrow<&{CryptoPoops.CollectionPublic}>()
    if collectionRef == nil {
        log("Account".concat(acc.address.toString()).concat("Don't have element collection"))
    }
    else{
        log(collectionRef!.getIDs())
    }
}
 