---
layout: post
title: "HTML Table Column Width Syncing"
---



# How to synchronize column widths on multiple tables.

Say you have two or more tables and you want the automatic column widths to match.
Manually horsing around with predefined widths is a terrible workaround.
Below I'm using JQuery in coffeescript to do a single pass across tables 
containing the class `width_sync` and setting a CSS width as a percentage for all.
I've seen examples where pixel widths are set, but that's bad because you have
to rerun the javascript on window resize which is expensive. 

You'll notice the first table is used as the master, 
but the width percentages are added to all `width_sync` tables.  

```coffeescript
$(document).on 'turbolinks:load', ->
  sync_width = $($('table.width_sync').filter(":first")).width() # Table pixels
  $('table.width_sync').filter(":first").find('th').each (sync_index) ->
    sync_percent = ($(this).width() * 100 / sync_width)
    $('table.width_sync').each ->
      $($(this).find('th')[sync_index]).css('width', sync_percent + "%")

```
