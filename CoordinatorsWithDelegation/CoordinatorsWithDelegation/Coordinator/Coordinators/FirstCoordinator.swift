//
//  FirstCoordinator.swift
//  CoordinatorTransitons
//
//  Created by Pavle Pesic on 5/18/18.
//  Copyright © 2018 Pavle Pesic. All rights reserved.
//

final class FirstCoordinator: BaseCoordinator, CoordinatorFinishOutput {

    // MARK: - CoordinatorFinishOutput
    
    var finishFlow: (() -> Void)?
    
    // MARK: - Vars & Lets
    
    private let router: RouterProtocol
    private let coordinatorFactory: CoordinatorFactoryProtocol
    private let viewControllerFactory: ViewControllerFactory
    
    // MARK: - Private methods
    
    private func showAViewController() {
        let aVC = self.viewControllerFactory.instantiateAViewController()
        aVC.onGoToDatePicker = { [unowned self, unowned aVC] in
            self.presentDatePickerViewController(delegate: aVC.viewModel!)
        }
        self.router.setRootModule(aVC, hideBar: true)
    }
    
    private func presentDatePickerViewController(delegate: BViewControllerDelegate) {
        let bVC = self.viewControllerFactory.instantiateBViewController(delegate: delegate)
        bVC.onDismiss = { [unowned self] in
            self.router.dismissModule()
        }
        self.router.present(bVC)
    }
    
    // MARK: - Coordinator
    
    override func start() {
        self.showAViewController()
    }
    
    // MARK: - Init
    
    init(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, viewControllerFactory: ViewControllerFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
        self.viewControllerFactory = viewControllerFactory
    }
    
}
