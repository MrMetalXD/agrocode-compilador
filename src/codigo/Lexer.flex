package codigo;
import static codigo.Tokens.*;

%%
%class Lexer
%type Tokens
%line
%column

%{
    private final TablaSimbolos tablaSimbolos = new TablaSimbolos();

    private Tokens tk(String lex, String comp, int li, int co){
        return new Tokens(lex, comp, li+1, co+1); 
    }
%}

LETRAS = [a-zA-Z_]+
ESPACIO = [ \t\r\n]+
DIGITO = [0-9]
ENTERO = {DIGITO}+
DECIMAL = "." {DIGITO}+
NUMERO = {ENTERO} ( {DECIMAL} )?

IDENTIFICADOR = {LETRAS}({LETRAS}|{DIGITO})*
CADENA = \"([^\"\\]|\\.)*\"
COMENTARIO = \#.*                          

/* Unidades físicas */

UNIDAD_CELSIUS = "C"    /* grados Celsius */
UNIDAD_FAHRENHEIT = "F"  /* grados Fahrenheit */
UNIDAD_HUMEDAD_REL = "%HR"  /* humedad relativa */
UNIDAD_HUMEDAD_SUELO = "%HS"    /* humedad del suelo */
UNIDAD_MILILITRO = "mL"    /*militros */
UNIDAD_LITRO = "L"  /* litros */
UNIDAD_SEGUNDO = "s"    /* segundos */
UNIDAD_MINUTO = "min"   /* minutos */
UNIDAD_HORA = "h"   /* horas */
UNIDAD_LUX = "lux"  /* iluminacion lux */
UNIDAD_PPDF = "ppfd"    /* densidad de fotones fotosinteticos */

TEMP_CELSIUS = {NUMERO}{UNIDAD_CELSIUS}
TEMP_FAHRENHEIT = {NUMERO}{UNIDAD_FAHRENHEIT}
HUMEDAD_RELATIVA = {NUMERO}{UNIDAD_HUMEDAD_REL}
HUMEDAD_SUELO = {NUMERO}{UNIDAD_HUMEDAD_SUELO}
VOLUMEN_ML = {NUMERO}{UNIDAD_MILILITRO}
VOLUMEN_L = {NUMERO}{UNIDAD_LITRO}
TIEMPO_SEGUNDOS = {NUMERO}{UNIDAD_SEGUNDO}
TIEMPO_MINUTOS = {NUMERO}{UNIDAD_MINUTO}
TIEMPO_HORAS = {NUMERO}{UNIDAD_HORA}
ILUMINACION_LUX = {NUMERO}{UNIDAD_LUX}
ILUMINACION_PPDF = {NUMERO}{UNIDAD_PPDF}

