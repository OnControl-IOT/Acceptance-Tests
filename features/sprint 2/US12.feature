Feature: US12 Reprogramar cita
  Como paciente,
  quiero reprogramar una cita
  para ajustarla a una fecha y hora que sí pueda asistir.

  Scenario: Reprogramación de cita exitosa
    Given el <paciente> tiene una cita en estado <estado_inicial>
    And selecciona una <nueva_fecha> y <nueva_hora> válidas
    When confirma la reprogramación
    Then el sistema actualiza la cita a la <nueva_fecha> y <nueva_hora> y muestra un <mensaje_confirmacion>

  Examples:
    | paciente | estado_inicial | nueva_fecha  | nueva_hora | mensaje_confirmacion         |
    | Ana      | Aceptada       | 2025-11-25   | 09:00      | Cita reprogramada con éxito  |
    | Luis     | Pendiente      | 2025-11-27   | 15:30      | Cita reprogramada con éxito  |

  Scenario: Reprogramación rechazada por restricciones de tiempo
    Given el <paciente> tiene una cita en estado <estado_inicial>
    And selecciona una <nueva_fecha> con menos de <horas_minimas> de anticipación
    When intenta confirmar la reprogramación
    Then el sistema muestra un <mensaje_error> y no modifica la fecha de la cita

  Examples:
    | paciente | estado_inicial | nueva_fecha  | horas_minimas | mensaje_error                                             |
    | Ana      | Aceptada       | 2025-11-18   | 24            | No puedes reprogramar con menos de 24 horas de anticipación |
    | Luis     | Pendiente      | 2025-11-19   | 24            | No puedes reprogramar con menos de 24 horas de anticipación |
