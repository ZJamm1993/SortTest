//
//  BaseSort.swift
//  SortTest
//
//  Created by zjj on 2021/6/16.
//

import Foundation

class BaseSort<E: Comparable> {
    
    var items: [E]
    
    required init(array: [E]) {
        items = array
    }
    
    func swapItem(at index: Int, toIndex: Int) {
        let t = self.items[index]
        self.items[index] = self.items[toIndex]
        self.items[toIndex] = t
    }
    
    func sorted() -> [E] {
        // do some sort
        return [1,3,2,4] as! [E]
    }
    
    // MARK: - TEST

    static func testSort(arr: [E]) {
        let name = String(describing: self)
        print("Begin " + name + "...")
        
        let start = Date()
        let sortInstance = self.init(array: arr)
        let res = sortInstance.sorted()
        let end = Date()
        
        var desc = "-----------\nFinish " + name + "\n"
        desc = desc.appending("TimeInterval: \(end.timeIntervalSinceReferenceDate - start.timeIntervalSinceReferenceDate)\n")
        desc = desc.appending("Checked: \(NumberTool.isSorted(arr: res)) \n")
        print(desc)
    }
}
