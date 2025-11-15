Feature: US10 Aceptar cita
  Como profesional de salud,
  quiero aceptar una cita pendiente
  para confirmar la atención al paciente.

  Scenario: Aceptación exitosa de cita pendiente
    Given existe una cita en estado <estado_inicial> para el <paciente>
    And el <profesional> selecciona la cita
    When confirma la aceptación de la cita
    Then el sistema actualiza el estado a <estado_final> y envía una <notificacion> al paciente

  Examples:
    | profesional | paciente | estado_inicial | estado_final | notificacion           |
    | Dr. Pérez   | Ana      | Pendiente      | Aceptada     | Notificación enviada   |
    | Dr. López   | Luis     | Pendiente      | Aceptada     | Notificación enviada   |

  Scenario: Error al aceptar una cita no pendiente
    Given existe una cita en estado <estado_inicial> que no es Pendiente
    When el <profesional> intenta aceptarla
    Then el sistema muestra un <mensaje_error> y no cambia el estado

  Examples:
    | profesional | estado_inicial | mensaje_error                              |
    | Dr. Pérez   | Cancelada      | Solo se pueden aceptar citas pendientes    |
    | Dr. López   | Reprogramada   | Solo se pueden aceptar citas pendientes    |
