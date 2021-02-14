/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import java.io.File;

/**
 *
 * @author Rodolfo
 */
public class GeneradorLexico {
    /*public static void main(String[] args) {
        String path = "C:/Users/Rodolfo/Documents/NetBeansProjects/AnalizadorLexico/src/clases/Lexer.flex";
        generarLexer(path);
    }*/
    
    public static void generarLexer(String path){
        //String path = "C:/Users/Rodolfo/Documents/NetBeansProjects/AnalizadorLexico/src/clases/Lexer.flex";
        File archivo = new File(path);
        JFlex.Main.generate(archivo);
    }
}
