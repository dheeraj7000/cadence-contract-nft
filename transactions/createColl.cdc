import CryptoGeeks from 0x09
import NonFungibleToken from 0x09

transaction() {
  prepare(signer: AuthAccount) {
    // Store a `CryptoPoops.Collection` in our account storage.
    signer.save(<- CryptoGeeks.createEmptyCollection(), to: /storage/MyCollection)
    
    // NOTE: We expose `&CryptoPoops.Collection{CryptoPoops.CollectionPublic}`, which 
    // only contains `deposit` and `getIDs`.
    signer.link<&CryptoGeeks.Collection{CryptoGeeks.CollectionPublic, NonFungibleToken.CollectionPublic}>(/public/MyCollection, target: /storage/MyCollection)
    log("Created Collection Successfully")
  }
}

 