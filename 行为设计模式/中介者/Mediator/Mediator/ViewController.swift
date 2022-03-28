//
//  ViewController.swift
//  Mediator
//
//  Created by suckerl on 2022/3/23.
//

import UIKit

class ViewController: UIViewController {

    /**
        使用场景: 对象间的所有关系抽取成为一个单独的类， 以使对于特定组件的修改工作独立于其他组件
        
        组件 （Component） 是各种包含业务逻辑的类。
        具体中介者 （Concrete Mediator） 封装了多种组件间的关系。 具体中介者通常会保存所有组件的引用并对其进行管理， 甚至有时会对其生命周期进行管理。
        组件并不知道其他组件的情况。 如果组件内发生了重要事件， 它只能通知中介者。 中介者收到通知后能轻易地确定发送者， 这或许已足以判断接下来需要触发的组件了。
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let componentA = ComponentA()
        let componentB = ComponentB()
        // bind
        let mediator = Mediator(a: componentA, b: componentB)
        componentA.bindMediator(mediator: mediator)
        componentB.bindMediator(mediator: mediator)
        
        componentA.componentAAction()
        componentB.componentBAction()
    }


}

