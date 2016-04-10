$(document).ready(function() {
	$("#meeting-show").on("click", ".note-link", function() {
		var note_type = $(this).parent()[0].id.split("-")[0];

		change_dropdown_value(note_type, "#note_id");
		scroll_to("#create-note-container");
	});

	function change_dropdown_value(note_type, dropdown_selector) {
		$(dropdown_selector).val(capitlize_first_letter(note_type));
	}

	function capitlize_first_letter(string) {
		return string.replace(string[0], function(letter) {
			return letter.toUpperCase();
		});
	}

	function scroll_to(location) {
		$("html, body").animate({ scrollTop: $(location).offset().top }, "slow");
	};
});
