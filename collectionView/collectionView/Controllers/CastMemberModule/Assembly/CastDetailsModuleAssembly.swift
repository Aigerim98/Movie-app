//
//  CastDetailsModuleAssembly.swift
//  collectionView
//
//  Created by Aigerim Abdurakhmanova on 26.07.2022.
//

import Foundation
import UIKit

protocol CastDetailsModuleInput {
    func configure(with castId: Int)
}

typealias CastDetailsModuleConfiguration = (CastDetailsModuleInput) -> Void

final class CastDetailsModuleAssembly {
    func assemble(_ configuration: CastDetailsModuleConfiguration) -> CastMemberViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = storyBoard.instantiateViewController(withIdentifier: "CastMemberViewController") as! CastMemberViewController
        let network = NetworkManager.shared
        let interactor = CastDetailsInteractor(network: network)
        let presenter = CastDetailsPresenter()
        
        configuration(presenter)
        
        vc.output = presenter
        presenter.view = vc
        presenter.interactor = interactor
        
        interactor.output = presenter
        return vc
    }
}
