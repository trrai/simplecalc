//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        var nums: [Int] = [];
        for element in args{
            if let num = Int(element) {
                nums.append(num);
            }
        }
        
        if(args.last == "count"){
            return nums.count
        }else if (args.last == "avg"){
            if(nums.count == 0){
                return 0
            }else{
                let sum = nums.reduce(0, +)
                return sum / nums.count
            }
        }else if (args.last == "fact"){
            if(nums.count == 0){
                return 0
            }else{
                if(nums[0] < 0){
                    return -1
                }else{
                    var fact = 1;
                    for i in 1...(nums.first ?? 1){
                        fact *= i;
                    }
                    return fact;
                }
            }
        }else{
            if(nums.count < 2){ return -1 }
            switch args[1]{
            case "+":
                return nums[0] + nums[1]
            case "-":
                return nums[0] - nums[1]
            case "/":
                return nums[0] / nums[1]
            case "*":
                return nums[0] * nums[1]
            case "%":
                return nums[0] % nums[1]
            default:
                return 0
            }
        }
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))


