# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

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

# Modal

.modal {
  $base-border-color: #dcdcdc !default;
  $base-border-radius: 3px !default;
  $base-background-color: #fff !default;
  $base-font-size: 1em !default;
  $base-line-height: 1.5em !default;
  $action-color: #477dca !default;
  $dark-gray: #333 !default;
  $light-gray: #ddd !default;
  $medium-screen: em(640) !default;
  $large-screen: em(860) !default;
  $base-font-color: $dark-gray !default;
  $modal-padding: 3em;
  $modal-background: $base-background-color;
  $modal-close-color: $light-gray;
  $modal-image-height: 135px;
  $modal-image-width: $modal-image-height;
  $modal-trigger-image-width: 300px;

  label {
    cursor: pointer;
    margin-bottom: 0;
  }

  label img {
    border-radius: $modal-trigger-image-width / 2;
    display: block;
    max-width: $modal-trigger-image-width;
  }

  .modal-state {
    display: none;
  }

  .modal-trigger {
    padding: 0.8em 1em;
  }

  .modal-fade-screen { // overlay
    @include transition(opacity 0.25s ease);
    @include position(fixed, 0);
    background-color: rgba(#000, 0.85);
    opacity: 0;
    padding-top: 0.6em;
    text-align: left;
    visibility: hidden;
    z-index: 99999999999;

    @include media($large-screen) {
      padding-top: 10em;
    }

    .modal-bg {
      @include position(absolute, 0);
      cursor: pointer;
    }
  }

  .modal-close {
    @include position(absolute, ($modal-padding /2) ($modal-padding /2) null null);
    @include size(1.5em);
    background: $modal-background;
    cursor: pointer;

    &:after,
    &:before {
      @include position(absolute, 3px 3px 0 50%);
      @include transform(rotate(45deg));
      @include size(0.15em 1.5em);
      background: $modal-close-color;
      content: '';
      display: block;
      margin: -3px 0 0 -1px;
    }

    &:hover:after,
    &:hover:before {
      background: darken($modal-close-color, 10%);
    }

    &:before {
      @include transform(rotate(-45deg));
    }
  }

  .modal-inner {
    @include transition(opacity 0.25s ease);
    background: $modal-background;
    border-radius: $base-border-radius;
    margin-top: 0;
    margin: auto;
    max-height: 95%;
    overflow: auto;
    padding: $modal-padding / 2;
    position: relative;
    width: 95%;

    @include media($medium-screen) {
      max-height: 70%;
      padding: $modal-padding;
      width: 60%;
    }

    @include media($large-screen) {
      width: 50%;
    }

    h1 {
      color: $base-font-color;
      margin-bottom: 0 0 0.6em 0;
      text-align: left;
      text-transform: capitalize;
    }

    p {
      color: $base-font-color;
      line-height: $base-line-height;
    }

    .modal-intro {
      margin-bottom: 1em;
    }

    .modal-content {
      color: $base-font-color;

      @include media($medium-screen) {
        @include columns(2 8em);
      }
    }

    a.cta {
      color: $base-background-color;
      display: inline-block;
      margin-right: 0.5em;
      margin-top: 1em;

      &:last-child {
        padding: 0 2em;
      }
    }
  }

  .modal-state:checked + .modal-fade-screen {
    opacity: 1;
    visibility: visible;
  }

  .modal-state:checked + .modal-fade-screen .modal-inner {
    top: 0.5em;
  }
}

.modal-open {
  overflow: hidden;
}

# Based on code by Kasper Mikiewicz

# scroll on page

do (jQuery) ->
  jQuery.mark = jump: (options) ->
    defaults = selector: 'a.scroll-on-page-link'
    if typeof options == 'string'
      defaults.selector = options
    options = jQuery.extend(defaults, options)
    jQuery(options.selector).click (e) ->
      jumpobj = jQuery(this)
      target = jumpobj.attr('href')
      thespeed = 1000
      offset = jQuery(target).offset().top
      jQuery('html,body').animate { scrollTop: offset }, thespeed, 'swing'
      e.preventDefault()
      return
  return
jQuery ->
  jQuery.mark.jump()
  return


# Blog POSTS
$('.js-vertical-tab-content').hide()
$('.js-vertical-tab-content:first').show()

### if in tab mode ###

$('.js-vertical-tab').click (event) ->
  event.preventDefault()
  $('.js-vertical-tab-content').hide()
  activeTab = $(this).attr('rel')
  $('#' + activeTab).show()
  $('.js-vertical-tab').removeClass 'is-active'
  $(this).addClass 'is-active'
  $('.js-vertical-tab-accordion-heading').removeClass 'is-active'
  $('.js-vertical-tab-accordion-heading[rel^=\'' + activeTab + '\']').addClass 'is-active'
  return

### if in accordion mode ###

$('.js-vertical-tab-accordion-heading').click (event) ->
  event.preventDefault()
  $('.js-vertical-tab-content').hide()
  accordion_activeTab = $(this).attr('rel')
  $('#' + accordion_activeTab).show()
  $('.js-vertical-tab-accordion-heading').removeClass 'is-active'
  $(this).addClass 'is-active'
  $('.js-vertical-tab').removeClass 'is-active'
  $('.js-vertical-tab[rel^=\'' + accordion_activeTab + '\']').addClass 'is-active'
  return
