//
//  LoopLock.swift
//  Scratch Paper
//
//  Created by Bingyi Billy Li on 2022/7/10.
//

import Cocoa

/// An enumeration object representing a binary state.
enum BinaryState: Int {
    /// A case representing an off state.
    case off = 0
    /// A case representing an on state.
    case on = 1
}

/// A protocol that implements loop prevention mechanism.
protocol LoopSafe: AnyObject {
    
    /// A state indicating whether the loop lock is on.
    var loopLock: BinaryState { get set }
    
}

extension LoopSafe {
    
    /// Do something safely without triggering a loop.
    func loopSafe(_ action: () -> Void) {
        self.loopLock = .on
        action()
        self.loopLock = .off
    }
    
    /// Prevent looping for the body block.
    func doNotLoop(_ body: () -> Void) {
        guard self.loopLock == .off else { return }
        body()
    }
    
}
