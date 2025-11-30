Feature: US41 Detectar umbrales anormales
  Como sistema IoT,
  quiero comparar los valores obtenidos con los umbrales normales
  para detectar condiciones críticas de salud automáticamente.

  Scenario: Detección de valores normales
    Given el sistema recibe una lectura de <parametro> con valor <valor>
    And el rango normal configurado es de <min> a <max>
    When el Edge Server evalúa la lectura
    Then el sistema clasifica el estado como "Normal" y no genera alertas

    Examples:
      | parametro   | valor | min | max |
      | Temperatura | 36.5  | 36.0| 37.5|
      | SpO2        | 98    | 95  | 100 |

  Scenario: Detección de valores críticos (Alertas)
    Given el sistema recibe una lectura de <parametro> con valor <valor>
    And el rango normal es de <min> a <max>
    When el valor está fuera del rango permitido
    Then el sistema genera una alerta de prioridad <prioridad> y la marca para sincronización inmediata

    Examples:
      | parametro   | valor | min | max | prioridad |
      | Temperatura | 39.5  | 36.0| 37.5| ALTA      |
      | SpO2        | 88    | 90  | 100 | ALTA      |
      | BPM         | 140   | 60  | 100 | MEDIA     |
