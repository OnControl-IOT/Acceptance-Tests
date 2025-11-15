Feature: US14 Aceptar/Rechazar cambios en tratamiento
  Como profesional de salud,
  quiero aceptar o rechazar cambios en el tratamiento
  para mantener actualizado el plan terapéutico del paciente.

  Scenario: Aceptar cambios en tratamiento
    Given existe una solicitud de cambio de tratamiento en estado <estado_inicial>
    And el <profesional> revisa los <detalles_cambio>
    When el profesional acepta el cambio y registra un <comentario>
    Then el sistema actualiza el tratamiento y cambia el estado a <estado_final> y muestra un <mensaje_confirmacion>

  Examples:
    | profesional | estado_inicial | detalles_cambio         | comentario                  | estado_final | mensaje_confirmacion            |
    | Dr. Pérez   | Pendiente      | Ajuste de dosis         | Cambio aprobado             | Aprobado     | Cambio de tratamiento aceptado  |
    | Dr. López   | Pendiente      | Cambio de medicamento   | Aprobado según evaluación   | Aprobado     | Cambio de tratamiento aceptado  |

  Scenario: Rechazar cambios en tratamiento
    Given existe una solicitud de cambio de tratamiento en estado <estado_inicial>
    And el <profesional> revisa los <detalles_cambio>
    When el profesional rechaza el cambio e ingresa un <motivo_rechazo>
    Then el sistema mantiene el tratamiento actual, cambia el estado a <estado_final> y muestra un <mensaje_confirmacion>

  Examples:
    | profesional | estado_inicial | detalles_cambio         | motivo_rechazo             | estado_final | mensaje_confirmacion             |
    | Dr. Pérez   | Pendiente      | Suspender medicación    | Riesgo mayor al beneficio  | Rechazado    | Cambio de tratamiento rechazado  |
    | Dr. López   | Pendiente      | Reducir controles       | No cumple criterios clínicos| Rechazado   | Cambio de tratamiento rechazado  |
