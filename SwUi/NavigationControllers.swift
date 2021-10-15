//
//  NavigationControllers.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 22.09.2021.
//

import SwiftUI

struct NavigationControllers: View {

    @State var isPresented: Bool = false

    var body: some View {
        NavigationView {
            Text("Hello, World!")
                .sheet(isPresented: $isPresented) {
                    VStack {
                        Button {
                            isPresented = false
                        } label: {
                            Text("Button")
                                .bold()
                        }

                        Text("Hello")
                            .onTapGesture {
                                isPresented = false
                            }
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarTitle("Two Screen")
                            .navigationBarItems(
                                trailing:
                                    Button {
                                        isPresented = false
                                    } label: {
                                        Text("Done")
                                            .bold()
                                    }
                            )
                    }
                }
                .onTapGesture {
                    isPresented = true
                }
        }
    }
}

#if DEBUG
struct NavigationControllers_Previews: PreviewProvider {
    static var previews: some View {
        NavigationControllers()
    }
}
#endif
