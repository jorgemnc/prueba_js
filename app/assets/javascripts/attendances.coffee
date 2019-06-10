document.addEventListener 'turbolinks:load', ->
  window.form = document.querySelector('.attendance-form')
  window.form && initForm();

initForm = () ->
  choice = window.form.querySelector(".attendance-select");
  rule   = getRule(choice)
  applyRules(rule)

  choice.addEventListener 'change', (event) ->
    rule     = getRule(event.currentTarget)
    applyRules(rule)

getRule = (choice) ->
  selected = choice.options[choice.selectedIndex].value && choice.options[choice.selectedIndex].innerText
  selected = selected || 'unselected'
  rules[choice.name][selected]

applyRules = (rule) ->
  enableElements(rule)
  disableElements(rule)

disableElements = (rule) ->
  selectors = rule['disable']
  toggleElements(selectors, true)

enableElements = (rule) ->
  selectors = rule['enable']
  toggleElements(selectors, false)

toggleElements = (selectors, toggle) ->
  for selector in selectors
    container = window.form.querySelector(selector)
    if container.tagName == 'DIV'
      for input in container.querySelectorAll('select')
        input.disabled = toggle
    else
      container.disabled = toggle

rules =
  'attendance[reason_for_non_attendance_id]':
    'unselected':
      enable: []
      disable: ['.termino', '.inicio', '.guardar']
    'Contratación a plazo indefinido':
      enable: ['.inicio', '.guardar']
      disable: ['.termino']
    'Retiro':
      enable: ['.termino', '.guardar']
      disable: ['.inicio']
    'Subsidios':
      enable: ['.termino', '.inicio', '.guardar']
      disable: []
    'Permiso sin goce de sueldo':
      enable: ['.termino', '.inicio', '.guardar']
      disable: []
    'Incorporación al lugar de trabajo':
      enable: ['.inicio', '.guardar']
      disable: ['.termino']
    'Accidente del trabajo':
      enable: ['.inicio', '.termino', '.guardar']
      disable: []
    'Contratación a plazo fijo':
      enable: ['.inicio', '.termino', '.guardar']
      disable: []
    'Cambio desde contrato plazo fijo a plazo indefinido':
      enable: ['.inicio', '.guardar']
      disable: ['.termino']