%%

  /* espacios y comentarios */
  {ESPACIO}                    { /* ignorar */ }
  {COMENTARIO}                 { /* ignorar */ }

    

  /* -------- 1) CONTROL DE FLUJO -------- */
  "SI" { return tk(yytext(),"SI",yyline,yycolumn); }
  "ENTONCES" { return tk(yytext(),"ENTONCES",yyline,yycolumn); }
  "SINO"   { return tk(yytext(),"SINO",yyline,yycolumn); }
  "FIN_SI" { return tk(yytext(),"FIN_SI",yyline,yycolumn); }

  "MIENTRAS" { return tk(yytext(),"MIENTRAS",yyline,yycolumn); }
  "HACER" { return tk(yytext(),"HACER",yyline,yycolumn); }
  "FIN_MIENTRAS" { return tk(yytext(),"FIN_MIENTRAS",yyline,yycolumn); }
  "PARA" { return tk(yytext(),"PARA",yyline,yycolumn); }
  "CADA" { return tk(yytext(),"CADA",yyline,yycolumn); }
  "EN"  { return tk(yytext(),"EN",yyline,yycolumn); }
  "FIN_PARA" { return tk(yytext(),"FIN_PARA",yyline,yycolumn); }

  "INTENTAR" { return tk(yytext(),"INTENTAR",yyline,yycolumn); }
  "CAPTURAR" { return tk(yytext(),"CAPTURAR",yyline,yycolumn); }
  "FIN_INTENTAR"  { return tk(yytext(),"FIN_INTENTAR",yyline,yycolumn); }

  "RETORNAR" { return tk(yytext(),"RETORNAR",yyline,yycolumn); }
  "ROMPER" { return tk(yytext(),"ROMPER",yyline,yycolumn); }
  "CONTINUAR" { return tk(yytext(),"CONTINUAR",yyline,yycolumn); }

  /* -------- 2) BLOQUES / ESTRUCTURA -------- */
  "CONFIGURACION" { return tk(yytext(),"CONFIGURACION",yyline,yycolumn); }
  "FIN_CONFIGURACION" { return tk(yytext(),"FIN_CONFIGURACION",yyline,yycolumn); }
  "RUTINAS" { return tk(yytext(),"RUTINAS",yyline,yycolumn); }
  "FIN_RUTINAS" { return tk(yytext(),"FIN_RUTINAS",yyline,yycolumn); }
  "PRINCIPAL" { return tk(yytext(),"PRINCIPAL",yyline,yycolumn); }
  "FIN_PRINCIPAL" { return tk(yytext(),"FIN_PRINCIPAL",yyline,yycolumn); }
  "RUTINA" { return tk(yytext(),"RUTINA",yyline,yycolumn); }
  "FIN_RUTINA" { return tk(yytext(),"FIN_RUTINA",yyline,yycolumn); }
  "FIN" { return tk(yytext(),"FIN",yyline,yycolumn); }

  /* -------- 3) ENTIDADES DEL DOMINIO -------- */
  "SENSOR" { return tk(yytext(),"SENSOR",yyline,yycolumn); }
  "ACTUADOR" { return tk(yytext(),"ACTUADOR",yyline,yycolumn); }
  "ZONA" { return tk(yytext(),"ZONA",yyline,yycolumn); }

  "NUMERO" { return tk(yytext(),"TIPO_NUMERO",yyline,yycolumn); }
  "LOGICO" { return tk(yytext(),"TIPO_LOGICO",yyline,yycolumn); }
  "TEXTO" { return tk(yytext(),"TIPO_TEXTO",yyline,yycolumn); }
  "NULO" { return tk(yytext(),"NULO",yyline,yycolumn); }
  "RANGO_TIEMPO" { return tk(yytext(),"RANGO_TIEMPO",yyline,yycolumn); }

  "VERDADERO" { return tk(yytext(),"VERDADERO",yyline,yycolumn); }
  "FALSO" { return tk(yytext(),"FALSO",yyline,yycolumn); }

  /* -------- 4) ACCIONES AGRÍCOLAS -------- */
  "REGAR" { return tk(yytext(),"REGAR",yyline,yycolumn); }
  "FERTILIZAR" { return tk(yytext(),"FERTILIZAR",yyline,yycolumn); }
  "VENTILAR" { return tk(yytext(),"VENTILAR",yyline,yycolumn); }
  "CALEFACCIONAR" { return tk(yytext(),"CALEFACCIONAR",yyline,yycolumn); }
  "ILUMINAR" { return tk(yytext(),"ILUMINAR",yyline,yycolumn); }
  "ROCIAR_PLAGUICIDA" { return tk(yytext(),"ROCIAR_PLAGUICIDA",yyline,yycolumn); }
  "ACTIVAR"  { return tk(yytext(),"ACTIVAR",yyline,yycolumn); }
  "DESACTIVAR" { return tk(yytext(),"DESACTIVAR",yyline,yycolumn); }
  "AJUSTAR_POTENCIA" { return tk(yytext(),"AJUSTAR_POTENCIA",yyline,yycolumn); }
  "LEER" { return tk(yytext(),"LEER",yyline,yycolumn); }
  "PROMEDIO" { return tk(yytext(),"PROMEDIO",yyline,yycolumn); }
  "MAX" { return tk(yytext(),"MAX",yyline,yycolumn); }
  "MIN" { return tk(yytext(),"MIN",yyline,yycolumn); }
  "ENVIAR_ALERTA" { return tk(yytext(),"ENVIAR_ALERTA",yyline,yycolumn); }

  /* -------- 5) TIEMPO -------- */
  "AHORA"  { return tk(yytext(),"AHORA",yyline,yycolumn); }
  "DE" { return tk(yytext(),"DE",yyline,yycolumn); }
  "A" { return tk(yytext(),"A",yyline,yycolumn); }
  "ESPERAR" { return tk(yytext(),"ESPERAR",yyline,yycolumn); }
  "DURACION" { return tk(yytext(),"DURACION",yyline,yycolumn); }

  /* -------- 6) OPERADORES -------- */
  "==" { return tk(yytext(),"OP_IGUAL_IGUAL",yyline,yycolumn); }
  "!=" { return tk(yytext(),"OP_DIFERENTE",yyline,yycolumn); }
  "<=" { return tk(yytext(),"OP_MENOR_IGUAL",yyline,yycolumn); }
  ">=" { return tk(yytext(),"OP_MAYOR_IGUAL",yyline,yycolumn); }
  "<" { return tk(yytext(),"OP_MENOR",yyline,yycolumn); }
  ">" { return tk(yytext(),"OP_MAYOR",yyline,yycolumn); }
  "=" { return tk(yytext(),"OP_ASIGNACION",yyline,yycolumn); }
  "NO" { return tk(yytext(),"OP_LOGICO_NOT",yyline,yycolumn); }
  "Y" { return tk(yytext(),"OP_LOGICO_AND",yyline,yycolumn); }
  "O" { return tk(yytext(),"OP_LOGICO_OR",yyline,yycolumn); }
  "+" { return tk(yytext(),"OP_SUMA",yyline,yycolumn); }
  "-" { return tk(yytext(),"OP_RESTA",yyline,yycolumn); }
  "*" { return tk(yytext(),"OP_MULTIPLICACION",yyline,yycolumn); }
  "/" { return tk(yytext(),"OP_DIVISION",yyline,yycolumn); }

  /* -------- Delimitadores -------- */
  "(" { return tk(yytext(),"PAREN_ABRE",yyline,yycolumn); }
  ")" { return tk(yytext(),"PAREN_CIERRA",yyline,yycolumn); }
  "{" { return tk(yytext(),"LLAVE_ABRE",yyline,yycolumn); }
  "}" { return tk(yytext(),"LLAVE_CIERRA",yyline,yycolumn); }
  "[" { return tk(yytext(),"CORCHETE_ABRE",yyline,yycolumn); }
  "]" { return tk(yytext(),"CORCHETE_CIERRA",yyline,yycolumn); }
  "," { return tk(yytext(),"COMA",yyline,yycolumn); }
  ":" { return tk(yytext(),"DOS_PUNTOS",yyline,yycolumn); }

  /* -------- 9) LITERALES -------- */
  {TEMP_CELSIUS} { return tk(yytext(),"LIT_TEMP_CELSIUS",yyline,yycolumn); }
  {TEMP_FAHRENHEIT} { return tk(yytext(),"LIT_TEMP_FAHRENHEIT",yyline,yycolumn); }
  {HUMEDAD_RELATIVA} { return tk(yytext(),"LIT_HUMEDAD_RELATIVA",yyline,yycolumn); }
  {HUMEDAD_SUELO} { return tk(yytext(),"LIT_HUMEDAD_SUELO",yyline,yycolumn); }
  {VOLUMEN_ML} { return tk(yytext(),"LIT_VOLUMEN_ML",yyline,yycolumn); }
  {VOLUMEN_L} { return tk(yytext(),"LIT_VOLUMEN_L",yyline,yycolumn); }
  {TIEMPO_SEGUNDOS} { return tk(yytext(),"LIT_TIEMPO_S",yyline,yycolumn); }
  {TIEMPO_MINUTOS} { return tk(yytext(),"LIT_TIEMPO_MIN",yyline,yycolumn); }
  {TIEMPO_HORAS} { return tk(yytext(),"LIT_TIEMPO_HRS",yyline,yycolumn); }
  {ILUMINACION_LUX} { return tk(yytext(),"ILU_LUX",yyline,yycolumn); }
  {ILUMINACION_PPDF} { return tk(yytext(),"ILU_PPDF",yyline,yycolumn); }

  {NUMERO} { return tk(yytext(),"LIT_NUMERO",yyline,yycolumn); }

  /* -------- Identificadores -------- */
  {IDENTIFICADOR} {
        if (tablaSimbolos.esReservada(yytext()))
            return tk(yytext(),"ERROR_IDENTIFICADOR_ES_PALABRA_RESERVADA",yyline,yycolumn);
            tablaSimbolos.registrarIdentificador(yytext(), yyline+1, yycolumn+1);
            return tk(yytext(),"IDENTIFICADOR",yyline,yycolumn);
        }

  /* -------- Errores léxicos comunes -------- */
  \"[^\"\n]* { return tk(yytext(),"ERROR_CADENA_NO_CERRADA",yyline,yycolumn); }
  [^\s\w\[\]{}();:,.=<>+\-*/\"ÁÉÍÓÚÜÑáéíóúüñ%] { return tk(yytext(),"ERROR_CARACTER_INVALIDO",yyline,yycolumn); }

/* -------- Error de análisis -------- */
. {return token(yytext(), "ERROR", yyline, yycolumn);}
