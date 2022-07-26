//
//  MovieDetailsRouter.swift
//  collectionView
//
//  Created by Aigerim Abdurakhmanova on 25.07.2022.
//

import Foundation
import UIKit

protocol MovieDetailsRouterInput {
    func openCastModule(with castId: Int)
}

final class MovieDetailsRouter: MovieDetailsRouterInput {
    weak var viewController: UIViewController?
    
    func openCastModule(with castId: Int) {
        let vc = CastDetailsModuleAssembly().assemble { [weak self] input in
            input.configure(with: castId)
        }
        
//        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
//        guard let vc = storyBoard.instantiateViewController(withIdentifier: "CastMemberViewController") as? CastMemberViewController else { return }
//        vc.personId = castId
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
