//
//  CastDetailsPresenter.swift
//  collectionView
//
//  Created by Aigerim Abdurakhmanova on 26.07.2022.
//

import Foundation

final class CastDetailsPresenter: CastDetailsViewOutput, CastDetailsInteractorOutput, CastDetailsModuleInput {
    weak var view: CastDetailsViewInput!
    var interactor: CastDetailsInteractorInput!
    
    private var castId: Int!
    
    func didLoadView() {
        interactor.obtainCastDetails(with: castId)
    }
    
    func didLoadCastDetails(_ details: CastDetails) {
        view.handleObtainedCastDetails(details)
    }
    
    func configure(with castId: Int) {
        self.castId = castId
    }
}
