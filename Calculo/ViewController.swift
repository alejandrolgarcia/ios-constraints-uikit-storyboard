//
//  ViewController.swift
//  Calculo
//
//  Created by Luis Garcia on 26/12/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Observable que esta pendiente de cuando ejecutamos cierta accion, por ejemplo abrir el teclado
        NotificationCenter.default.addObserver(self, selector: #selector(tecladoUp), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(tecladoDown), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func tecladoUp() {
        // Obtener valor en pixeles de la pantalla del dispositivo
        let sizeScreen = UIScreen.main.nativeBounds.height
        
        if sizeScreen == 1136 {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y = -50
            }
        }
    }
    
    @objc func tecladoDown(){
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    // Ocultar el teclado al dar clic en el boton
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }


}

