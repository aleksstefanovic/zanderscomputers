// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprocketsdirectives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .


function currentBuildChanged () {
    var currentBuild = document.getElementById("currentBuildThingMan").value;
    var docs = document.getElementsByClassName ("addToBuild");
    for (var i=0; i < docs.length; i++) {
        var parts = docs[i].href.split("/");
        docs[i].href = "/" + parts[3] + "/" + currentBuild + "/" + parts[5];
    }
}
