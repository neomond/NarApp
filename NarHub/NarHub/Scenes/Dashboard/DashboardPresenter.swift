//
//  DashboardPresenter.swift
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

protocol DashboardPresentationLogic
{
  func presentStories(response: Dashboard.FetchStories.Response)
    
  func presentHubs(response: Dashboard.FetchHubs.Response)
    
  func presentLoad(response: Dashboard.Load.Response)

  func presentError(error: Error)
}

class DashboardPresenter: DashboardPresentationLogic {
    
  weak var viewController: DashboardDisplayLogic?
  
    var storyModels: [StoryModel] = []
    
    func presentStories(response: Dashboard.FetchStories.Response){
      
    guard let storiesList = response.stories.list else {
        return
    }
        
    for storyResponse in storiesList {
        let model = StoryModel(id: storyResponse.id ?? 0, title: storyResponse.title ?? "", url: storyResponse.url ?? "")
        storyModels.append(model)
        
  }
  print(storyModels)
    let viewModel = Dashboard.FetchStories.ViewModel(stories: storyModels)
    viewController?.displayStories(viewModel: viewModel)
  }
    
    func presentHubs(response: Dashboard.FetchHubs.Response) {
        let data = response.hubs.list ?? []
        let models = data.map { item -> HubModel in
                return HubModel(
                    id: item.id ?? 0,
                    title: item.title ?? ""
                )
            }
        let viewModel = Dashboard.FetchHubs.HubsModel(hubs: models)
        viewController?.displayHubs(viewModel: viewModel)

    }
    
    func presentLoad(response: Dashboard.Load.Response) {
        let viewModel = Dashboard.Load.ViewModel()
        viewController?.displayLoad(viewModel: viewModel)
        }

    func presentError(error: Error) {
        viewController?.displayError(errorMessage: error.localizedDescription)
    }
}


