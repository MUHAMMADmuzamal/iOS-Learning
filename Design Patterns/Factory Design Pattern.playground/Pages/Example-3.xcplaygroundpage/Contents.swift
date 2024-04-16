//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

protocol Dialog {
    func createButton() -> Button
}
extension Dialog {
    func renderDialog() {
        let okButton: Button = createButton()
        okButton.renderButton()
        okButton.onClick()
    }
}

class WindowDialog: Dialog {
    func createButton() -> Button {
        WindowButton()
    }
}

class HTMLDialog: Dialog {
    func createButton() -> Button {
        HTMLButton()
    }
}

protocol Button {
    func renderButton()
    func onClick()
}

class WindowButton: Button {
    func renderButton() {
        print("rendering Windows Button")
    }
    
    func onClick() {
        print("windows button clicked.")
    }
}

class HTMLButton: Button {
    func renderButton() {
        print("rendering HTML Button")
    }
    
    func onClick() {
        print("HTML button clicked.")
    }
}

enum OsTypes {
    case windows, web
}

class DialogFactory {
    static func getDiaLog(type: OsTypes) -> Dialog {
        switch type {
        case .web:
            return HTMLDialog()
        case .windows:
            return WindowDialog()
        }
    }
}


class ViewController {
    private var dialog: Dialog
    
    init(dialog: Dialog) {
        self.dialog = dialog
    }
    
    func render(){
        dialog.renderDialog()
    }
}

let htmlVC = ViewController(dialog: DialogFactory.getDiaLog(type: .web))
let windowsVC = ViewController(dialog: DialogFactory.getDiaLog(type: .windows))

htmlVC.render()
windowsVC.render()
