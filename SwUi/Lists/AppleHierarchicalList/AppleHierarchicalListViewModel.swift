//
//  AppleHierarchicalListViewModel.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 05.02.2022.
//

import Foundation

struct FileItem: Hashable, Identifiable, CustomStringConvertible {
    var id: Self { self }
    var name: String
    var children: [FileItem]? = nil
    var description: String {
        switch children {
        case nil:
            return "📄 \(name)"
        case .some(let children):
            return children.isEmpty ? "📂 \(name)" : "📁 \(name)"
        }
    }
}

final class AppleHierarchicalListViewModel: ObservableObject {

    @Published var fileHierarchyData: [FileItem] = [
        FileItem(name: "users", children:
                    [FileItem(name: "user1234", children:
                                [FileItem(name: "Photos", children:
                                            [FileItem(name: "photo001.jpg"),
                                             FileItem(name: "photo002.jpg")]),
                                 FileItem(name: "Movies", children:
                                            [FileItem(name: "movie001.mp4")]),
                                 FileItem(name: "Documents", children: [])
                                ]),
                     FileItem(name: "newuser", children:
                                [FileItem(name: "Documents", children: [])
                                ])
                    ]),
        FileItem(name: "private", children: nil)
    ]

    func add() {
        fileHierarchyData[0].children?.append(FileItem(name: "New", children: []))
    }
}
