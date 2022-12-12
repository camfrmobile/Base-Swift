extension UIViewController {
    func setupSlideMenuItem() {
        self.addLeftBarButtonWithImage(UIImage(named: "ic-menu")!)
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.addLeftGestures()
    }
    
    func removeSlideMenuItem(){
        self.navigationItem.leftBarButtonItem = nil
        self.slideMenuController()?.removeLeftGestures()
    }
}

