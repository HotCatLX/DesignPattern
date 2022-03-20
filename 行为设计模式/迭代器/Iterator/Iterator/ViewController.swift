//
//  ViewController.swift
//  Iterator
//
//  Created by suckerl on 2022/3/20.
//

import UIKit



class ViewController: UIViewController {
    
    /**
     1. 迭代器封装了与复杂数据结构进行交互的细节， 为客户端提供多个访问集合元素的简单方法。 这种方式不仅对客户端来说非常方便， 而且能避免客户端在直接与集合交互时执行错误或有害的操作， 从而起到保护集合的作用。
     2. 代码能够遍历不同的甚至是无法预知的数据结构， 可以使用迭代器模式。
     */

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let arrayAggregate = ArrayAggregate()
        arrayAggregate.interatorShow()
        
        let dicAggregate = DictionaryAggregate()
        dicAggregate.interatorShow()
     
    }


}




