//
//  ViewController.swift
//  ChainOfResponsiblity
//
//  Created by suckerl on 2022/3/13.
//

import UIKit


// MARK: - Client Demo
class Client {
    
    func clientBuySomeThing() {
        // 下单结果模型
        let orderResult = OrderResult(defaultResult: true)
        // 设置责任链
        let orderhandler = OrderHandler()
        let warehouseHandker = WarehouseHandler()
        let payHandler = PayHandler()
        let _ = orderhandler.next(handler: warehouseHandker).next(handler: payHandler)
        // 执行责任链中的操作
        guard let result = orderhandler.handle(currentOrder: orderResult) else {
            print("下单失败")
            return
        }
        
        print("\(result)")
    }
}


class ViewController: UIViewController {

    
    /**责任链模式
     类:
        1.触发者(Client: 1. 需要设置责任链的链上下有关系 2.需要触发责任链的启动)
        2.操作Handler(遵守Handler Protocol的类: 1. 需要设置责任链的下一个操作 2.需要执行当前操作逻辑 3. 需要触发handler方法)
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        /**Mock 下单流程
         Client触发下单 -> 订单操作 -> 库存操作 -> 支付操作
         如果有某一个handler错误则终止责任链,结束下单
         */
        
        // 模拟执行简易下单流程
        let client = Client()
        client.clientBuySomeThing()
    }

}

