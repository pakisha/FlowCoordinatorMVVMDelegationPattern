//
//  AViewController.swift
//  CoordinatorsWithDelegation
//
//  Created by Pavle Pesic on 5/28/18.
//  Copyright (c) 2018 Pavle Pesic. All rights reserved.
//

import UIKit

protocol AViewControllerProtocol: BaseViewControllerProtocol {
    var onGoToDatePicker: (() -> Void)? { get set }
}

class AViewController: UIViewController, AViewControllerProtocol {
    
    // MARK: - Vars & Lets
    
    var viewModel: (AViewModelProtocol & BViewControllerDelegate)?
    
    // MARK: - AViewControllerProtocol
    
    var onGoToDatePicker: (() -> Void)?
    
    // MARK: - Outelts
    
    @IBOutlet weak var dateButton: UIButton!
    
    // MARK: - Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindUi()
    }
    
    // MARK: - Private methods
    
    private func bindUi() {
        self.viewModel?.dob.bind({ [weak self] in
            self?.dateButton.setTitle($0, for: .normal)
        })
    }
    
    // MARK: - Actions
    
    @IBAction func actionGoToDatePicker() {
        self.onGoToDatePicker?()
    }
    
}
