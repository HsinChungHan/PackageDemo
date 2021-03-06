//
//  MathOperations.swift
//  SwiftPackageDemo
//
//  Created by Gabriel Theodoropoulos.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import Foundation

public class MathOperations {
    
    // MARK: - Custom Type: Operation
    
    public enum Operation {
        case addition
        case subtraction
        case multiplication
        case division
        case noneOperation
    }
    
    
    // MARK: - Properties
    
    public static let shared = MathOperations()
    
    private(set) var result: Double?

    public var operation: Operation = .noneOperation
    
    public var op1: Double?
    
    public var op2: Double?
    
    
    // MARK: - Init
    
    init() {
        
    }
    
    
    // MARK: - Custom Methods
    
    public func keep(_ value: Double) {
        if op1 == nil {
            op1 = value
        } else {
            op2 = value
        }
    }
    
    
    public func calculateResult() {
        guard let op1 = op1, let op2 = op2 else { return }
        
        switch operation {
        case .addition: result = op1 + op2
        case .subtraction: result = op1 - op2
        case .multiplication: result = op1 * op2
        case .division: result = op1 / op2
        case .noneOperation: break
        }
        
        self.op1 = result
    }
    
    
    public func clear() {
        op1 = nil
        op2 = nil
        result = nil
        operation = .noneOperation
    }
    
    
    public func getFormattedResult() -> String? {
        guard let result = result else { return nil }
        return result.truncatingRemainder(dividingBy: 1.0) == 0.0 ? "\(Int(result))" : "\(result)"
    }
}
