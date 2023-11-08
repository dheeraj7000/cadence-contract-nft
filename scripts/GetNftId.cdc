import CryptoGeeks from 0x09
import NonFungibleToken from 0x09

pub fun main(User: Address) {

    // Get a reference to the User`s public Collection
    let recipientsCollection = getAccount(User).getCapability(/public/MyCollection)
                                  .borrow<&CryptoGeeks.Collection{CryptoGeeks.CollectionPublic}>()
                                  ?? panic("The recipient does not have a Collection.")

    // Get all the NFT IDs using
    var NFTs = recipientsCollection.getIDs()

    // log the NFT IDs
    log(NFTs)
}