//
//  Command.swift
//  Command
//
//  Created by suckerl on 2022/3/15.
//

import Foundation
import UIKit

/**
 * 命令对象,同一封装具体的执行操作等方法
 * 负责调用具体的接收者执行具体的业务逻辑操作
 * 接收者可以根据需求封装在内部也可以外部传参
 */


/// 命令
protocol Command {
    /// 执行具体命令的方法
    func excute()
    /// 结束具体命令的方法
    func finish()
}


/// 下单命令
struct OrderCommand: Command {
    
    var command:String
    
    init(command: String) {
        self.command = command
    }
    
    fileprivate let receiver = OrderReceiver()
   
    func excute() {
        receiver.handlerCommand(self.command)
    }
    
    func finish() {
        receiver.finishCommand()
    }
    
}

/// 烹饪命令
struct CookingCommand: Command {
    var command:String
    
    init(command: String) {
        self.command = command
    }
    
    fileprivate let receiver = CookingReceiver()
   
    func excute() {
        receiver.handlerCommand(self.command)
    }
    
    func finish() {
        receiver.finishCommand()
    }
}

///
struct WaiterCommand: Command {
    var command:String
    
    init(command: String) {
        self.command = command
    }
    
    fileprivate let receiver = WaiterReceiver()
   
    func excute() {
        receiver.handlerCommand(self.command)
    }
    
    func finish() {
        receiver.finishCommand()
    }
}
