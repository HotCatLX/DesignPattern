//
//  Component.swift
//  Mediator
//
//  Created by suckerl on 2022/3/23.
//

import Foundation

//class Componet {
//
//    fileprivate weak var mediator: (MetiatorProtocol)?
//
//    init(mediator: MetiatorProtocol) {
//        self.mediator = mediator
//    }
//
//}




class Componet {
    
    var mediator: MediatorProtocol?
    
    init(mediator: MediatorProtocol? = nil) {
        self.mediator = mediator
    }
    
    func bindMediator(mediator: MediatorProtocol) {
        self.mediator = mediator
    }
    
    func nextAction() {}
}


class ComponentA: Componet {
    func componentAAction() {
        // 自己的逻辑
        print("ComponentA --- Action")
        // 通知中介质处理其余业务逻辑
        self.mediator?.notify(sender: self, action: "A")
    }
    
    override func nextAction() {
        print("ComponentA --- Next Action")
    }
}


class ComponentB: Componet {
    func componentBAction() {
        // 自己的逻辑
        print("ComponentB --- Action")
        // 通知中介质处理其余业务逻辑
        self.mediator?.notify(sender: self, action: "B")
    }
    
    override func nextAction() {
        print("ComponentB --- Next Action")
    }
}
