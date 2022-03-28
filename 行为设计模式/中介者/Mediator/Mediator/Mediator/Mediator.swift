//
//  Mediator.swift
//  Mediator
//
//  Created by suckerl on 2022/3/23.
//

import Foundation


protocol MediatorProtocol {
    func notify(sender: Componet,action: String)
}


struct Mediator: MediatorProtocol {
    
    let componentA: ComponentA
    let componentB: ComponentB
    
    init(a: ComponentA, b: ComponentB) {
        self.componentA = a
        self.componentB = b
    }
    
    func notify(sender: Componet, action: String) {
        
        if action == "A" {
            print("get A Action")
            self.componentB.nextAction()
            
        }else if action == "B" {
            
            print("get B Action")
            self.componentA.nextAction()
        }
        
        
    }
    
}
