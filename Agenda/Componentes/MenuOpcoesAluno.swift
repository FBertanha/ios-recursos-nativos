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
    case ligacao
    case waze
    case mapa
}

class MenuOpcoesAluno: NSObject {
    
    
    func configuraMenuDeOpcoesDoAluno(completion:@escaping(_ opcao: MenuActionSheetAluno) -> Void) -> UIAlertController {
        let menu = UIAlertController(title: "Atenção", message: "Escolha uma das opções abaixo", preferredStyle: .actionSheet)
        
        let sms = UIAlertAction(title: "Enviar SMS", style: .default) { (acao) in
            completion(.sms)
        }
        
        let ligacao = UIAlertAction(title: "Ligar", style: .default) { (acao) in
            completion(.ligacao)
        }
        
        let waze = UIAlertAction(title: "Waze", style: .default) { (acao) in
            completion(.waze)
        }
        
        let mapa = UIAlertAction(title: "Mapa", style: .default) { (acao) in
            completion(.mapa)
        }
        
        let cancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        menu.addAction(sms)
        menu.addAction(cancelar)
        menu.addAction(ligacao)
        menu.addAction(waze)
        menu.addAction(mapa)
        
        return menu
    }
}
