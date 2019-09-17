//
//  MapaViewController.swift
//  Agenda
//
//  Created by Felipe Bertanha on 16/09/19.
//  Copyright © 2019 Alura. All rights reserved.
//

import UIKit
import MapKit

class MapaViewController: UIViewController {
    
    //MARK : IBOutlet
    @IBOutlet weak var mapa: MKMapView!
    
    
    // MARK: - Atributos
    var aluno : Aluno?
    
    //MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = self.getTitulo()
        self.localizacaoInicial()
        self.localizarAluno()
    }
    
    //MARK : Métodos
    
    func getTitulo() -> String {
        return "Localizar Alunos"
    }
    
    func localizacaoInicial() {
        Localizacao().converteEnderecoEmCoordenadas(endereco: "Caelum - São Paulo") { (localizacaoEncontrada) in
            let pino = self.configuraPino(titulo: "Caelum", localizacao: localizacaoEncontrada)
            
            let regiao = MKCoordinateRegionMakeWithDistance(pino.coordinate, 5000, 5000)
            
            self.mapa.setRegion(regiao, animated: true)
            self.mapa.addAnnotation(pino)
        }
    }
    
    func localizarAluno() {
        guard let aluno = self.aluno else {
            return
        }
        Localizacao().converteEnderecoEmCoordenadas(endereco: aluno.endereco!) { (localizacaoEncontrada) in
            let pino = self.configuraPino(titulo: aluno.nome!, localizacao: localizacaoEncontrada)
            
            let regiao = MKCoordinateRegionMakeWithDistance(pino.coordinate, 5000, 5000)
            
            self.mapa.setRegion(regiao, animated: true)
            self.mapa.addAnnotation(pino)
        }
    }
    
    func configuraPino(titulo : String, localizacao : CLPlacemark) -> MKPointAnnotation {
        let pino = MKPointAnnotation()
        
        pino.title = titulo
        pino.coordinate = localizacao.location!.coordinate
        
        
        return pino
    }

}
