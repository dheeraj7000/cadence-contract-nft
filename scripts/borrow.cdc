import CryptoGeeks from 0x09

pub fun main(account: Address, id: UInt64): Data {
  let CryptoPoopsCollection = getAccount(account).getCapability(/public/gsasm)
                        .borrow<&CryptoGeeks.Collection{CryptoGeeks.CollectionPublic}>()
                        ?? panic("Could not borrow the Collection from the account.")
  let CryptoPoops = CryptoPoopsCollection.borrowNFT(id: id) as! &CryptoGeeks.NFT?
  return Data(CryptoPoops, CryptoPoops!.name)
}

pub struct Data {
  pub let CryptoPoops: &CryptoGeeks.NFT?
  pub let name: String

  init(_ CryptoDaps: &CryptoGeeks.NFT?, _ name: String) {
    self.CryptoPoops = CryptoDaps
    self.name = name
  }
}