//
//  RecordViewController.swift
//  LoginSwift
//
//  Created by Joaquin Ucha Gallo on 06/05/2025.
//

import Foundation
//
//  RegistroViewController.swift
//  LoginSwift
//
//  Created by Joaquin Ucha Gallo on 06/05/2025.
//

import Foundation
import UIKit

class RecordViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var registrarButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Cualquier configuración inicial
    }

    @IBAction func registrarButtonTapped(_ sender: UIButton) {
        guard let username = usernameTextField.text, !username.isEmpty,
              let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty,
              let confirmPassword = confirmPasswordTextField.text, !confirmPassword.isEmpty else {
            mostrarAlerta(titulo: "Error", mensaje: "Por favor, completa todos los campos.")
            return
        }

        if password != confirmPassword {
            mostrarAlerta(titulo: "Error", mensaje: "Las contraseñas no coinciden.")
            return
        }

        // Aquí iría la lógica para verificar si el usuario ya existe (en una base de datos real)

        // Simulación de guardado en la base de datos
        guard guardarNuevoUsuario(username: username, email: email, password: password) else {
            mostrarAlerta(titulo: "Error", mensaje: "No se pudo crear la cuenta. Inténtalo de nuevo.")
            return
        }

        mostrarAlerta(titulo: "Éxito", mensaje: "Cuenta creada exitosamente.") { _ in
            // Volver a la pantalla de Login después del registro exitoso
            self.dismiss(animated: true, completion: nil)
        }
    }

    // Simulación de la función para guardar un nuevo usuario en la base de datos
    func guardarNuevoUsuario(username: String, email: String, password: String) -> Bool {
        // En una aplicación real, aquí interactuarías con tu base de datos
        print("Simulando guardar usuario: \(username), \(email), \(password)")
        // Aquí podrías realizar validaciones más complejas antes de "guardar"

        // Simulación de éxito (en una aplicación real, esto dependería de la interacción con la base de datos)
        return true
    }

    @IBAction func volverButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    // Función para mostrar alertas al usuariotitlemessage
    func mostrarAlerta(titulo: String, mensaje: String, completion: ((UIAlertAction) -> Void)? = nil) {
        let alerta = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        let accionOK = UIAlertAction(title: "OK", style: .default, handler: completion)
        alerta.addAction(accionOK)
        present(alerta, animated: true, completion: nil)
    }
}
