//
//  RNCryptoKit.swift
//  RNCryptoKit
//
//  Created by Henry Paulino on 7/7/19.
//  Copyright © 2019 Henry Paulino. All rights reserved.
//

import CoreData
import CryptoKit

private func createDataStr(str: String) -> Data {
  let data = Data(str.utf8)
  return data
}

private func createSymmetricKey() -> SymmetricKey {
  return SymmetricKey(size: .bits256)
}

let key: SymmetricKey = SymmetricKey(size: .bits256)

class Crypto {
  static func sha256(_ str: String) -> SHA256Digest {
    return SHA256.hash(data: createDataStr(str: str))
  }
  
  static func sha512(_ str: String) -> SHA512Digest {
    return SHA512.hash(data: createDataStr(str: str))
  }
  
  static func aesEncrypt(_ str: String) throws -> AES.GCM.SealedBox {
    return try AES.GCM.seal(createDataStr(str: str), using: key)
  }
  
  static func aesDecrypt(_ box: AES.GCM.SealedBox) throws -> Data {
    let data = Data(try AES.GCM.open(box, using: key))
    return data
  }
}

////let x = try Crypto.aes("hello world")
////Crypto.sha256("hi")
//let x = try Crypto.aesEncrypt("hello")
////print(x)
//let y = try Crypto.aesDecrypt(x)
////print(y)
