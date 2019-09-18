//
//  CalculaMediaAPI.swift
//  Agenda
//
//  Created by Felipe Bertanha on 17/09/19.
//  Copyright © 2019 Alura. All rights reserved.
//

import UIKit

class CalculaMediaAPI: NSObject {

    func calculaMediaGeralDosAlunos(alunos : Array<Aluno>,
                                    sucesso : @escaping(_ dicionarioDeMedias : Dictionary<String, Any>) -> Void,
                                    falha: @escaping(_ erro : Error) -> Void) {
        guard let url = URL(string: "https://www.caelum.com.br/mobile") else {return}
        
        var requisicao = URLRequest(url: url)
        
        var json : Dictionary<String, Any> = [:]
        var listaDeAlunos : Array<Dictionary<String, Any>> = []
        
        for aluno in alunos {
            let dicionarioDeAlunos : Dictionary<String, Any> = [
                "id" : "\(aluno.objectID)",
                "nome" : aluno.nome,
                "endereco" : aluno.endereco,
                "telefone" : aluno.telefone,
                "site" : aluno.site,
                "nota" : String(aluno.nota)
            ]
            
            listaDeAlunos.append(dicionarioDeAlunos)
        }
        
        
        
        json = [
            "list" : [
                ["aluno" : listaDeAlunos]
            ]
        ]
        
        
        do {
            let data = try JSONSerialization.data(withJSONObject: json, options: [])
            requisicao.httpBody = data
            requisicao.httpMethod = "POST"
            requisicao.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let task = URLSession.shared.dataTask(with: requisicao) { (data, responde, error) in
                if error != nil {
                    return
                }
                
                do {
                    let dicionario = try JSONSerialization.jsonObject(with: data!, options: []) as! Dictionary<String, Any>
                    
                    //print(dicionario)
                    sucesso(dicionario)
                } catch {
                    //print(error.localizedDescription)
                    falha(error)
                }
            }
            
            task.resume()
                
        }catch {
            //print(error.localizedDescription)
            falha(error)
        }
        
        
    }
}
