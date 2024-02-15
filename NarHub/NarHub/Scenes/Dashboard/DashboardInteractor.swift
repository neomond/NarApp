//
//  DashboardInteractor.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 23.01.24.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import NarHubNetworkKit

protocol DashboardBusinessLogic {
    
    func fetchStories(request: Dashboard.FetchStories.Request)
    
    func fetchHubs(request: Dashboard.FetchHubs.Request)
    
    func load(request: Dashboard.Load.Request)
}

protocol DashboardDataStore { }

class DashboardInteractor: DashboardBusinessLogic, DashboardDataStore {
   
    var presenter: DashboardPresentationLogic?
    lazy var worker: DashboardWorkerLogic = DashboardWorker()

    var stories: StoriesResponse?
    var hubsList: HubResponse?
    

    
    func fetchStories(request: Dashboard.FetchStories.Request) {
        self.worker.fetchStories({ [weak self] data in
            guard let self = self else { return }
            
            if let data = data {
                self.stories = data
                let response = Dashboard.FetchStories.Response( stories: data)
                self.presenter?.presentStories(response: response)
            }
        })
    }
    // MARK: Business Logic
    func fetchHubs(request: Dashboard.FetchHubs.Request) {
        self.worker.fetchHubs( { [ weak self ] data in
            guard let self = self else { return }
            
            if let data = data {
                self.hubsList = data
                let response = Dashboard.FetchHubs.Response( hubs: data)
                self.presenter?.presentHubs(response: response)
            }
        })
    }
    
    func load(request: Dashboard.Load.Request) {
            let response = Dashboard.Load.Response()
            self.presenter?.presentLoad(response: response)
        }
}

