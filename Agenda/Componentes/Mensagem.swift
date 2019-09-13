//
//  Mensagem.swift
//  Agenda
//
//  Created by Felipe Bertanha on 12/09/19.
//  Copyright © 2019 Alura. All rights reserved.
//

import UIKit
import MessageUI

class Mensagem: NSObject, MFMessageComposeViewControllerDelegate{
    
    func configuraSMS(_ aluno: Aluno) -> MFMessageComposeViewController? {
        if !MFMessageComposeViewController.canSendText() {
            print("sms not available in simulator!")
            return nil
        }
        let componenteMensagem = MFMessageComposeViewController()
        
        if let numeroDoAluno : String = aluno.telefone {
            componenteMensagem.recipients = [numeroDoAluno]
        }
        
        return componenteMensagem
    }
    
    // MARK: MessageComproseDelegate
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }

}
