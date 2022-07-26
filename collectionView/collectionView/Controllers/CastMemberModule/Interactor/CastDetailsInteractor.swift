//
//  CastDetailsInteractor.swift
//  collectionView
//
//  Created by Aigerim Abdurakhmanova on 26.07.2022.
//

import Foundation

protocol CastDetailsInteractorInput {
    func obtainCastDetails(with castId: Int)
}

protocol CastDetailsInteractorOutput: AnyObject {
    func didLoadCastDetails(_ details: CastDetails)
}

class CastDetailsInteractor: CastDetailsInteractorInput {
    weak var output: CastDetailsInteractorOutput!
    private var network = NetworkManager.shared
    
    required init(network: NetworkManager) {
        self.network = network
    }
    
    func obtainCastDetails(with castId: Int) {
        network.loadPersonDetails(castId: castId) { [weak self] details in
            self?.output.didLoadCastDetails(details)
        }
    }
}
