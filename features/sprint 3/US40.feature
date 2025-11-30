Feature: US40 Enviar datos de sensores al sistema
  Como sistema IoT,
  quiero enviar los datos de los sensores al servidor Edge
  para que sean procesados y posteriormente visualizados.

  Scenario: Envío exitoso de telemetría al Edge Server
    Given el dispositivo tiene conexión WiFi estable y ha capturado datos de <temp>, <bpm> y <spo2>
    When el dispositivo envía el payload JSON al endpoint "/api/edge/telemetry"
    Then el servidor Edge responde con código <codigo_http> y almacena los datos localmente

    Examples:
      | temp | bpm | spo2 | codigo_http |
      | 36.5 | 75  | 98   | 200 OK      |
      | 38.2 | 95  | 96   | 200 OK      |

  Scenario: Fallo de comunicación con reintento
    Given el dispositivo pierde la conexión con el servidor Edge
    When intenta enviar los datos capturados
    Then el sistema guarda los datos en memoria temporal y reintenta el envío tras <tiempo_espera> segundos

    Examples:
      | tiempo_espera |
      | 5             |
      | 10            |
