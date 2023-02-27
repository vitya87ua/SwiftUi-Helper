//
//  CombineTestViewModel.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 15.02.2023.
//

import Combine
import Foundation

final class CombineTestViewModel: ObservableObject {
    
    @Published var dateText1: String = ""
//    var dateText = Just("First")
    @Published var dateText: String = "First"
    @Published var fieldText: String = "First"
    var cancellable = Set<AnyCancellable>()
    
    init() {
    }
    
//    var isSignupFormValidPublisher: AnyPublisher<String, Never> {
//        $dateText
//            .map { _ in
//                Date().description
//            }
//            .sink { value in
//                dateText = value
//            }
//            .store(in: &cancellable)
//    }
    
    func printDate() {
        $fieldText
            .map { char in
                if char == "One" {
                    return String(char + " 1").lowercased()
                } else {
                    return String(char).uppercased()
                }
            }
            .sink(receiveCompletion: { com in
                Log(com, state: .warning)
            }, receiveValue: { val in
                self.dateText1 = val
                Log(val, state: .info)
            })
            .store(in: &cancellable)
    }
    
    func stop() {
//        $fieldText
            
//            .map { char in
//                if char == "One" {
//                    return String(char + " 1").lowercased()
//                } else {
//                    return String(char).uppercased()
//                }
//            }
//            .sink(receiveCompletion: { com in
//                Log(com, state: .warning)
//            }, receiveValue: { val in
//                self.dateText1 = val
//                Log(val, state: .info)
//            })
//            .store(in: &cancellable)
    }
    
    
//    func printDate() {
//        $dateText
//            .map { _ in
//                Date().description
//            }
//            .receive(on: DispatchQueue.main)
//            .sink { starl in
//                Log(starl, state: .warning)
//            } receiveValue: { value in
//                self.dateText = value
//                Log(value, state: .info)
//                Log(self.dateText1, state: .info)
//            }
//            .store(in: &cancellable)
//    }
}

