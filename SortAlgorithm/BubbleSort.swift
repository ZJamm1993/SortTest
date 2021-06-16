//
//  BubbleSort.swift
//  SortTest
//
//  Created by zjj on 2021/6/15.
//

import Foundation

class BubbleSort<E: Comparable> : BaseSort<E> {
    
    private func bubbleSort() {
        let n = self.nsarray.count
        // 神奇的swift没有for(;;)??????
        for i in stride(from: 0, to: n - 1, by: 1) {
            var swaped = false
            for j in stride(from: 0, to: n - i - 1, by: 1) {
                if self.nsarray[j] as! E > self.nsarray[j + 1] as! E {
                    swapItem(at: j, toIndex: j + 1)
                    swaped = true
                }
            }
            if !swaped {
                break
            }
        }
    }
    
    override func sorted() -> [E] {
        self.bubbleSort()
        return self.nsarray as! [E]
    }
}
