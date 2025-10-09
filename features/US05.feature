Feature: US05 Recuperación de cuenta
  Como usuario que olvidó su contraseña,
  quiero solicitar la recuperación y restablecerla,
  para volver a acceder de forma segura.

  Scenario: Solicitud de recuperación exitosa
    Given el <usuario> está en la pantalla "¿Olvidaste tu contraseña?"
    When ingresa el <email> y confirma la solicitud
    Then el sistema muestra el <mensaje>

  Examples:
    | usuario | email              | mensaje                                        |
    | Ana     | ana@example.com    | Si el correo existe, te enviaremos un enlace  |
    | Luis    | luis@example.com   | Si el correo existe, te enviaremos un enlace  |

  Scenario: Solicitud fallida por email inválido
    Given el <usuario> está en la pantalla "¿Olvidaste tu contraseña?"
    When ingresa el <email> y confirma la solicitud
    Then el sistema muestra el <mensaje>

  Examples:
    | usuario | email             | mensaje                    |
    | Ana     | ana@@example      | Formato de correo inválido |
    | Luis    | luis.example.com  | Formato de correo inválido |
