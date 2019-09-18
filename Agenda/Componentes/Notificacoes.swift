//
//  Notificacoes.swift
//  Agenda
//
//  Created by Felipe Bertanha on 17/09/19.
//  Copyright © 2019 Alura. All rights reserved.
//

import UIKit

class Notificacoes: NSObject {
    
    func exibeNotificacaoDeMediaDosAlunos(dicionarioDeMedia : Dictionary<String, Any>) -> UIAlertController? {
        
        if let media = dicionarioDeMedia["media"] as? String {
            return exibeNotificacao(titulo: "Média", mensagem: "A média dos alunos é \(media)")
        }
        return nil
    }

    func exibeNotificacao(titulo : String, mensagem : String) -> UIAlertController {
        let alerta = UIAlertController(title: titulo,
                                       message: mensagem,
                                       preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alerta.addAction(ok)
        
        return alerta
    }
}
