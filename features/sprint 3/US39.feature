Feature: US39 Medir parámetros vitales (IoT)
  Como paciente,
  quiero que el sistema tome mis parámetros vitales mediante sensores
  para monitorear mi temperatura, oxígeno en sangre y ritmo cardíaco en tiempo real.

  Scenario: Lectura exitosa de sensores biométricos
    Given el dispositivo IoT está encendido y los sensores <sensor_tipo> están conectados correctamente
    When el sistema inicia el ciclo de lectura
    Then se obtienen valores válidos dentro del rango esperado de <rango_min> a <rango_max> para <parametro>

    Examples:
      | sensor_tipo | parametro           | rango_min | rango_max |
      | MLX90614    | Temperatura (C)     | 30.0      | 45.0      |
      | MAX30102    | Ritmo Cardíaco (BPM)| 40        | 200       |
      | MAX30102    | Oxígeno (SpO2 %)    | 80        | 100       |

  Scenario: Manejo de error por sensor desconectado
    Given el sensor <sensor_defectuoso> no está respondiendo
    When el sistema intenta realizar una lectura
    Then el sistema registra un <codigo_error> y notifica el fallo en el log

    Examples:
      | sensor_defectuoso | codigo_error |
      | MLX90614          | ERR_SENSOR_TEMP_TIMEOUT |
      | MAX30102          | ERR_SENSOR_OXIM_DISCONNECTED |
