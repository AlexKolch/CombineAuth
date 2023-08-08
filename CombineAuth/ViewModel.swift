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
}
