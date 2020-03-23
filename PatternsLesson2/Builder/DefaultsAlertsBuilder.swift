//
//  DefaultsAlertsBuilder.swift
//  PatternsLesson2
//
//  Created by Ильдар Залялов on 23.03.2020.
//  Copyright © 2020 Ildar Zalyalov. All rights reserved.
//

import Foundation
import UIKit

protocol DefaultsAlertsBuilder: AnyObject {
    
    func buildOkAlert(with title: String, message: String) -> UIViewController
    
    func buildCancelAlert(with message: String, handler: (() -> Void)?) -> UIViewController
}

class DefaultsAlertsBuilderImpl: DefaultsAlertsBuilder {
    
    func buildOkAlert(with title: String, message: String) -> UIViewController {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertController.addAction(action)
        
        return alertController
    }
    
    func buildCancelAlert(with message: String, handler: (() -> Void)?) -> UIViewController {
        
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Cancel", style: .default) { _ in
            handler?()
        }
        
        alertController.addAction(action)
        
        return alertController
    }
}
