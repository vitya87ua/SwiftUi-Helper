//
//  Alerts.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 01.10.2021.
//

import SwiftUI

struct User: Identifiable {
    let id: String
}

class AnotherAlert: ObservableObject {
    @Published var alert: Alert?

    func createAlert() {
        alert = Alert(title: Text("AnotherAlert"))
    }
}

extension Alert: Identifiable {
    public var id: String { UUID().uuidString }
}

struct Alerts: View {

    @State private var alertPresented: Bool = false

    @State private var user: User?

    @ObservedObject var anotherAlert: AnotherAlert = AnotherAlert()

    var body: some View {
        VStack(spacing: 15) {
            Button("Hello, World!") {
                alertPresented = true
            }
            .alert(isPresented: $alertPresented) {
                Alert(title: Text("Hello"))
            }

            Button("Is Exist?") {
                user = User(id: "YES")
            }
            .alert(item: $user) { user in
                Alert(title: Text(user.id))
            }

            Button("AnotherAlert") {
                anotherAlert.createAlert()
            }
            .alert(item: $anotherAlert.alert) { $0 }

            Button("Is Exist?") {
                user = User(id: "YES")
            }
            .alert(item: $user) { user in
                Alert(title: Text(user.id))
            }
        }
    }
}

#if DEBUG
struct Alerts_Previews: PreviewProvider {
    static var previews: some View {
        Alerts()
    }
}
#endif
