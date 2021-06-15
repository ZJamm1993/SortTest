//
//  BubbleSort.swift
//  SortTest
//
//  Created by zjj on 2021/6/15.
//

import Foundation

class BubbleSort <E: Comparable> {
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
    
    private func bubbleSort() {
        let n = self.array.count
        // 神奇的swift没有for(;;)??????
        for i in stride(from: 0, to: n - 1, by: 1) {
            var swaped = false
            for j in stride(from: 0, to: n - i - 1, by: 1) {
                if self.array[j] as! E > self.array[j + 1] as! E {
                    swap(index: j, toIndex: j + 1)
                    swaped = true
                }
            }
            if !swaped {
                break
            }
        }
    }
    
    func sorted() -> [E] {
        self.bubbleSort()
        return self.array as! [E]
    }
}
