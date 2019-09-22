import UIKit


extension UIViewController {
    
    func findChildViewControllerOfType(_ klass: AnyClass) -> UIViewController? {
        for child in childViewControllers {
            if child.isKind(of: klass) {
                return child
            }
        }
        return nil
    }
    
    public func add(asChildViewController viewController: UIViewController,to parentView:UIView) {
        // Add Child View Controller
        addChildViewController(viewController)
        
        // Add Child View as Subview
        parentView.addSubview(viewController.view)
        
        // Configure Child View
        viewController.view.frame = parentView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Notify Child View Controller
        viewController.didMove(toParentViewController: self)
    }
    public func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParentViewController: nil)
        
        // Remove Child View From Superview
        viewController.view.removeFromSuperview()
        
        // Notify Child View Controller
        viewController.removeFromParentViewController()
    }
    
    func setupNavigationBarItem(title : String, _ isBack : Bool = false){
        let customLbl = UILabel()
        customLbl.text = title
        customLbl.textColor = .red
        customLbl.font = .boldSystemFont(ofSize: 18)
        navigationItem.titleView = customLbl
        
        let leftBarBtn = UIButton(type: .system)
        if isBack {
            leftBarBtn.setImage(UIImage(named: "ic-less-than")?.withRenderingMode(.alwaysOriginal), for: .normal)
            leftBarBtn.addTarget(self, action: "back", for: .touchUpInside)
        }else{
            leftBarBtn.setImage(UIImage(named: "ic-menu")?.withRenderingMode(.alwaysOriginal), for: .normal)
            leftBarBtn.addTarget(self, action: "goToSetting", for: .touchUpInside)
        }
        leftBarBtn.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBarBtn)
        
        navigationController?.navigationBar.clear()
    }
    
    @objc func back() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func goToSetting() {
        let storyboard = UIStoryboard(name: "Lover", bundle: nil)
        let settingVC = storyboard.instantiateViewController(withIdentifier: "setting") as! SettingVC

        navigationController?.pushViewController(settingVC, animated: true)
    }
    
}
