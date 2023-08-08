//
//  CustomTextFieldStyle.swift
//  CombineAuth
//
//  Created by Алексей Колыченков on 08.08.2023.
//

import SwiftUI

struct CustomTextFieldStyle: TextFieldStyle {

    func _body(configuration: TextField<Self._Label>) -> some View {
        return configuration
            .textFieldStyle(.plain)
            .padding(.horizontal, 8)
            .frame(height: 45)
            .cornerRadius(10)
            .foregroundColor(.white)
            .accentColor(.pink)
            .keyboardType(.default)
            .autocorrectionDisabled()
            .textInputAutocapitalization(.never)
    }
}
