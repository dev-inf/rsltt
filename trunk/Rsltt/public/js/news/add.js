$(document).ready(function() {
	$('input[type=file]').on('change', function() {
		var path = $('input[type=file]').val();

		$.ajax({
			url: "http://localhost/Laravel/public/admin/news/uploadImage",
			type: "POST",
			enctype: "multipart/form-data",
			data: {
				file:path
			},
			success: function(data) {
				console.log("Success");
				console.log(data);
			},
			error: function(data) {
				console.log("Erreur");
				console.log(data);
			}
		});
	});
});