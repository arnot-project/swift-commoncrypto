import Foundation
import SwiftCommonCrypto

public func pbkdf2WithSHA512(salt: [UInt8], keyCount: Int, rounds: UInt32) -> [UInt8] {
    let password = UnsafeMutablePointer<Int8>.allocate(capacity: 0)
    let saltCopy = UnsafeMutablePointer<UInt8>.allocate(capacity: salt.count)
    let derivedKey = UnsafeMutablePointer<UInt8>.allocate(capacity: keyCount)
    var derivedKeyCopy = [UInt8](repeating:0, count:keyCount)
    
    for i in 0..<salt.count {
        (saltCopy + i).initialize(to: salt[i])
    }
    for i in 0..<keyCount {
        (derivedKey + i).initialize(to: 0)
    }
    
    let derivationStatus = CCKeyDerivationPBKDF(
        CCPBKDFAlgorithm(kCCPBKDF2),
        password,
        0,
        saltCopy,
        salt.count,
        CCPseudoRandomAlgorithm(CCPBKDFAlgorithm(kCCPRFHmacAlgSHA512)),
        rounds,
        derivedKey,
        keyCount
    )
    
    for i in 0..<keyCount {
        derivedKeyCopy[i] = (derivedKey + i).pointee
    }
    
    password.deallocate()
    saltCopy.deallocate()
    derivedKey.deallocate()
    
    return derivationStatus == 0 ? derivedKeyCopy : []
}

public func hmacWithSHA512(key: [UInt8], data: [UInt8]) -> [UInt8] {
    let capacity = 64
    let macOut = UnsafeMutablePointer<UInt8>.allocate(capacity: capacity)
    let keyCopy = UnsafeMutablePointer<UInt8>.allocate(capacity: key.count)
    let dataCopy = UnsafeMutablePointer<UInt8>.allocate(capacity: data.count)
    var macCopy: [UInt8] = Array(repeating: 0, count: capacity)
    
    for i in 0..<capacity {
        (macOut + i).initialize(to: 0)
    }
    for i in 0..<key.count {
        (keyCopy + i).initialize(to: key[i])
    }
    for i in 0..<data.count {
        (dataCopy + i).initialize(to: data[i])
    }
    
    CCHmac(
        CCHmacAlgorithm(kCCHmacAlgSHA512),
        keyCopy,
        key.count,
        dataCopy,
        data.count,
        macOut
    )
    
    for i in 0..<capacity {
        macCopy[i] = (macOut + i).pointee
    }
    
    macOut.deallocate()
    keyCopy.deallocate()
    dataCopy.deallocate()
    
    return macCopy
}
