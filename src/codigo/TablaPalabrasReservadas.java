package codigo;

import java.util.Arrays;
import static java.util.Collections.*;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

/*"Tabla Fija"*/
public class TablaPalabrasReservadas {
   private static final Map<String, String> PALABRAS_RESERVADAS = new LinkedHashMap<>();

    static {
        registrar("si", "PALABRA_RESERVADA");
        registrar("sino", "PALABRA_RESERVADA");
        registrar("sino_si", "PALABRA_RESERVADA");
        registrar("fin_si", "PALABRA_RESERVADA");
        registrar("mientras", "PALABRA_RESERVADA");
        registrar("hacer", "PALABRA_RESERVADA");
        registrar("principal", "PALABRA_RESERVADA");
        registrar("fin_principal", "PALABRA_RESERVADA");
        registrar("elemento", "PALABRA_RESERVADA");
        registrar("compuesto", "PALABRA_RESERVADA");
        registrar("solucion", "PALABRA_RESERVADA");
        registrar("moles", "PALABRA_RESERVADA");
        registrar("peso", "PALABRA_RESERVADA");
        registrar("estado", "PALABRA_RESERVADA");
        registrar("solido", "PALABRA_RESERVADA");
        registrar("liquido", "PALABRA_RESERVADA");
        registrar("litro", "PALABRA_RESERVADA");
        registrar("gaseoso", "PALABRA_RESERVADA");
        registrar("acuoso", "PALABRA_RESERVADA");
        registrar("reaccion", "PALABRA_RESERVADA");
        registrar("agregar", "PALABRA_RESERVADA");
        registrar("eliminar", "PALABRA_RESERVADA");
        registrar("limpiar", "PALABRA_RESERVADA");
        registrar("mezclar", "PALABRA_RESERVADA");
        registrar("disolver", "PALABRA_RESERVADA");
        registrar("precipitar", "PALABRA_RESERVADA");
        registrar("evaporar", "PALABRA_RESERVADA");
        registrar("destilar", "PALABRA_RESERVADA");
        registrar("medir_ph", "PALABRA_RESERVADA");
        registrar("medir_temp", "PALABRA_RESERVADA");
        registrar("medir_presion", "PALABRA_RESERVADA");
        registrar("agitar", "PALABRA_RESERVADA");
        registrar("calentar", "PALABRA_RESERVADA");
        registrar("enfriar", "PALABRA_RESERVADA");
        registrar("neutralizar", "PALABRA_RESERVADA");
        registrar("balancear_reaccion", "PALABRA_RESERVADA");
        registrar("ejecutar_reaccion", "PALABRA_RESERVADA");
        registrar("duracion", "PALABRA_RESERVADA");
        registrar("mostrar", "PALABRA_RESERVADA");
        registrar("mostrar_info", "PALABRA_RESERVADA");
        registrar("enviar_alerta", "PALABRA_RESERVADA");
        registrar("imprimir", "PALABRA_RESERVADA");
        registrar("+", "OPE_ARITMETICO");
        registrar("-", "OPE_ARITMETICO");
        registrar("*", "OPE_ARITMETICO");
        registrar("/", "OPE_ARITMETICO");
        registrar("=", "OPE_ASIGNACION");
        registrar("==", "OPE_RELACIONAL");
        registrar("!=", "OPE_RELACIONAL");
        registrar("<", "OPE_RELACIONAL");
        registrar(">", "OPE_RELACIONAL");
        registrar("<=", "OPE_RELACIONAL");
        registrar(">=", "OPE_RELACIONAL");
        registrar("&&", "OPE_LOGICO");
        registrar("||", "OPE_LOGICO");
        registrar("!", "OPE_LOGICO");
        registrar("(", "DELIMITADOR");
        registrar(")", "DELIMITADOR");
        registrar("{", "DELIMITADOR");
        registrar("}", "DELIMITADOR");
        registrar(";", "DELIMITADOR");
    }

    private static void registrar(String lexema, String componente) {
        PALABRAS_RESERVADAS.put(lexema, componente);
    }

    /*
        Revisa si un lexema existe en la tabla fija.
    */
    public static boolean esReservada(String lexema) {
        if (lexema == null) return false;
        return PALABRAS_RESERVADAS.containsKey(lexema);
    }

    // Devuelve solo los lexemas (como antes), para no romper el resto del código
    public static Set<String> getPalabrasReservadas() {
        return unmodifiableSet(PALABRAS_RESERVADAS.keySet());
    }

    //Devuelve el componente léxico de una palabra reservada
    public static String getComponente(String lexema) {
        return PALABRAS_RESERVADAS.get(lexema);
    }
}
