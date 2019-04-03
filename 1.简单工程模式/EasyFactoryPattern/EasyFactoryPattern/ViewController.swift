//
//  ViewController.swift
//  EasyFactoryPattern
//
//  Created by suckerl on 2019/4/4.
//  Copyright © 2019 suckerl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let once = OperationFactory().operationWithOperator(operatorStr: "/")
        once.numberFirst = 15
        once.numberSec = 5
        let result = once.getResult()
        print("result is ",result)
        
    }

}


class OperationFactory {
    
    func operationWithOperator(operatorStr : String) -> Operation {
        var operation = Operation();
        
        switch operatorStr {
        case "+":
            operation = OperationAdd()
        case "-":
            operation = OperationSub()
        case "*":
            operation = OperationMul()
        case "/":
            operation = OperationDiv()
        default:
            operation = Operation();
        }
        return operation;
    }
}

/*
 * 抽象类
 */
class Operation  {
    var numberFirst : Double = 0.0
    var numberSec : Double = 0.0
    
    func getResult() -> Double {
        let result = 0.0
        return result;
    }
    
}

/*
 * 加法子类
 */
class OperationAdd: Operation {
    override func getResult() -> Double {
        var result = 0.0
        result = numberFirst + numberSec
        return result
    }
}

/*
 * 减法子类
 */
class OperationSub: Operation {
    override func getResult() -> Double {
        var result = 0.0
        result = numberFirst - numberSec
        return result
    }
}

/*
 * 乘法子类
 */
class OperationMul: Operation {
    override func getResult() -> Double {
        var result = 0.0
        result = numberFirst * numberSec
        return result
    }
}

/*
 * 除法子类
 */
class OperationDiv: Operation {
    override func getResult() -> Double {
        var result = 0.0
        result = numberFirst / numberSec
        return result
    }
}



