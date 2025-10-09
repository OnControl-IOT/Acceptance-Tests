Feature: US03 Inicio de sesión
  Como usuario registrado,
  quiero iniciar sesión con mis credenciales
  para acceder a las funcionalidades del sistema.

  Scenario: Inicio de sesión exitoso
    Given el <usuario> está registrado en el sistema
    When ingresa su <correo> y <contraseña> válidos
    Then el sistema autentica la sesión y muestra el <panel principal>

  Examples:
    | usuario | correo              | contraseña | panel principal |
    | Ana     | ana@mail.com        | ****       | Dashboard       |
    | Luis    | luis@mail.com       | ****       | Dashboard       |

  Scenario: Inicio de sesión fallido
    Given el <usuario> no tiene una cuenta registrada
    When intenta iniciar sesión con credenciales inválidas
    Then el sistema muestra un <mensaje de error>

  Examples:
    | usuario | correo           | contraseña | mensaje de error                  |
    | Ana     | ana@mail.com     | 1234       | Credenciales incorrectas          |
    | Luis    | noexiste@mail.com| 1111       | Usuario no registrado             |
