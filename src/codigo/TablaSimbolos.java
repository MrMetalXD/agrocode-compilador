/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package codigo;
import java.util.*;

/**
 *
 * @author alanc
 */
public class TablaSimbolos {
    public static class EntradaIdentificador {
        private final String nombre;
        private final int linea;
        private final int columna;
        private String tipo; 
        private int direccionMemoria;
        
        public EntradaIdentificador(String nombre, int linea, int columna){
            this.nombre = nombre;
            this.linea = linea;
            this.columna = columna;
            this.tipo = "desconocido";
            this.direccionMemoria = -1;
        }
        
        public String getNombre(){
            return nombre;
        }
        
        public int getLinea(){
            return linea;
        }
        
        public int getColumna(){
            return columna;
        }
        
        public String getTipo() {
            return tipo;
        }

        public void setTipo(String tipo) {
            this.tipo = tipo;
        }
        
        public int getDireccionMemoria() {
            return direccionMemoria;
        }
        public void setDireccionMemoria(int direccionMemoria) {
            this.direccionMemoria = direccionMemoria;
        }
        
        public String toString(){
            return nombre + "(" + linea + ", " + columna + ")";
        }
    }
    
    private final Map<String, EntradaIdentificador> identificadores = new LinkedHashMap<>();
    
    private static final Set<String> PALABRAS_RESERVADAS = new HashSet<>(Arrays.asList("SI","SINO","FIN_SI",
            "MIENTRAS","FIN_MIENTRAS",
            "PARA","FIN_PARA","REPETIR","VECES","FIN_REPETIR",
            "ESPERAR","FUNCION","RETORNAR","IMPRIMIR","LEER","ALEATORIO",
            "EXPERIMENTO","FIN_EXPERIMENTO","BLOQUE","FIN_BLOQUE",
            "IMPORTAR","PAQUETE","USAR","CONSTANTE","VARIABLE",
            "ELEMENTO","COMPUESTO","MEZCLA","CANTIDAD","MOLES","GRAMOS",
            "LITROS","ESTADO","SOLIDO","LIQUIDO","GAS","ACUOSO","PUREZA",
            "CONCENTRACION","MOLARIDAD","CREAR","ELIMINAR","LIMPIAR","COMBINAR","AGREGAR","DISOLVER",
            "PRECIPITAR","EVAPORAR","DESTILAR","FILTRAR","TITULAR",
            "USAR_CATALIZADOR","AJUSTAR_TEMPERATURA","AJUSTAR_PRESION",
            "AGITAR","CALENTAR","ENFRIAR","ANOTAR",
            "GENERAR_REPORTE","EXPORTAR","GUARDAR","CARGAR",
            "EXPLICAR_REACCION","ADVERTIR","RUBRICA","PUNTUACION",
            "INFO","MASA_MOLAR","BALANCEAR","TIPO_REACCION",
            "ENERGIA_REACCION","ENTALPIA","ENTROPIA","GIBBS",
            "PREDICIR_PRODUCTO","EQUILIBRIO","PKA","PH","ESTEQUIOMETRIA",
            "REACTIVO_LIMITANTE",
            "NUMERO","CADENA","BOOLEANO","LISTA","MAPA",
            "VERDADERO","FALSO","NULO"));
    
    public Map<String, EntradaIdentificador> getIdentificadores() {
        // Devolvemos una copia para que la GUI no pueda modificar la tabla original
        return java.util.Collections.unmodifiableMap(identificadores);
    }
    
    public boolean esReservada(String lexema) {
        if (lexema == null) return false;
        // si quieres que sea insensible a mayúsculas:
        return PALABRAS_RESERVADAS.contains(lexema.toUpperCase());
    }
    
    public void registrarIdentificador(String nombre, int linea, int columna) {
        if (nombre == null || nombre.isEmpty()) return;
        if (esReservada(nombre)) return; // por si acaso

        if (!identificadores.containsKey(nombre)) {
            identificadores.put(nombre, new EntradaIdentificador(nombre, linea, columna));
        }
        // Si quisieras llevar una lista de apariciones, aquí podrías ampliarlo,
        // pero eso ya sería más de léxico.
    }
    
    public EntradaIdentificador buscar(String nombre) {
        return identificadores.get(nombre);
    }
   
}
