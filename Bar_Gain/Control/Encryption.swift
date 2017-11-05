//
//  Encryption.swift
//  Bar_Gain
//
//  Created by Gianmaria Biselli on 11/3/17.
//  Copyright © 2017 Gianmaria Biselli. All rights reserved.
//

import Foundation

func encryptData(_ clearTextData : Data, withPassword password : String) -> Dictionary<String, Data>
{
    var setupSuccess = true
    var outDictionary = Dictionary<String, Data>.init()
    var key = Data(repeating:0, count:kCCKeySizeAES256)
    var salt = Data(count: 8)
    salt.withUnsafeMutableBytes { (saltBytes: UnsafeMutablePointer<UInt8>) -> Void in
        let saltStatus = SecRandomCopyBytes(kSecRandomDefault, salt.count, saltBytes)
        if saltStatus == errSecSuccess
        {
            let passwordData = password.data(using:String.Encoding.utf8)!
            key.withUnsafeMutableBytes { (keyBytes : UnsafeMutablePointer<UInt8>) in
                let derivationStatus = CCKeyDerivationPBKDF(CCPBKDFAlgorithm(kCCPBKDF2), password, passwordData.count, saltBytes, salt.count, CCPseudoRandomAlgorithm(kCCPRFHmacAlgSHA512), 14271, keyBytes, key.count)
                if derivationStatus != Int32(kCCSuccess)
                {
                    setupSuccess = false
                }
            }
        }
        else
        {
            setupSuccess = false
        }
    }
    
    var iv = Data.init(count: kCCBlockSizeAES128)
    iv.withUnsafeMutableBytes { (ivBytes : UnsafeMutablePointer<UInt8>) in
        let ivStatus = SecRandomCopyBytes(kSecRandomDefault, kCCBlockSizeAES128, ivBytes)
        if ivStatus != errSecSuccess
        {
            setupSuccess = false
        }
    }
    
    if (setupSuccess)
    {
        var numberOfBytesEncrypted : size_t = 0
        let size = clearTextData.count + kCCBlockSizeAES128
        var encrypted = Data.init(count: size)
        let cryptStatus = iv.withUnsafeBytes {ivBytes in
            encrypted.withUnsafeMutableBytes {encryptedBytes in
                clearTextData.withUnsafeBytes {clearTextBytes in
                    key.withUnsafeBytes {keyBytes in
                        CCCrypt(CCOperation(kCCEncrypt),
                                CCAlgorithm(kCCAlgorithmAES),
                                CCOptions(kCCOptionPKCS7Padding + kCCModeCBC),
                                keyBytes,
                                key.count,
                                ivBytes,
                                clearTextBytes,
                                clearTextData.count,
                                encryptedBytes,
                                size,
                                &numberOfBytesEncrypted)
                    }
                }
            }
        }
        if cryptStatus == Int32(kCCSuccess)
        {
            encrypted.count = numberOfBytesEncrypted
            outDictionary["EncryptionData"] = encrypted
            outDictionary["EncryptionIV"] = iv
            outDictionary["EncryptionSalt"] = salt
        }
    }
    
    return outDictionary;
}
