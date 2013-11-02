var descriptionHandler = {
  showDescription: function(e, description_json) {
    var $descriptionDiv = $('#topic_'+description_json.topic_id)
    if ($descriptionDiv.hasClass( "closed" )) {
      $descriptionDiv.hide()
      $descriptionDiv.html(description_json.description)
      $descriptionDiv.slideDown("slow")
      $descriptionDiv.prop("class", "open")
    }
    else {
      $descriptionDiv.slideUp("slow")
      $descriptionDiv.prop("class", "closed")
    }
  }
}

$(document).ready(function() {
  $('.description').on('ajax:success', descriptionHandler.showDescription)
});