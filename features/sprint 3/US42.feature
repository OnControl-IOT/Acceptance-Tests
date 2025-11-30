Feature: US42 Activar LED indicador
  Como sistema IoT,
  quiero encender un LED de advertencia en el dispositivo
  para alertar visualmente al paciente cuando un parámetro sale del rango normal.

  Scenario: Activación de indicador de alerta
    Given el Edge Server ha detectado una condición crítica en los signos vitales
    When el dispositivo recibe la respuesta del servidor con estado "ALERTA"
    Then el LED indicador cambia a color <color_led> y parpadea con frecuencia <frecuencia>

    Examples:
      | estado_salud | color_led | frecuencia |
      | Fiebre Alta  | Rojo      | Rápida     |
      | Hipoxia      | Rojo      | Rápida     |

  Scenario: Indicador de estado normal
    Given los signos vitales del paciente están estables
    When el dispositivo recibe la confirmación del servidor
    Then el LED indicador se mantiene en color <color_led> fijo o se apaga para ahorrar energía

    Examples:
      | estado_salud | color_led |
      | Estable      | Verde     |
