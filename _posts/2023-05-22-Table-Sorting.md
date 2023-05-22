---
layout: post
title: "Sorting HTML Tables with Dentropize"
---


<script type="module">
  import dentropize from "https://cdn.rawgit.com/duffyjp/dentropize/main/dentropize.js";

  document.addEventListener("DOMContentLoaded", function() {
    dentropize();
  });
</script>

<style>
  table.sortable thead th {
    padding-left: 20px;
    background-image: url(data:image/gif;base64,R0lGODlhFQAJAIAAACMtMP///yH5BAEAAAEALAAAAAAVAAkAAAIXjI+AywnaYnhUMoqt3gZXPmVg94yJVQAAOw==);
    background-position: center left;
    background-repeat: no-repeat;
    cursor: pointer;
  }
  table.sortable thead th.dir-u { background-image: url(data:image/gif;base64,R0lGODlhFQAEAIAAACMtMP///yH5BAEAAAEALAAAAAAVAAQAAAINjI8Bya2wnINUMopZAQA7); }
  table.sortable thead th.dir-d { background-image: url(data:image/gif;base64,R0lGODlhFQAEAIAAACMtMP///yH5BAEAAAEALAAAAAAVAAQAAAINjB+gC+jP2ptn0WskLQA7); }
</style>

# [Dentropize](https://github.com/duffyjp/dentropize)

* A barebones Javascript ES6 function to sort tables.
* Detects dates and numbers.
* Empty cells are placed last.


<table class="sortable">
  <thead>
    <tr>
      <th>Movie</th>
      <th>Last View</th>
      <th>Count</th>
    </tr>
  </thead>
  <tr>
    <td>Office Space</td>
    <td>2020-01-03</td>
    <td>3</td>
  </tr>
  <tr>
    <td>Blade</td>
    <td>2013-05-03</td>
    <td>7</td>
  </tr>
  <tr>
    <td>Speed 2</td>  
    <td></td>  
    <td>0</td>  
  </tr>    
  <tr>
    <td>Zorro</td>
    <td>1998-12-04</td>
    <td>1</td>
  </tr>  
  <tr>
    <td>Twilight</td>  
    <td></td>  
    <td>0</td>  
  </tr>  
  <tr>
    <td>Big Hero 6</td>
    <td>2023-05-22</td>
    <td>27</td>
  </tr>
</table>
