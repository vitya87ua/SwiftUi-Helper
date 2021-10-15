//
//  AlertWithTextField.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 01.10.2021.
//

import SwiftUI

struct AlertWithTextField: View {

    let title: String
    let placeholder: String?

    @Binding var text: String
    @Binding var isShowing: Bool

    private let screenSize = UIScreen.main.bounds

    var body: some View {
        VStack {
            Text(title)

            TextField(placeholder ?? "", text: self.$text)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            HStack(spacing: screenSize.width / 3.5) {
                Button("Cancel") {
                    self.isShowing.toggle()
                }

                Button("Ok") {
                    self.isShowing.toggle()
                }
            }
        }
        .padding()
        .frame(width: screenSize.width * 0.7)
        .background(Color(.systemGray5))
        .cornerRadius(25)
        .shadow(color: .gray, radius: 10, x: 0.0, y: 0.0)

    }
}

// del not use
struct TextFieldAlert<Presenting>: View where Presenting: View {

    @Binding var isShowing: Bool
    @Binding var text: String

    let presenting: Presenting
    let title: String

    var body: some View {
        GeometryReader { (deviceSize: GeometryProxy) in
            ZStack {
                self.presenting
                    .disabled(isShowing)
                VStack {
                    Text(self.title)
                    TextField("", text: self.$text)
                    Divider()
                    HStack {
                        Button {
                            withAnimation {
                                self.isShowing.toggle()
                            }
                        } label: {
                            Text("Dismiss")
                        }
                    }
                }
                .padding()
                .background(Color.white)
                .frame(
                    width: deviceSize.size.width * 0.7,
                    height: deviceSize.size.height * 0.7
                )
                .shadow(radius: 1)
                .opacity(self.isShowing ? 1 : 0)
            }
            .onAppear {
                text.removeAll()
            }
        }
    }

}

extension View {
    func textFieldAlert(isShowing: Binding<Bool>, text: Binding<String>, title: String) -> some View {
        TextFieldAlert(isShowing: isShowing, text: text, presenting: self, title: title)
    }
}

#if DEBUG
struct AlertWithTextField_Previews: PreviewProvider {
    static var previews: some View {
        AlertWithTextField(title: "Error!", placeholder: "Enter text here!", text: .constant(""), isShowing: .constant(true))
    }
}
#endif
