//
//  StoryViewController.swift
//  NarTask
//
//  Created by Nazrin Atayeva on 12.02.24.
//

import UIKit


class StoryViewController: UIViewController {
    var stories: [StoryModel]
    var selectedIndex: Int
    var onCompletion: ((Int?) -> Void)?

    init(stories: [StoryModel], selectedIndex: Int, onCompletion: @escaping (Int?) -> Void) {
        self.stories = stories
        self.selectedIndex = selectedIndex
        self.onCompletion = onCompletion
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

  
}

