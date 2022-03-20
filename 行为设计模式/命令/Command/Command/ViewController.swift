//
//  ViewController.swift
//  Command
//
//  Created by suckerl on 2022/3/15.
//

import UIKit

class ViewController: UIViewController {
    
    /**
        组成:
            1. Command 命令
                1.1 功能:  协议,封装具体命令通用接口
            2. Invoker 发送者
                2.1 功能: 发送者触发命令,但是不直接调用接收者; 发送者可以添加一系列命令
                2.2 要求: 内部持有命令对象,一般不负责生成命令对象
            3. Receiver 接收者
                3.1 功能: 具体执行业务逻辑,和命令对象关联,命令对象持有接收值,负责调用和传参
            4. Client 客户端
                4.1 功能: 生成命令对象, 为发送者对象添加命令
                4.2 顺序:
                    4.2.1 创建接收者。
                    4.2.2 创建命令， 如有需要可将其关联至接收者。
                    4.2.3 创建发送者并将其与特定命令关联。
     
     找到担任发送者职责的类。 在这些类中添加保存命令的成员变量。 发送者只能通过命令接口与其命令进行交互。 发送者自身通常并不创建命令对象， 而是通过客户端代码获取
     修改发送者使其执行命令， 而非直接将请求发送给接收者。
     
    
     */
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 初始化命令
        let waiterCommand = WaiterCommand(command: "服务要已经接收到客户点餐,准备交给负责下单的人准备菜了")
        let orderCommand = OrderCommand(command: "下单的人已经准备完菜,准备交给厨师")
        let cookingCommand = CookingCommand(command: "厨师已经开始炒菜了")
        
        // 创建发送者对象
        let invoker = RestaurantInvoker(commands: [waiterCommand, orderCommand, cookingCommand])
        
        // 发送者对象开始执行命令
        invoker.startAllCommand()
        
        // 发送者结束命令
        invoker.finishAllCommand()
        
        // 发送者终止某一条命令.......
    }


}

