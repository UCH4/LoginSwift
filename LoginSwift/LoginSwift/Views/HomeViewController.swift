//
//  HomeViewController.swift
//  LoginSwift
//
//  Created by Victor Roldan on 4/05/22.
//

import UIKit
import SwiftKeychainWrapper

class HomeViewController: UIViewController {
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    private var defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadingIndicator.startAnimating()
        loadingIndicator.isHidden = false // Asegúrate de que no esté oculto desde el Storyboard inicialmente
        
        // Simula la carga de datos del usuario (reemplaza con tu lógica real)
        cargarDatosDelUsuario()
        
        print("email: ", defaults.string(forKey: "email") ?? "No email found")
    }
    
    func cargarDatosDelUsuario() {
        // Simulación de carga de datos (puedes ajustar el tiempo)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.printUserInfo()
            self.loadingIndicator.stopAnimating()
            self.loadingIndicator.isHidden = true
            print("Datos del usuario cargados.")
            // Aquí puedes realizar cualquier otra acción después de cargar los datos
        }
    }
    
    func printUserInfo(){
        let email: String? = KeychainWrapper.standard.string(forKey: "email")
        let id: String? = KeychainWrapper.standard.string(forKey: "id")
        let name: String? = KeychainWrapper.standard.string(forKey: "name")
        let accessToken: String? = KeychainWrapper.standard.string(forKey: "accessToken")
        
        userEmailLabel.text = "  Email: " + (email ?? "N/A")
        userIdLabel.text = "  Id: " + (id ?? "N/A")
        userNameLabel.text = "  Name: " + (name ?? "N/A")
        print("AccessToken: ", accessToken ?? "N/A")
        
        userEmailLabel.layer.masksToBounds = true
        userIdLabel.layer.masksToBounds = true
        userNameLabel.layer.masksToBounds = true
        userEmailLabel.layer.cornerRadius = 5
        userIdLabel.layer.cornerRadius = 5
        userNameLabel.layer.cornerRadius = 5
        
    }
    
    @IBAction func logoutButtonPressed(_ sender: Any) {
        KeychainWrapper.standard.removeObject(forKey: "email")
        KeychainWrapper.standard.removeObject(forKey: "id")
        KeychainWrapper.standard.removeObject(forKey: "name")
        KeychainWrapper.standard.removeObject(forKey: "accessToken")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController{
            view.window?.windowScene?.keyWindow?.rootViewController = vc
            view.window?.windowScene?.keyWindow?.makeKeyAndVisible()
        }
    }
}
