Feature: US36 Visualizar Landing Page
  Como visitante del sitio web,
  quiero visualizar la Landing Page
  para conocer el producto y navegar por sus secciones.

  Scenario: Visualización de secciones principales
    Given el <visitante> ingresa a la Landing Page
    When la página carga correctamente
    Then se muestran las secciones <seccion_1>, <seccion_2> y <seccion_3>

  Examples:
    | visitante | seccion_1      | seccion_2       | seccion_3   |
    | Ana       | Inicio         | Características | Beneficios  |
    | Luis      | Problema       | Acerca de       | Testimonio  |

  Scenario: Navegación por la barra de menú
    Given el <visitante> se encuentra en la Landing Page
    When selecciona el enlace <enlace_nav>
    Then el sistema hace scroll a la sección <seccion_destino>

  Examples:
    | visitante | enlace_nav | seccion_destino  |
    | Ana       | Contacto   | Contacto         |
    | Luis      | Descarga   | Descarga/Footer  |
