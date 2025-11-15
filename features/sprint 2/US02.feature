Feature: US02 Configurar pagos
  Como paciente,
  quiero configurar mis métodos de pago
  para poder pagar mis consultas y tratamientos desde la app.

  Scenario: Registro exitoso de método de pago
    Given el <paciente> ingresa un <tipo_metodo>, <numero_tarjeta> y <fecha_vencimiento> válidos
    When confirma el registro del método de pago
    Then el sistema guarda el <metodo_pago> y muestra un <mensaje_confirmacion>

  Examples:
    | paciente | tipo_metodo | numero_tarjeta   | fecha_vencimiento | metodo_pago     | mensaje_confirmacion          |
    | Ana      | Tarjeta     | 4111111111111111 | 12/27             | Registrado      | Método de pago guardado       |
    | Luis     | Tarjeta     | 5500000000000004 | 08/26             | Registrado      | Método de pago guardado       |

  Scenario: Registro fallido por datos inválidos
    Given el <paciente> ingresa un <numero_tarjeta> o <fecha_vencimiento> inválidos
    When intenta guardar el método de pago
    Then el sistema muestra un <mensaje_error> y no registra el método

  Examples:
    | paciente | numero_tarjeta   | fecha_vencimiento | mensaje_error                              |
    | Ana      | 41111111         | 12/20             | Número de tarjeta inválido                 |
    | Luis     | 5500000000000004 | 01/23             | La tarjeta se encuentra vencida            |
