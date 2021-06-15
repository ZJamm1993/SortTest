//
//  QuickSort.swift
//  SortTest
//
//  Created by zjj on 2021/6/15.
//

import Foundation

// https://www.geeksforgeeks.org/quick-sort/

class QuickSort <E: Comparable> {
    var array = NSMutableArray()

    init(array: [E]) {
       for i in array {
           self.array.add(i)
       }
    }
    
    private func swap(index: Int, toIndex: Int) {
        let t = self.array[index]
        self.array[index] = self.array[toIndex]
        self.array[toIndex] = t
    }
    
    private func partition(begin: Int, end: Int) -> Int {
        // 使用随机位置坐轴点
        let randomIndex = Int.random(in: begin ..< end)
        swap(index: randomIndex, toIndex: end - 1)
        
        let pivot = self.array[end - 1] as! E
        var i = begin - 1
        for j in stride(from: begin, to: end - 1, by: 1) {
            if (self.array[j] as! E) < pivot {
                i += 1
                swap(index: i, toIndex: j)
            }
        }
        swap(index: i + 1, toIndex: end - 1)
        return i + 1
    }
    
    private func quickSort(begin: Int, end: Int) {
        if begin < end - 1 {
            let pi = partition(begin: begin, end: end)
            quickSort(begin: begin, end: pi)
            quickSort(begin: pi + 1, end: end)
        }
    }
    
    func sorted() -> [E] {
        self.quickSort(begin: 0, end: self.array.count)
        return self.array as! [E]
    }
}
