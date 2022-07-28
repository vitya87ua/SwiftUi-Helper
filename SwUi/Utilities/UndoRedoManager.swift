//
//  UndoRedoManager.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 28.07.2022.
//

import Foundation

final class UndoRedoManager<T> {
    
    private(set) var currentStateID: UUID = UUID()
    private(set) var stateIDSequence: [UUID] = []
    private(set) var stateBag: [UUID: T] = [:]
    
    init(defaultState: T) {
        addState(defaultState)
    }

    func addState(_ value: T) {
        let id: UUID = UUID()
        
        removeRedoStates()
        
        currentStateID = id
        
        stateBag[id] = value
        stateIDSequence.append(id)
    }
    
    func undo(_ value: inout T) {
        if let index = stateIDSequence.firstIndex(where: { $0 == currentStateID }) {
            if stateIDSequence.indices.contains(index - 1), let redoValue = stateBag[stateIDSequence[index - 1]] {
                value = redoValue
                currentStateID = stateIDSequence[index - 1]
            } else {
                if let redoValue = stateBag[stateIDSequence[index]] {
                    value = redoValue
                    currentStateID = stateIDSequence[index]
                }
            }
        }
    }
    
    func redo(_ value: inout T) {
        if let index = stateIDSequence.firstIndex(where: { $0 == currentStateID }) {
            if stateIDSequence.indices.contains(index + 1), let redoValue = stateBag[stateIDSequence[index + 1]] {
                value = redoValue
                currentStateID = stateIDSequence[index + 1]
            } else {
                if let redoValue = stateBag[stateIDSequence[index]] {
                    value = redoValue
                    currentStateID = stateIDSequence[index]
                }
            }
        }
    }
    
    var canUndo: Bool {
        if let index = stateIDSequence.firstIndex(where: { $0 == currentStateID }) {
            return stateIDSequence.indices.contains(index - 1)
        } else {
            return false
        }
    }
    
    var canRedo: Bool {
        if let index = stateIDSequence.firstIndex(where: { $0 == currentStateID }) {
            return stateIDSequence.indices.contains(index + 1)
        } else {
            return false
        }
    }
    
    private func removeRedoStates() {
        while canRedo {
            if let currentIndex = stateIDSequence.firstIndex(where: { $0 == currentStateID }) {
                let lastID = stateIDSequence.remove(at: currentIndex + 1)
                stateBag.removeValue(forKey: lastID)
            }
        }
    }
}

// MARK: - Usage

final class SomeClass {
    
    var arrayString: [String] = []
    
    init() {
        addUndoRedoManager()
    }
    
    func addNewString(_ string: String) {
        arrayString.append(string)
        addUndoRedoState()
    }
    
    private func undoAction() {
        undoRedoManager?.undo(&arrayString)
    }
    
    private func redoAction() {
        undoRedoManager?.redo(&arrayString)
    }
    
    // Manager
    var undoRedoManager: UndoRedoManager<[String]>?
    
    private func addUndoRedoManager() {
        undoRedoManager = UndoRedoManager(defaultState: arrayString)
    }
    
    private func addUndoRedoState() {
        undoRedoManager?.addState(arrayString)
    }
}

