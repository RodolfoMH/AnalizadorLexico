/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 *
 * @author Rodolfo
 */
public class GeneradorLexico {
    /*public static void main(String[] args) throws Exception {
        
        String path = "C:/Users/Rodolfo/Documents/NetBeansProjects/Analizador/Codigo/src/clases/Lexer.flex";
        String pathCut = "C:/Users/Rodolfo/Documents/NetBeansProjects/Analizador/Codigo/src/clases/LexerCup.flex";
        String[] rutaS = {"-parser", "Sintax", "C:/Users/Rodolfo/Documents/NetBeansProjects/Analizador/Codigo/src/clases/Sintax.cup"};
        generar(path, pathCut, rutaS);
    }*/
    
    public static void generar(String path, String path2, String[] rutaS) throws IOException, Exception{
        //String path = "C:/Users/Rodolfo/Documents/NetBeansProjects/AnalizadorLexico/src/clases/Lexer.flex";
        File archivo;
        archivo = new File(path);
        JFlex.Main.generate(archivo);
        archivo = new File(path2);
        JFlex.Main.generate(archivo);
        java_cup.Main.main(rutaS);
        
        Path rutaSym = Paths.get("C:/Users/Rodolfo/Documents/NetBeansProjects/Analizador/Codigo/src/clases/sym.java");
        if (Files.exists(rutaSym)) {
            Files.delete(rutaSym);
        }
        Files.move(
                Paths.get("C:/Users/Rodolfo/Documents/NetBeansProjects/Analizador/Codigo/sym.java"), 
                Paths.get("C:/Users/Rodolfo/Documents/NetBeansProjects/Analizador/Codigo/src/clases/sym.java")
        );
        
        
        Path rutaSintax = Paths.get("C:/Users/Rodolfo/Documents/NetBeansProjects/Analizador/Codigo/src/clases/Sintax.java");
        if (Files.exists(rutaSintax)) {
            Files.delete(rutaSintax);
        }
        Files.move(
                Paths.get("C:/Users/Rodolfo/Documents/NetBeansProjects/Analizador/Codigo/Sintax.java"), 
                Paths.get("C:/Users/Rodolfo/Documents/NetBeansProjects/Analizador/Codigo/src/clases/Sintax.java")
        );
    }
}
