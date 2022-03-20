//
//  Aggregate.swift
//  Iterator
//
//  Created by suckerl on 2022/3/20.
//

import Foundation

/*
 抽象聚集类(或者协议)
 主要功能是提供创造具体迭代器的方法(与具体迭代器一一对应)
 面向Client,Client直接创建的对象
 */



protocol Aggregate {
    /// 创建一个遍历器对象
    func createInterator<E: Interator>() -> E
    ///  遍历器执行遍历操作
    func interatorShow()
}


class ArrayAggregate: Aggregate {

    let arrayDataSource  = ["arryDatasoure1", "arryDatasoure2", "arryDatasoure3", "arryDatasoure4"]

    func createInterator<E: Interator>() -> E {
        return ArrayInterator<String>(storage: arrayDataSource) as! E
    }
    
    func interatorShow() {
        let interator: ArrayInterator<String> = self.createInterator()
        
        while interator.hasNext() {
            guard let current = interator.current() else {
                continue
            }
            print("current is \(current)")
            _ = interator.next()
        }
    }
    
    
}


class DictionaryAggregate: Aggregate {
    let dicDataSource  = ["key1": "dicDatasoure1", "key2": "dicDatasoure2","key3": "dicDatasoure3"]
    
    func createInterator<E: Interator>() -> E {
        return DicInterator<String>(storage: dicDataSource) as! E
    }
    
    func interatorShow() {
        let interator: DicInterator<String> = self.createInterator()
        
        while interator.hasNext() {
            guard let current = interator.current() else {
                continue
            }
            print("current is \(current)")
            _ = interator.next()
        }
    }

}


