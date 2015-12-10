//
//  PlayerManager.swift
//  MagicCommanderCounter
//
//  Created by amela on 10/12/15.
//  Copyright © 2015 amela. All rights reserved.
//

import Foundation

class PlayerManager : NSObject {
    
    static let sharedPM = PlayerManager()
    
    var players = [Player]()
    
    func addPlayer(player: Player) {
        self.players.append(player)
    }
    
    func removePlayer(player: Player) {
        if self.players.count > 0 {
            if let index = self.players.findFirstMatching ( { $0.name == player.name } ) {
                self.players.removeAtIndex(index)
            }
        }else {
            print("no player like this")
        }
    }
}

extension Array {
    func findFirstMatching<L : BooleanType>(predicate: Element -> L) -> Int? {
        var i = 0
        for item in self {
            if predicate(item) {
                return i
            }
            i += 1
        }
        return nil
    }
}