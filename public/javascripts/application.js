$(document).ready(function() {
  var preloadData = eval($("#event_invitee_ids").attr("data-preload"));
  $("#event_invitee_ids").tokenInput("/users.json", { hintText: "Escribí el nombre o email de la persona", noResultsText: "Sin resultados :(", searchingText: "Buscando...", prePopulate: preloadData })
});
