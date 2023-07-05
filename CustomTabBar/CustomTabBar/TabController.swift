//
//  TabBarController.swift
//  CustomTabBar
//
//  Created by Ozgun Dogus on 20.06.2023.
//

import UIKit

class TabController: UITabBarController,UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabs()
        self.tabBar.backgroundColor = .yellow
        self.tabBar.barTintColor = .red
        self.tabBar.tintColor = .blue
        self.tabBar.unselectedItemTintColor = .systemTeal
        self.selectedIndex = 2
        
        self.delegate  = self
        
//        aşağıdaki exerciseController sayesisinde ExerciseViewController sayfasının içerisinde kod yazmadan sayfayı yönettik ve arka plan rengini değiştirdik .
        
//
//        if let exerciseNav = self.viewControllers?[3] as? UINavigationController,
//        let exerciseController = exerciseNav.viewControllers.first as? ExerciseViewController {
//            exerciseController.view.backgroundColor = .red
//        }
//
        

        
        
    }
    
    private func setupTabs () {
        
        let home = createNav(with: "Home", and: UIImage(systemName: "house"), vc: HomeController())
        let history = createNav(with: "History", and: UIImage(systemName: "clock"), vc: HistoryViewController())
        let workout = createNav(with: "Workout", and: UIImage(systemName: "person"), vc: WorkoutViewController())
        let exercise = createNav(with: "Exercise", and: UIImage(systemName: "cloud.snow"), vc:  ExerciseViewController())
        
        self.setViewControllers([home,history,workout,exercise], animated: true)
        
    }
    
    private func createNav ( with title: String , and image: UIImage? , vc: UIViewController ) -> UINavigationController {
        let nav  = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = title
        
        nav.tabBarItem.image = image
        
        nav.navigationBar.backgroundColor = .yellow // appbar background color
        nav.viewControllers.first?.navigationItem.title = title + "Controller"
        nav.viewControllers.first?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Button", style: .plain, target:nil, action: nil)
        return nav
    }
 
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if self.selectedIndex == 1 {
            
            let alert = UIAlertController(title: "Hello", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default,handler: nil))
            self.present(alert, animated: true,completion: nil)
        }
        
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
    }
    
    
}
