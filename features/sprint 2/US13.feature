Feature: US13 Mandar solicitud de tratamiento
  Como paciente,
  quiero enviar una solicitud de tratamiento
  para que el especialista evalúe mi caso y defina un plan.

  Scenario: Solicitud de tratamiento enviada correctamente
    Given el <paciente> completa <diagnostico>, <sintomas> y <objetivo_tratamiento> válidos
    When envía la solicitud de tratamiento
    Then el sistema registra la solicitud en estado <estado_solicitud> y muestra un <mensaje_confirmacion>

  Examples:
    | paciente | diagnostico         | sintomas                 | objetivo_tratamiento    | estado_solicitud | mensaje_confirmacion            |
    | Ana      | Cáncer de mama      | Dolor, fatiga            | Iniciar tratamiento     | Pendiente        | Solicitud de tratamiento enviada |
    | Luis     | Linfoma             | Inflamación, fiebre      | Evaluar cambios         | Pendiente        | Solicitud de tratamiento enviada |

  Scenario: Solicitud de tratamiento rechazada por campos obligatorios incompletos
    Given el <paciente> no completa el <diagnostico> o <objetivo_tratamiento>
    When intenta enviar la solicitud
    Then el sistema muestra un <mensaje_error> y no registra la solicitud

  Examples:
    | paciente | diagnostico | objetivo_tratamiento | mensaje_error                               |
    | Ana      |             | Iniciar tratamiento  | Debes completar el diagnóstico              |
    | Luis     | Linfoma     |                      | Debes indicar el objetivo del tratamiento   |
