//
//  String+extensions.swift
//  KssiusBank
//
//  Created by Cassio Sousa on 18/06/23.
//  Copyright © 2023 Cassio Sousa. All rights reserved.
//

import Foundation

extension String {
    var toCurrency : String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.currencyCode = "BRL"
        currencyFormatter.numberStyle  = .currencyAccounting
        return currencyFormatter.string(from: NSDecimalNumber(string: self)) ?? ""
    }

    var toAccountFormat : String? {
        let accountRange = NSRange(
            self.startIndex..<self.endIndex,
            in: self
        )

        //create Regular Expression
        let capturePattern =
            #"(?<firstPart>\d{1,2})"# +
            #"(?<secondPart>\d{1,4})"# +
            #"(?<thirdPart>\d{1,2})"#

        let accountRegex = try? NSRegularExpression(
            pattern: capturePattern,
            options: []
        )

        // Find the matching capture groups
        let matches = accountRegex?.matches(
            in: self,
            options: [],
            range: accountRange
        )


        guard let match = matches?.first else {
            return nil
        }
        let firstPart = "firstPart",
            secondPart = "secondPart",
            thirdPart = "thirdPart",
            elements = [firstPart, secondPart, thirdPart]

        //Extract name by group
        var formattedAccount = ""
        for name in elements {
            let matchRange = match.range(withName: name)

            // Extract the substring matching the named capture group
            var capturedValue = ""
            if let substringRange = Range(matchRange, in: self) {
                let capture = String(self[substringRange])
                capturedValue = capture

            }
            // mount account string
            switch name {
            case firstPart:
                formattedAccount = "\(capturedValue)."
                continue
            case secondPart:
                formattedAccount = "\(formattedAccount)\(capturedValue)-"
                continue
            default:
                formattedAccount = "\(formattedAccount)\(capturedValue)"
            }

        }

        return formattedAccount
    }
}
