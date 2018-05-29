//
//  AViewModel.swift
//  CoordinatorsWithDelegation
//
//  Created by Pavle Pesic on 5/28/18.
//  Copyright (c) 2018 Pavle Pesic. All rights reserved.
//

import UIKit

protocol AViewModelProtocol {
    var dob: Dynamic<String> { get }
}

class AViewModel: NSObject, AViewModelProtocol {
    
    // MARK: - AViewModelProtocol
    
    var dob: Dynamic<String> = Dynamic<String>("")
    
    // MARK: - Init
    
    override init() {
        super.init()
    }
    
}

// MARK: - BViewControllerDelegate

extension AViewModel: BViewControllerDelegate {
    
    func didSelectDate(date: Date) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        self.dob.value = formatter.string(from: date)
    }
    
}
