function currentBuildChanged () {
    var currentBuild = document.getElementById("currentBuildThingMan").value;
    var docs = document.getElementsByClassName ("addToBuild");
    for (var i=0; i < docs.length; i++) {
        var parts = docs[i].href.split("/");
        docs[i].href = "/" + parts[3] + "/" + currentBuild + "/" + parts[5];
    }
}
