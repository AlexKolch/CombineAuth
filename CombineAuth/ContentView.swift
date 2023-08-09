//
//  ContentView.swift
//  CombineAuth
//
//  Created by Алексей Колыченков on 08.08.2023.
//

import SwiftUI

struct ContentView: View {

    @StateObject private var viewModel = ViewModel()

    private let screen = UIScreen.main.bounds.width

    var body: some View {
        ZStack {
            Color.dark
                .ignoresSafeArea() 
            ScrollView {

                VStack(spacing: 35) {

                    Image("Boy")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: screen / 1.25, height: screen / 1.25)

                    Text("Authorization")
                        .font(.title)
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                        .padding(8)

                    VStack(spacing: 20) {
                        CustomTextField(title: "Email", text: $viewModel.email, promt: viewModel.emailPromt, isSecure: false)
                        CustomTextField(title: "Phone", text: $viewModel.phone, promt: viewModel.phonePrompt, isSecure: false)
                            .onChange(of: viewModel.phone) { _ in
                                DispatchQueue.main.async {
                                    viewModel.phone = viewModel.phone.formattedMask(text: viewModel.phone, mask: "+X (XXX) XXX-XX-XX") ///применяем маску
                                }
                            }
                            .keyboardType(.decimalPad) //модификатор задает цифровую клавиатуру
                        CustomTextField(title: "Password", text: $viewModel.password, promt: viewModel.passwordPrompt, isSecure: true)
                    }
                    .padding(.horizontal)

                    Button {} label: {
                        ZStack {
                            if viewModel.canSubmit {
                                AnimatedGradient(colors: [.purple, .cyan])
                            } else {
                                Rectangle()
                                    .foregroundColor(.gray)
                            }
                            Text("Login")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                                .fontDesign(.rounded)
                        }
                        .cornerRadius(12)
                        .frame(width: 150, height: 50)
                    }
                    .disabled(!viewModel.canSubmit)
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
