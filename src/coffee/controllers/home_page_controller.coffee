###
Crafting Guide - home_page_controller.coffee

Copyright (c) 2015 by Redwood Labs
All rights reserved.
###

AdsenseController = require './adsense_controller'
PageController    = require './page_controller'
_                 = require 'underscore'
{Text}            = require '../constants'

########################################################################################################################

module.exports = class HomeController extends PageController

    constructor: (options={})->
        options.templateName = 'home_page'
        super options

    # PageController Overrides #####################################################################

    getMetaDescription: ->
        return Text.homeDescription()

    # BaseController Overrides #####################################################################

    onDidRender: ->
        @adsenseController = @addChild AdsenseController, '.view__adsense'
        super

    # Backbone.View Overrides ######################################################################

    events: ->
        return _.extend super,
            'click a': 'routeLinkClick'
