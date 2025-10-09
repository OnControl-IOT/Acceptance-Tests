Feature: US37 Visualizar Landing Page
  Como visitante,
  quiero acceder a la página principal de OnControl
  para conocer sus servicios y descargar la aplicación móvil.

  Scenario: Visualización correcta de la landing page
    Given el <visitante> ingresa a la URL principal del sistema
    When la página carga correctamente
    Then se muestran las secciones <Inicio>, <Beneficios> y <Descarga>

  Examples:
    | visitante | secciones                        |
    | Ana       | Inicio, Beneficios, Descarga     |
    | Luis      | Inicio, Beneficios, Descarga     |
