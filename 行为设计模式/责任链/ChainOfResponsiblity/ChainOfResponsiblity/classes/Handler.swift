//
//  Handler.swift
//  ChainOfResponsiblity
//
//  Created by suckerl on 2022/3/13.
//

import Foundation

/**
 * 操作协议
 */


/**
 * 订单结果类
 * 模拟下单结果
 */
class OrderResult {
    var result: Bool
    init(defaultResult: Bool) {
        self.result = defaultResult
    }
}


/**
 * 操作协议
 */
protocol Handler {
    /// 设置下一个责任链操作
    func next(handler: Handler) -> Handler
    /// 下一个操作属性
    var nextHandler: Handler? { get set }
    /// 执行当前操作
    func handle(currentOrder: OrderResult) -> String?
}

/**
 * 操作协议扩展,用于实现协议中方法
 */
extension Handler {
    func handle(currentOrder: OrderResult) -> String? {
        return nextHandler?.handle(currentOrder: currentOrder)
    }
}




// MARK: - Handler Demo
/**
 * 下单操作-遵守Handler协议
 */
class OrderHandler: Handler {
    func next(handler: Handler) -> Handler {
        self.nextHandler = handler
        return handler
    }
    
    var nextHandler: Handler?

    func handle(currentOrder: OrderResult) -> String? {
        //订单校验
        self.orderCheck(currentOrder: currentOrder)
        // 是否执行下一个责任链
        if !currentOrder.result { // 责任链终止
            return "Handler End: Order Error"
        }else {
            return nextHandler?.handle(currentOrder: currentOrder)
        }
    }
    
    // 订单校验逻辑,可以做价格数量校验,返回false则责任链终止
    func orderCheck(currentOrder: OrderResult) {
        currentOrder.result = true
//        currentOrder.result = false

    }
}


/**
 * 库存操作-遵守Handler协议
 */
class WarehouseHandler: Handler {
    func next(handler: Handler) -> Handler {
        self.nextHandler = handler
        return handler
    }
    
    var nextHandler: Handler?

    func handle(currentOrder: OrderResult) -> String? {
        //库存校验
        self.warehouseCheck(currentOrder: currentOrder)
        // 是否执行下一个责任链
        if !currentOrder.result { // 责任链终止
            return "Handler End:  Warehouse Error"
        }else {
            return nextHandler?.handle(currentOrder: currentOrder)
        }
    }
    
    // 库存校验逻辑,可以做当前是否有库存,返回false则责任链终止
    func warehouseCheck(currentOrder: OrderResult) {
        currentOrder.result = true
//        currentOrder.result = false

    }
}


/**
 * 支付操作-遵守Handler协议
 */
class PayHandler: Handler {
    func next(handler: Handler) -> Handler {
        self.nextHandler = handler
        return handler
    }
    
    var nextHandler: Handler?

    func handle(currentOrder: OrderResult) -> String? {
        //支付校验
        self.payCheck(currentOrder: currentOrder)
        // 是否执行下一个责任链
        if !currentOrder.result { // 责任链终止
            return "Handler End:  Pay Error"
        }else { // 作为最后一个责任链 终止责任链
            return "Handler End:  Pay Success"
//            return nextHandler?.handle(currentOrder: currentOrder)
        }
    }
    
    // 库存校验逻辑,可以做当前是否有库存,返回false则责任链终止
    func payCheck(currentOrder: OrderResult) {
        currentOrder.result = true
//        currentOrder.result = false

    }
}
