//
//  BViewController.swift
//  CoordinatorsWithDelegation
//
//  Created by Pavle Pesic on 5/28/18.
//  Copyright (c) 2018 Pavle Pesic. All rights reserved.
//

import UIKit

protocol BViewControllerProtocol: class {
    var onDismiss: (() -> Void)? { get set }
}

protocol BViewControllerDelegate: class {
    func didSelectDate(date: Date)
}

class BViewController: UIViewController, BViewControllerProtocol {
    
    // MARK: - Vars & Lets
    
    var viewModel: BViewModelProtocol?
    weak var delegate: BViewControllerDelegate?
    
    // MARK: - BViewControllerProtocol
    
    var onDismiss: (() -> Void)?
    
    // MARK: - Outelts
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    // MARK: - Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction func actionDone() {
        if let method = self.delegate?.didSelectDate {
            method(self.datePicker.date)
        }
        self.onDismiss?()
    }
    
    @IBAction func actionCancel() {
        self.onDismiss?()
    }
    
}
