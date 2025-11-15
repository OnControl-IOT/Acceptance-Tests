Feature: US11 Cancelar cita
  Como paciente,
  quiero cancelar una cita
  para no asistir cuando ya no pueda o no necesite la atención.

  Scenario: Cancelación exitosa dentro del plazo permitido
    Given el <paciente> tiene una cita en estado <estado_inicial> y dentro del <plazo_cancelacion>
    When confirma la cancelación con un <motivo_cancelacion>
    Then el sistema cambia el estado a <estado_final> y muestra un <mensaje_confirmacion>

  Examples:
    | paciente | estado_inicial | plazo_cancelacion | motivo_cancelacion      | estado_final | mensaje_confirmacion     |
    | Ana      | Aceptada       | Vigente           | No podré asistir        | Cancelada    | Cita cancelada con éxito |
    | Luis     | Reprogramada   | Vigente           | Cambio de planes        | Cancelada    | Cita cancelada con éxito |

  Scenario: Cancelación rechazada por exceder el plazo
    Given el <paciente> tiene una cita en estado <estado_inicial> y fuera del <plazo_cancelacion>
    When intenta cancelar la cita
    Then el sistema muestra un <mensaje_error> y mantiene el estado de la cita

  Examples:
    | paciente | estado_inicial | plazo_cancelacion | mensaje_error                                     |
    | Ana      | Aceptada       | Vencido           | No puedes cancelar la cita con tan poca anticipación |
    | Luis     | Aceptada       | Vencido           | No puedes cancelar la cita con tan poca anticipación |
