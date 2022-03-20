//
//  Invoker.swift
//  Command
//
//  Created by suckerl on 2022/3/21.
//

import Foundation

/*
 * 发送者
 * 持有命令对象.负责对象的执行和取消,修改顺序等操作
 * 面向对象操作.不直接面向接受朱
 */

class RestaurantInvoker {
    
    // 保存所有命令
    fileprivate var commandArray:[Command]
    
    // 初始化方法
    init(commands: [Command]) {
        self.commandArray = commands
    }
    
    // 开始执行命令
    func startAllCommand() {
        for command in commandArray {
            command.excute()
        }
    }
    
    // 结束执行命令
    func finishAllCommand() {
        // 倒叙结束
        for index in (0...(commandArray.count-1)).reversed() {
            commandArray[index].finish()
        }
        
    }
}
