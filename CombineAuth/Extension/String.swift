//
//  String.swift
//  CombineAuth
//
//  Created by Алексей Колыченков on 08.08.2023.
//

import SwiftUI

extension String {

    func formattedMask(text: String, mask: String) -> String {
        let cleanPhoneNumber = text.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        var result = ""
        var index = cleanPhoneNumber.startIndex

        for char in mask where index < cleanPhoneNumber.endIndex {
            if char == "X" {
                result.append(cleanPhoneNumber[index])
                index = cleanPhoneNumber.index(after: index)
            } else {
                result.append(char)
            }
        }

        return result
    }
}
