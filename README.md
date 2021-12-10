# Common Crypto Wrapper

## Overview

This Swift Package is a wrapper of Common Crypto library[1].
It is accessing the system library (Common Crypto) and wrapps two functions: `pbkdf2WithSHA512` and `hmacWithSHA512`.
CommonCryptoWrapper package is providing simplified interface for a subset of common crypto functions and handles memory management of the UnsafePointers[2].

## Documentation and white papers:

[1] [Common Crypto](https://developer.apple.com/security)

[2][UnsafePointer](https://developer.apple.com/documentation/swift/unsafepointer)
