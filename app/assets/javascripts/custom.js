$(document).ready(function() {

	function change_dropdown_value(btn_selector, dropdown_selector) {
		var $product_value = $(btn_selector).data("product-value");
		$(dropdown_selector).val($product_value);
		display_passing_border_color(dropdown_selector);
	}

	$(".fa-plus-circle").click(function() {
		debugger;
	});

	function scroll_to(location) {
		$("html, body").animate({ scrollTop: $(location).offset().top }, "slow");
	};
});
