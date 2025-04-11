//
//  Utilities.swift
//  FIRBootcamp
//
//  Created by Ye Park on 4/11/25.
//

import Foundation
import UIKit


@MainActor
final class Utilities {
    
    static var shared = Utilities()
    
    private init() { }
    
    func topViewController(base: UIViewController? = UIApplication.shared.connectedScenes
        .compactMap { ($0 as? UIWindowScene)?.keyWindow }
        .first?.rootViewController) -> UIViewController? {
            
            if let nav = base as? UINavigationController {
                return topViewController(base: nav.visibleViewController)
            }
            
            if let tab = base as? UITabBarController,
               let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
            
            if let presented = base?.presentedViewController {
                return topViewController(base: presented)
            }
            
            return base
        }
}
