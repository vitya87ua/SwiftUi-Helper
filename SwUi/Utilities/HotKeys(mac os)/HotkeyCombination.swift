//
//  HotkeyCombination.swift
//  SwUi
//
//  Created by Viktor Berezhnytskyi on 28.07.2022.
//

import Foundation

#if canImport(AppKit)
enum KeyBase: CaseIterable {
    case option
    case command
    case shift
    case control
    
    var isPressed: Bool {
        switch self {
        case .option:
            return CGKeyCode.kVK_Option.isPressed  || CGKeyCode.kVK_RightOption.isPressed
        case .command:
            return CGKeyCode.kVK_Command.isPressed || CGKeyCode.kVK_RightCommand.isPressed
        case .shift:
            return CGKeyCode.kVK_Shift.isPressed   || CGKeyCode.kVK_RightShift.isPressed
        case .control:
            return CGKeyCode.kVK_Control.isPressed || CGKeyCode.kVK_RightControl.isPressed
        }
    }
}

struct HotkeyCombination {
    let keyBase: [KeyBase]
    let key: CGKeyCode
    let action: () -> ()
    
    var keyBasePressed: Bool {
        let mustBePressed    = KeyBase.allCases.filter{ keyBase.contains($0) }
        let mustBeNotPressed = KeyBase.allCases.filter{ !keyBase.contains($0) }
        
        for base in mustBePressed {
            if !base.isPressed {
                return false
            }
        }
        
        for base in mustBeNotPressed {
            if base.isPressed {
                return false
            }
        }
        
        return true
    }
}
#endif
