import XCTest
import CommonCryptoWrapper

final class CCTests: XCTestCase {
    
    func testPBKDF2WithSHA512() {
        let asciiDigitOne: UInt8 = 49
        XCTAssertEqual(pbkdf2WithSHA512(salt: [], keyCount: 0, rounds: 0), [])
        XCTAssertEqual(pbkdf2WithSHA512(salt: [asciiDigitOne], keyCount: 1, rounds: 1), [181])
    }
    
    func testHMACWithSHA512() {
        let asciiDigitZero: UInt8 = 48
        let expectedResult: [UInt8] = [
            226, 114, 78, 184, 109, 230, 34, 158,
            42, 182, 195, 148, 194, 0, 186, 37,
            6, 226, 165, 243, 240, 96, 25, 227,
            83, 22, 173, 69, 86, 25, 160, 255,
            50, 6, 36, 191, 77, 185, 136, 163,
            106, 3, 193, 187, 222, 168, 30, 17,
            149, 18, 36, 57, 250, 12, 27, 125,
            119, 251, 128, 85, 172, 153, 158, 31
        ]
        XCTAssertEqual(hmacWithSHA512(key: [asciiDigitZero], data: [asciiDigitZero]), expectedResult)
    }
    
}
