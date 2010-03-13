$(document).ready(function() {
  $("#event_invitee_ids").tokenInput("/users.json", { hintText: "Escribí el nombre o email de la persona", noResultsText: "Sin resultados :(", searchingText: "Buscando..." })
});
