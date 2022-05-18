//
//  BackToRootExample.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 16.02.2022.
//

import SwiftUI

struct BackToRootExample: View {
    
    @StateObject var navigationUtil: NavigationUtil = NavigationUtil()
    @State var showView1: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 30) {
                Button("Go to View 1") {
                    showView1 = true
                }
                
                NavigationLink(isActive: $showView1) {
                    View1()
                } label: { EmptyView() }
            }
            .navigationTitle("Root")
            .onReceive(navigationUtil.$showRoot) { showRoot in
                if showRoot {
                    showView1 = false
                }
            }
        }
        .environmentObject(navigationUtil)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct View1: View {
    
    @State var showView2: Bool = false
    
    var body: some View {
        Button("Go to View2") {
            showView2 = true
        }
        .navigationTitle("View 1")
        
        NavigationLink(isActive: $showView2) {
            View2()
        } label: { EmptyView() }
    }
}

struct View2: View {
    
    // @Environment(\.dismiss) var dismiss only for iOS 15
    
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject private var navigationUtil: NavigationUtil
    
    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            Button("Back to View 1") {
                presentationMode.wrappedValue.dismiss()
            }
            
            Button("Back to Root") {
                navigationUtil.backToRoot()
            }
        }
        .navigationTitle("View 2")
    }
}

#if DEBUG
struct BackToRootExample_Previews: PreviewProvider {
    static var previews: some View {
        BackToRootExample()
    }
}
#endif
