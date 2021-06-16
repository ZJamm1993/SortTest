//
//  BaseSort.swift
//  SortTest
//
//  Created by zjj on 2021/6/16.
//

import Foundation

class BaseSort<E: Comparable> {
    
    var nsarray = NSMutableArray()
    // 用NSMutableArray比Swift.Array快？？？
    required init(array: [E]) {
        for i in array {
            self.nsarray.add(i)
        }
    }
    
    func swapItem(at index: Int, toIndex: Int) {
        let t = self.nsarray[index]
        self.nsarray[index] = self.nsarray[toIndex]
        self.nsarray[toIndex] = t
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
