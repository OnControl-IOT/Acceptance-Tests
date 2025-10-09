Feature: US38 Acceso a la aplicación
  Como visitante del sitio web,
  quiero acceder a la aplicación móvil desde la Landing Page
  para descargarla fácilmente e iniciar sesión.

  Scenario: Acceso exitoso a la aplicación móvil
    Given el <visitante> se encuentra en la Landing Page
    When selecciona el botón <Descargar en Play Store>
    Then el sistema redirige correctamente a la <tienda de aplicaciones>

  Examples:
    | visitante | botón seleccionado          | tienda de aplicaciones  |
    | Ana       | Descargar en Play Store     | Google Play             |
    | Luis      | Descargar en App Store      | Apple App Store         |

  Scenario: Redirección fallida por enlace inactivo
    Given el <visitante> selecciona el botón <Descargar en App Store>
    When el enlace no está configurado
    Then el sistema muestra un <mensaje de error>

  Examples:
    | visitante | botón seleccionado     | mensaje de error               |
    | Ana       | Descargar en App Store | Enlace temporalmente no disponible |
