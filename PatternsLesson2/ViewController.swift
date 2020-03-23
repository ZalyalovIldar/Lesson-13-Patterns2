//
//  ViewController.swift
//  PatternsLesson2
//
//  Created by Ильдар Залялов on 23.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    var alertsFactory: DefaultsAlertsFactory = DefaultsAlertsFactoryImpl()
    var alertsBuilder: DefaultsAlertsBuilder = DefaultsAlertsBuilderImpl()
    
    var userManager = UserManager.configuredManager()
    var observation: NSKeyValueObservation?
    
    var trashManager = TrashManager()
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.setTitle("Push", for: .normal)
        button.backgroundColor = .red
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        self.view.addSubview(button)
        
        let user = userManager.obtainMainUser()
        
        observation = user.observe(\.info, options: .new) { (updatedUser, change) in
            
            print("Updated: \(updatedUser.info)")
        }
        
        user.info = "New info!"
        
        let trash = Trash(type: .unexpected)
        
        trashManager.trashCan.deal(with: trash)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
//        let alert = alertsFactory.getAlert(by: .okAlert)
//
//        present(alert, animated: true, completion: nil)
    }

    @objc
    func buttonPressed() {
        
        print("Tapped!")
    }
}

enum TrashType {
    case paper
    case plastic
    case organic
    case unexpected
}


struct Trash {
    
    let type: TrashType
}

protocol TrashCan {
    
    var diffTrash: TrashCan? { get set }
    
    func deal(with trash: Trash)
}

class PaperTrashCan: TrashCan {
    
    var diffTrash: TrashCan?
    
    init(nextTrash: TrashCan?) {
        diffTrash = nextTrash
    }
    
    func deal(with trash: Trash) {
        
        if trash.type == .paper {
            print("deal with it paper")
        }
        else {
            diffTrash?.deal(with: trash)
        }
    }
}

class PlasticTrashCan: TrashCan {
    
    var diffTrash: TrashCan?
    
    init(nextTrash: TrashCan?) {
        diffTrash = nextTrash
    }
    
    func deal(with trash: Trash) {
        
        if trash.type == .plastic {
            print("deal with it plastic")
        }
        else {
            diffTrash?.deal(with: trash)
        }
    }
}

class OrganicTrashCan: TrashCan {
    
    var diffTrash: TrashCan?
    
    init(nextTrash: TrashCan?) {
        diffTrash = nextTrash
    }
    
    func deal(with trash: Trash) {
        
        if trash.type == .organic {
            print("deal with it organic")
        }
        else {
            print("Can't deal with it")
        }
    }
}


class TrashManager {
    
    var trashCan: TrashCan
    
    init() {
        
        let organicTrash = OrganicTrashCan(nextTrash: nil)
        let plasticTrash = PlasticTrashCan(nextTrash: organicTrash)
        let paperTrash = PaperTrashCan(nextTrash: plasticTrash)
        
        trashCan = paperTrash
    }
}
