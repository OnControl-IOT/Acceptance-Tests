Feature: US01 Registro de un usuario
  Como nuevo usuario,
  quiero registrarme proporcionando mis datos personales
  para crear una cuenta y acceder a la aplicación.

  Scenario: Registro exitoso de un usuario
    Given el <usuario> ingresa <nombre>, <correo> y <contraseña> válidos
    When confirma el registro
    Then el sistema crea la <cuenta> y muestra un <mensaje de confirmación>

  Examples:
    | usuario | nombre | correo               | contraseña | cuenta | mensaje de confirmación |
    | Ana     | Ana    | ana@mail.com         | ****       | Creada | Registro exitoso         |
    | Luis    | Luis   | luis@mail.com        | ****       | Creada | Registro exitoso         |

  Scenario: Registro fallido por datos inválidos
    Given el <usuario> ingresa un <correo> con formato inválido
    When intenta registrarse
    Then el sistema muestra un <mensaje de error>

  Examples:
    | usuario | correo        | mensaje de error                  |
    | Ana     | ana@mail      | Correo electrónico no válido      |
    | Luis    | luismail.com  | Correo electrónico no válido      |
