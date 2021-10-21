//
//  ContentView.swift
//  SwUi
//
//  Created by Віктор Бережницький on 18.06.2021.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var state: Lock
    
    var body: some View {
                
        NavigationView {
            
            VStack(spacing: 20) {
                Text(String(state.count))
                    .font(.title)
                
                NavigationLink(destination: Increq()) {
                        Text("Navigate")
                }
                
            }
        }
        
    }
}

struct One: View {
    
//    @ObservedObject var state: Lock
    
    @EnvironmentObject var state: Lock

    var body: some View {
        VStack(spacing: 5) {
            Text("The First Tab")
            (Text("\(state.count) ") + Text(" \(state.isOn.description)"))
            }
        .font(.title)
    }
    
}


struct MtSrt: View {

    @State var open:  Bool
    
    var body: some View {
        
        let firstColor = open ? Color.red : Color.green
        let secondColor = open ? Color.blue : Color.orange
        
        ZStack {
            RadialGradient(gradient: Gradient(colors: [firstColor, secondColor]), center: .center, startRadius: 5, endRadius: 500)
                .ignoresSafeArea()
            
            HStack {
                Toggle(isOn: $open, label: {
                    Text("Label")
                })
                .toggleStyle(SwitchToggleStyle(tint: .blue))
                .padding(.horizontal, 50)
            }
        }
    }
}

struct Increq: View {
    
    @EnvironmentObject var state: Lock
//    @ObservedObject var state: Lock
    
    var body: some View {
        
        VStack {
            
            Text("\(state.count)")
                .bold()
                .font(.title)
                .foregroundColor( state.count >= 0 ? .blue : .red)
            
            Divider()
                .padding()
            
            HStack(alignment: .center, spacing: 5) {
                
                Button(action: { state.decrease() }) {
                    HStack {
                        Image(systemName: "minus")
                            .font(.title)
                        Text("Minus")
                            .fontWeight(.semibold)
                            .font(.title)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(40)
                }

                
                Button(action: { state.increase() }) {
                    HStack {
                        Image(systemName: "plus")
                            .font(.title)
                        Text("Plus")
                            .fontWeight(.semibold)
                            .font(.title)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(40)
                }
            }
            
        }
        .navigationBarTitle("Hu-h")
        .navigationBarTitleDisplayMode(.automatic)
        .navigationBarItems(
            leading: Button(action: {
                
            }, label: {
                Text("Lead")
            }),
            trailing: HStack {
                Button(action: {
                    
                }, label: {
                    Text("Trail")
                })
                
                Button(action: {
                    
                }, label: {
                    Text("TwoTra")
                })
            })
    }
}


struct Fourth: View {

//    @State var open:  Bool
    @EnvironmentObject var state: Lock
//    @ObservedObject var state: Lock
    
    var body: some View {
        
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.red, .green]), center: .center, startRadius: 5, endRadius: 500)
                .ignoresSafeArea()
            
            HStack {
                Toggle(isOn: $state.isOn, label: {
                    Text("isOn")
                })
                .toggleStyle(SwitchToggleStyle(tint: .blue))
                .padding(.horizontal, 50)
            }
        }
    }
}


#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Lock())
    }
}
#endif







/*
 struct ContentView: View {

     var body: some View {
         TabView {
             One()
             .tabItem {
                 Image(systemName: "star")
                 Text("First")
             }
             MtSrt(open: true)
                 .tabItem {
                     Image(systemName: "car")
                     Text("Two")
                 }
             Increq()
                 .tabItem {
                     Image(systemName: "heart")
                     Text("First")
                 }
             Fourth()
                 .tabItem {
                     Image(systemName: "star.fill")
                     Text("Two")
                 }
         }
         .accentColor(.red)
 //        .environmentObject(state)
     }
 }
 */
