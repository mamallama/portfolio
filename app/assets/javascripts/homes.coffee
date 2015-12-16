# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#modal-1').on 'change', ->
    if $(this).is(':checked')
      $('body').addClass 'modal-open'
    else
      $('body').removeClass 'modal-open'
    return
  $('.modal-fade-screen, .modal-close').on 'click', ->
    $('.modal-state:checked').prop('checked', false).change()
    return
  $('.modal-inner').on 'click', (e) ->
    e.stopPropagation()
    return
  return

parallax = ->
  if $('#js-parallax-window').length > 0
    plxBackground = $('#js-parallax-background')
    plxWindow = $('#js-parallax-window')
    plxWindowTopToPageTop = $(plxWindow).offset().top
    windowTopToPageTop = $(window).scrollTop()
    plxWindowTopToWindowTop = plxWindowTopToPageTop - windowTopToPageTop
    plxBackgroundTopToPageTop = $(plxBackground).offset().top
    windowInnerHeight = window.innerHeight
    plxBackgroundTopToWindowTop = plxBackgroundTopToPageTop - windowTopToPageTop
    plxBackgroundTopToWindowBottom = windowInnerHeight - plxBackgroundTopToWindowTop
    plxSpeed = 0.35
    plxBackground.css 'top', -(plxWindowTopToWindowTop * plxSpeed) + 'px'
  return

$(document).ready ->
  if $('#js-parallax-window').length
    parallax()
  return
$(window).scroll (e) ->
  if $('#js-parallax-window').length
    parallax()
  return
