Feature: US04 Cierre de sesión
  Como usuario autenticado,
  quiero cerrar sesión en la aplicación
  para proteger mis datos y privacidad.

  Scenario: Cierre de sesión exitoso
    Given el <usuario> tiene una sesión activa
    When selecciona la opción <Cerrar sesión>
    Then el sistema invalida el <token> y redirige al <login>

  Examples:
    | usuario | token     | login      |
    | Ana     | activo    | Pantalla de inicio de sesión |
    | Luis    | activo    | Pantalla de inicio de sesión |
