//
//  CombineJSON.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 05.11.2021.
//

import Foundation
import Combine
import UIKit

struct Repository: Codable {
    var name: String
    var full_name: String
}

class CombineJSON: ObservableObject {

    @Published var repo: Repository?

    @Published var myText: String = ""
    @Published var myImage: UIImage?

    var cancellable: Set<AnyCancellable> = []

    func makeText() {

    }

    func someF() {
        let url = URL(string: "https://api.github.com/repos/johnsundell/publish")!

        let shared = URLSession.shared.dataTaskPublisher(for: url)
        shared
            .map(\.data)
            .decode(type: Repository.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main, options: nil)
            .sink { result in
                switch result {
                case .finished:
                    print(#fileID, #function, #line, "finished")
                case .failure(let error):
                    print(#fileID, #function, #line, "failure-error", error.localizedDescription)
                }
            } receiveValue: { value in
                self.repo = value
                print(#fileID, #function, #line, "value", value)
            }
            .store(in: &cancellable)
    }

    func getImage() {
        let url = URL(string: "https://mzimg.com/big/11/gowbfpth011.jpg")!

        let image = URLSession.shared.dataTaskPublisher(for: url)
        image
            .receive(on: DispatchQueue.main, options: nil)
            .sink { result in
                switch result {
                case .finished:
                    print(#fileID, #function, #line, "finished")
                case .failure(let error):
                    print(#fileID, #function, #line, "failure-error", error.localizedDescription)
                }
            } receiveValue: { value in
                self.myImage = UIImage(data: value.data)
            }
            .store(in: &cancellable)
    }
}
