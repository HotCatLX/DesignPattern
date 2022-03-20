//
//  Receiver.swift
//  Command
//
//  Created by suckerl on 2022/3/15.
//

import Foundation

/**
  接收者对象: 负责具体Command的具体实现
  Command对象持有接收者
 */

protocol Receiver {
    /// 执行命令
    func handlerCommand(_ command: String)
    /// 执行命令结束
    func finishCommand()
}

// MARK: - 下单接收者
struct OrderReceiver: Receiver {
    func handlerCommand(_ command: String) {
        print(" OrderReceiver Handle : \(command)")
    }
    
    func finishCommand() {
        print(" OrderReceiver Finish Command")
    }
    
}

// MARK: - 烹饪接收者
struct CookingReceiver: Receiver {
    func handlerCommand(_ command: String) {
        print("CookingReceiver Handle: \(command)")
    }
    
    func finishCommand() {
        print("CookingReceiver Finish Command")
    }
}

// MARK: - 上菜接收者
struct WaiterReceiver: Receiver {
    func handlerCommand(_ command: String) {
        print("Waiter Handle : \(command)")
    }
    
    func finishCommand() {
        print("Waiter Finish Command")
    }
}
