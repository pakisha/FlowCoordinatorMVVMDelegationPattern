//
//  ApplicationCoordinator.swift
//  iOSStyleguide
//
//  Created by Pavle Pesic on 3/14/18.
//  Copyright © 2018 Fabrika. All rights reserved.
//

import Foundation

final class ApplicationCoordinator: BaseCoordinator {
    
    // MARK: - Vars & Lets
    
    private let coordinatorFactory: CoordinatorFactoryProtocol
    private let router: RouterProtocol
    private var launchInstructor = LaunchInstructor.configure()
    
    // MARK: - Coordinator
    
    override func start(with option: DeepLinkOption?) {
        if option != nil {
            
        } else {
            switch launchInstructor {
            case .onboarding: runOnboardingFlow()
            case .auth: runAFlow()
            case .main: runMainFlow()
            }
        }
    }
    
    // MARK: - Private methods
    
    private func runAFlow() {
        let coordinator = self.coordinatorFactory.makeFirstCoordinatorBox(router: self.router, coordinatorFactory: self.coordinatorFactory, viewControllerFactory: ViewControllerFactory())
        self.addDependency(coordinator)
        coordinator.start()
    }
    
    private func runOnboardingFlow() {

    }
    
    private func runMainFlow() {

    }
    
    // MARK: - Init
    
    init(router: Router, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }
    
}
