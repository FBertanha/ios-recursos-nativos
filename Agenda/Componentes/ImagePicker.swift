//
//  ImagePicker.swift
//  Agenda
//
//  Created by Felipe Bertanha on 10/09/19.
//  Copyright © 2019 Alura. All rights reserved.
//

import UIKit

enum MenuOpcoes {
    case camera
    case biblioteca
}

protocol ImagePickerFotoSelecionada {
    func imagePickerFotoSelecionada(_ foto: UIImage)
}

class ImagePicker: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: -
    
    var delegate : ImagePickerFotoSelecionada?
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let foto = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        delegate?.imagePickerFotoSelecionada(foto)
        picker.dismiss(animated: true, completion: nil)
    }
    
    func menuDeOpcoes(completion: @escaping(_ opcao: MenuOpcoes) -> Void) -> UIAlertController {
        let menu = UIAlertController(title: "Atenção", message: "escolha uma das opções abaixo", preferredStyle: .actionSheet)
        
        let camera = UIAlertAction(title: "câmera", style: .default, handler: { (acao) in
            completion(.camera)
        })
        
        let biblioteca = UIAlertAction(title: "biblioteca", style: .default, handler: {(acao) in
            completion(.biblioteca)
        })
        
        let cancelar = UIAlertAction(title: "cancelar", style: .cancel, handler: nil)
        
        menu.addAction(camera)
        menu.addAction(biblioteca)
        menu.addAction(cancelar)
        return menu
    }

}
