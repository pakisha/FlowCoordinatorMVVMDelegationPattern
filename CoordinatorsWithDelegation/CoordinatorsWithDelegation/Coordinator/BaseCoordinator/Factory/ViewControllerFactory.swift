//
//  ViewControllerFactory.swift
//  CoordinatorsWithDelegation
//
//  Created by Pavle Pesic on 5/28/18.
//  Copyright © 2018 Pavle Pesic. All rights reserved.
//

import UIKit

class ViewControllerFactory {
    
    func instantiateAViewController() -> AViewController {
        let aVC = UIStoryboard.first.instantiateViewController(withIdentifier: "AViewController") as! AViewController
        aVC.viewModel = AViewModel()
        return aVC
    }
    
    func instantiateBViewController(delegate: BViewControllerDelegate) -> BViewController {
        let bVC = UIStoryboard.first.instantiateViewController(withIdentifier: "BViewController") as! BViewController
        bVC.viewModel = BViewModel()
        bVC.delegate = delegate
        return bVC
    }
    
}
