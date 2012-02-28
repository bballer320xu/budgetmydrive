$(document).ready(function(){
	

	var update_model = function(){
		{		
			if ($("select#model_model_year option:selected").text() == null || $("select#model_model_year option:selected").text() == ''){
				$('#model_model_engine_size').html("")
				$('#model_model_transmission').html("")
				$('#model_model_make').html("")
				$('#model_model_name').html("")
			} 
			else {
				var id=$(this).val();
				var dataString = 'id='+ id;
		
				$.ajax({
					type: "POST",
					url: "/update_model_make",
					data: dataString,
					cache: false,
					success: function(html){
						$('#model_model_engine_size').html("")
						$('#model_model_transmission').html("")
						$('#model_model_make').html("")
						$('#model_model_name').html("")
						$('#model_model_make').append('<option></option>')
						$.each(html.values, function(val, text) {
						    $('#model_model_make').append(
						        $('<option></option>').val(text).html(text)
						    );
						});
					}
				});
			}
		}
	}
	
	
	var update_make = function(){
		
			var model_year=$("select#model_model_year option:selected").text();
			var model_make=$("select#model_model_make option:selected").text();

			var dataString = 'model_year='+ model_year+"&model_make=" + model_make;
			$.ajax({
				type: "POST",
				url: "/update_model_name",
				data: dataString,
				cache: false,
				success: function(html){
					$('#model_model_engine_size').html("")
					$('#model_model_transmission').html("")
					$('#model_model_name').html("")
					$('#model_model_name').append('<option></option>')
					$.each(html.values, function(val, text) {
					    $('#model_model_name').append(
					        $('<option></option>').val(text).html(text)
					    );
					});
				}
			});
	}
	
	
	var update_name = function(){
		
			var model_year=$("select#model_model_year option:selected").text();
			var model_make=$("select#model_model_make option:selected").text();
			var model_name=$("select#model_model_name option:selected").text();

			var dataString = 'model_year='+ model_year+"&model_make=" + model_make+"&model_name=" + model_name;
			$.ajax({
				type: "POST",
				url: "/update_model_transmission",
				data: dataString,
				cache: false,
				success: function(html){
					$('#model_model_engine_size').html("")
					$('#model_model_transmission').html("")


						$('#model_model_transmission').append('<option></option>')
						$.each(html.values, function(val, text) {
						    $('#model_model_transmission').append(
						        $('<option></option>').val(text).html(text)
						    );
						});
					
				}
			});
	}
	
	
	var update_transmission = function(){
		
			var model_year=$("select#model_model_year option:selected").text();
			var model_make=$("select#model_model_make option:selected").text();
			var model_name=$("select#model_model_name option:selected").text();
			var model_transmission=$("select#model_model_transmission option:selected").text();

			var dataString = 'model_year='+ model_year+"&model_make=" + model_make+"&model_name=" + model_name+"&model_transmission=" + model_transmission;
			$.ajax({
				type: "POST",
				url: "/update_model_engine_size",
				data: dataString,
				cache: false,
				success: function(html){
					$('#model_model_engine_size').html("")
					$('#model_model_engine_size').append('<option></option>')
						$.each(html.values, function(val, text) {
						    $('#model_model_engine_size').append(
						        $('<option></option>').val(text).html(text)
						    );
						});
				}
			});
	}
	
	
	
	
	
	
	$('#submitBtn').prop('disabled', true);
	$('.required_input').change(function() {
	   inspectAllInputFields();
	});
	
	
	
	function inspectAllInputFields(){
	     var count = 0;
	     $('.required_input').each(function(i){
	       if( $(this).val() == null || $(this).val() == '') {
	           //show a warning?
	           count++;
	        }
	        if(count == 0){
	          $('#submitBtn').prop('disabled', false);
	        }else {
	          $('#submitBtn').prop('disabled', true);
	        }

	    });
	}
	
	
	
	
	
	$("#wrapper")
	.bind("ajax:success", function(event, data, status, xhr) {
			$("#budget").html("Based off this data, your monthly gasoline budget should be $"+data.monthly_budget.toFixed(2)+".");
	})
	.bind("ajax:error",function(xhr, status, error)  {
			$("#budget").html("Error");
	});
	

	
	
	
	

	
	
	
	
	$("#model_model_year").change(update_model);
	$("#model_model_make").change(update_make);
	$("#model_model_name").change(update_name);
	$("#model_model_transmission").change(update_transmission);

	
});