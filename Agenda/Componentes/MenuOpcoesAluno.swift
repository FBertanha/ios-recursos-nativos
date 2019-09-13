//
//  MenuOpcoesAluno.swift
//  Agenda
//
//  Created by Felipe Bertanha on 12/09/19.
//  Copyright © 2019 Alura. All rights reserved.
//

import UIKit

enum MenuActionSheetAluno {
    case sms
}

class MenuOpcoesAluno: NSObject {
    
    
    func configuraMenuDeOpcoesDoAluno(completion:@escaping(_ opcao: MenuActionSheetAluno) -> Void) -> UIAlertController {
        let menu = UIAlertController(title: "Atenção", message: "Escolha uma das opções abaixo", preferredStyle: .actionSheet)
        
        let sms = UIAlertAction(title: "Enviar SMS", style: .default) { (acao) in
            completion(.sms)
        }
        
        let cancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        menu.addAction(sms)
        menu.addAction(cancelar)
        return menu
    }
}
