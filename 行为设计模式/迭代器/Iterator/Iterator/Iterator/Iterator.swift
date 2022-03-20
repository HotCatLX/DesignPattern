//
//  Iterator.swift
//  Iterator
//
//  Created by suckerl on 2022/3/20.
//

import Foundation

/**
 迭代器,负责不同方式的遍历或者不同数据结构的存储迭代器
 */

protocol Interator {
    associatedtype ItemType
    /// 返回首元素
    func first() -> ItemType?
    /// 返回下一个元素
    func next() -> ItemType?
    /// 是否有下一个元素
    func hasNext() -> Bool
    /// 返回当前元素
    func current() -> ItemType?
}


///// 数组迭代器
class ArrayInterator<E>: Interator {

    private let storage: Array<E>
    private var currentIndex = 0

    init(storage: Array<E>) {
        self.storage = storage
    }

    func first() -> E? {
        return storage.first
    }

    func next() -> E? {
        currentIndex += 1
        return currentIndex <  self.storage.count ? self.storage[currentIndex] : nil
    }

    func hasNext() -> Bool {
        return currentIndex < self.storage.count
    }

    func current() -> E? {
        return self.storage[currentIndex]
    }

}

//
///// 字典迭代器
class DicInterator<E>: Interator {

    private let storage: Dictionary<String, E>
    private var currentIndex = 0
    private var storageKeys: [String]
    

    init(storage: Dictionary<String, E>) {
        self.storage = storage
        self.storageKeys = Array(storage.keys)
    }

    func first() -> E? {
        guard let firstKey = storageKeys.first else {
            return nil
        }
        return storage[firstKey]
    }
    
    func next() ->  E? {
        currentIndex += 1
        return currentIndex <  self.storageKeys.count ? self.storage[storageKeys[currentIndex]] : nil
    }
    
    func hasNext() -> Bool {
        return currentIndex < self.storageKeys.count
    }

    func current() -> E? {
        return storage[storageKeys[currentIndex]]
    }
}

