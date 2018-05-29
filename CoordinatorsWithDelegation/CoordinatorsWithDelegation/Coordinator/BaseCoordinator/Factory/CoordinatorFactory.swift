//
//  CoordinatorFactory.swift
//  iOSStyleguide
//
//  Created by Pavle Pesic on 3/14/18.
//  Copyright © 2018 Fabrika. All rights reserved.
//

import Foundation

protocol CoordinatorFactoryProtocol {
    func makeFirstCoordinatorBox(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, viewControllerFactory: ViewControllerFactory) -> FirstCoordinator
}

final class CoordinatorFactory: CoordinatorFactoryProtocol {
    
    // MARK: - CoordinatorFactoryProtocol
    
    func makeFirstCoordinatorBox(router: RouterProtocol, coordinatorFactory: CoordinatorFactoryProtocol, viewControllerFactory: ViewControllerFactory) -> FirstCoordinator {
        let coordinator = FirstCoordinator(router: router, coordinatorFactory: coordinatorFactory, viewControllerFactory: viewControllerFactory)
        return coordinator
    }
    
}
