---
layout: post
title: "Table Width Syncing"
---


# How to syncronize column widths on multiple tables.

```coffeescript
$(document).on 'turbolinks:load', ->

  # If a table has class "width_sync" match up all other tables column widths.
  # Assigns percentages as CSS so only a single pass of Javascript is required.
  # TODO: Use table with the most rows instead of the first one as the master.
  sync_width = $($('table.width_sync').filter(":first")).width() # Table pixels
  $('table.width_sync').filter(":first").find('th').each (sync_index) ->
    sync_percent = ($(this).width() * 100 / sync_width )
    $('table.width_sync').each ->
      $($(this).find('th')[sync_index]).css('width', sync_percent + "%")

```
