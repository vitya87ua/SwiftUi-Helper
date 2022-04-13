//
//  DragAndDropUrlView.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 04.04.2022.
//

import SwiftUI

struct Grid: Identifiable {
    var id = UUID().uuidString
    var gridText: String
}

class DragAndDropUrlViewModel: ObservableObject{
    @Published var gridItems = [
        Grid(gridText: "Grid 1"),
        Grid(gridText: "grid 2"),
        Grid(gridText: "grid 3"),
        Grid(gridText: "grid 4"),
        Grid(gridText: "grid 5"),
        Grid(gridText: "grid 6"),
        Grid(gridText: "grid 7"),
        Grid(gridText: "grid 8"),
        Grid(gridText: "grid 9"),
        Grid(gridText: "grid 10"),
        Grid(gridText: "grid 11"),
    ]
    @Published var currentGrid: Grid?
}

struct DragAndDropUrlView: View {
    
    @StateObject var gridData: DragAndDropUrlViewModel = DragAndDropUrlViewModel()
    
    let columns: [GridItem] = Array(repeating: GridItem(.flexible(), spacing: 10), count: 2)
    
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(gridData.gridItems) { grid in
                        ZStack {
                            Color.secondary
                            Text(grid.gridText)
                                .foregroundColor(.white)
                        }
                        .frame(height: 150)
                        .cornerRadius(15)
                        .onDrag {
                            gridData.currentGrid = grid
                            return NSItemProvider(object: String(grid.gridText) as NSString)
                        }
                        .onDrop(of: [.text], delegate: DropViewDelegate(grid: grid, gridData: gridData))
                    }
                }
                .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.ignoresSafeArea(.all, edges: .all))
    }
}

#if DEBUG
struct DragAndDropUrlView_Previews: PreviewProvider {
    static var previews: some View {
        DragAndDropUrlView()
    }
}
#endif

struct DropViewDelegate: DropDelegate {
    
    var grid: Grid
    var gridData: DragAndDropUrlViewModel
    
    func performDrop(info: DropInfo) -> Bool {
        ///To never disappear drag item when dropped outside
        //gridData.currentGrid = nil
        return true
    }
    
    func dropEntered(info: DropInfo) {
        
        let fromIndex = gridData.gridItems.firstIndex { (grid) -> Bool in
            return grid.id == gridData.currentGrid?.id
        } ?? 0
        
        let toIndex = gridData.gridItems.firstIndex { (grid) -> Bool in
            return grid.id == self.grid.id
        } ?? 0
        
        if fromIndex != toIndex{
            withAnimation(.default) {
                let fromGrid = gridData.gridItems[fromIndex]
                gridData.gridItems[fromIndex] = gridData.gridItems[toIndex]
                gridData.gridItems[toIndex] = fromGrid
            }
        }
    }
    
    // setting Action as Move...
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move)
    }
}
