//
//  ContentView.swift
//  CombineAuth
//
//  Created by Алексей Колыченков on 08.08.2023.
//

import SwiftUI

struct ContentView: View {

    @StateObject private var viewModel = ViewModel()

    private let screen = UIApplication.shared.connectedScenes.compactMap {
        ($0 as? UIWindowScene)?.keyWindow}.first?.screen.bounds.width


    var body: some View {
        ZStack {
            Color.dark
                .ignoresSafeArea()
            ScrollView {

                VStack(spacing: 35) {

                    if let screen = screen {
                        Image("Boy")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: screen / 1.25, height: screen / 1.25)
                    }

                    Text("Authorization")
                        .font(.title)
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                        .padding(8)

                    VStack(spacing: 20) {
                        CustomTextField(title: "Email", text: $viewModel.email, isSecure: false)
                        CustomTextField(title: "Phone", text: $viewModel.phone, isSecure: false)
                        CustomTextField(title: "Password", text: $viewModel.password, isSecure: true)
                    }
                    .padding(.horizontal)

                    Button {} label: {
                        ZStack {
                            AnimatedGradient(colors: [.purple, .cyan])
                                .cornerRadius(12)
                                .frame(width: 150, height: 50)
                            Text("Login")
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                                .fontDesign(.rounded)
                        }
                    }
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
