//
//  CustomTextField.swift
//  CombineAuth
//
//  Created by Алексей Колыченков on 08.08.2023.
//

import SwiftUI

struct CustomTextField: View {

    private var title: String
    private var text: Binding<String>
    private var promt: String?
    private var isSecure: Bool

    init(title: String, text: Binding<String>, promt: String? = nil, isSecure: Bool) {
        self.title = title
        self.text = text
        self.promt = promt
        self.isSecure = isSecure
    }

    var body: some View {

        VStack(alignment: .leading) {

            if isSecure {
                SecureField(title, text: text)
                    .textFieldStyle(CustomTextFieldStyle())
                    .background(promt == nil ? Color.white.opacity(0.1) : Color.red.opacity(0.15))
                    .cornerRadius(10)
            } else {
               TextField(title, text: text)
                    .textFieldStyle(CustomTextFieldStyle())
                    .background(promt == nil ? Color.white.opacity(0.1) : Color.red.opacity(0.15))
                    .cornerRadius(10)
            }

            if let promt = promt {
                Text(promt)
                    .foregroundColor(.red)
                    .font(.caption)
                    .padding(.horizontal)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
