//
//  ViewModel.swift
//  CombineAuth
//
//  Created by Алексей Колыченков on 08.08.2023.
//

import Foundation
import Combine

final class ViewModel: ObservableObject {
    @Published var email = ""
    @Published var phone = ""
    @Published var password = ""
    @Published var canSubmit = false

    var emailPromt: String? {
        if email.isEmpty || isValidEmail == true {
            return nil
        } else {
            return "Enter valid Email. Example: test@test.com"
        }
    }

    var phonePrompt: String? {
        if isValidPhone == true || phone.isEmpty {
            return nil
        } else {
            return "Enter full phone number"
        }
    }

    var passwordPrompt: String? {
        if isValidPassword == true || password.isEmpty {
            return nil
        } else {
            return "Password - requerid field"
        }
    }


    //св-ва для переключения кнопки из неактивной в активную
    @Published private var isValidPhone = false
    @Published private var isValidEmail = false
    @Published private var isValidPassword = false


    private let emailPredicate = NSCompoundPredicate(format: "SELF MATCHES %@", Regex.email.rawValue)
    private let phonePredicate = NSCompoundPredicate(format: "SELF MATCHES %@", Regex.phone.rawValue)

    private var cancellableSet: Set<AnyCancellable> = []

    init() {
        $email
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map { email in
                return self.emailPredicate.evaluate(with: email) ///сравниваем введеный email с регулярным выражением
            }
            .assign(to: \.isValidEmail, on: self)
            .store(in: &cancellableSet)

        $password
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map { password in
                return password.count >= 8
            }
            .assign(to: \.isValidPassword, on: self)
            .store(in: &cancellableSet)

        $phone
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map { phone in
                return self.phonePredicate.evaluate(with: phone)
            }
            .assign(to: \.isValidPhone, on: self)
            .store(in: &cancellableSet)

        Publishers.CombineLatest3($isValidEmail, $isValidPhone, $isValidPassword)
            .map { email, phone, password  in
                return (email && phone && password )
            }
            .assign(to: \.canSubmit, on: self)
            .store(in: &cancellableSet)
    }
}
