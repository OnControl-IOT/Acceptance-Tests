Feature: US09 Mandar solicitud de cita
  Como paciente,
  quiero enviar una solicitud de cita
  para agendar una atención con el especialista.

  Scenario: Solicitud de cita enviada correctamente
    Given el <paciente> selecciona <especialidad>, <fecha> y <hora> válidas
    When confirma el envío de la solicitud de cita
    Then el sistema registra la cita en estado <estado_solicitud> y muestra un <mensaje_confirmacion>

  Examples:
    | paciente | especialidad  | fecha       | hora   | estado_solicitud | mensaje_confirmacion          |
    | Ana      | Oncología     | 2025-11-20  | 10:00  | Pendiente        | Solicitud de cita enviada     |
    | Luis     | Psicooncología| 2025-11-22  | 16:30  | Pendiente        | Solicitud de cita enviada     |

  Scenario: Solicitud de cita fallida por datos incompletos
    Given el <paciente> no selecciona una <fecha> o <hora>
    When intenta enviar la solicitud de cita
    Then el sistema muestra un <mensaje_error> y no registra la solicitud

  Examples:
    | paciente | fecha      | hora | mensaje_error                                   |
    | Ana      | 2025-11-20 |      | Debes seleccionar fecha y hora para la cita    |
    | Luis     |            | 16:30| Debes seleccionar fecha y hora para la cita    |
