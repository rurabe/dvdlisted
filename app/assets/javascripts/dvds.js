
$(window).ready(function(){
	// Render, but hide the divs
	$('#add-director-div').hide()
	$('#add-actor-div').hide()
	$('#new-director-div').hide()
	$('#new-actor-div').hide()

	// Show/hide on click
	$('#add-actor').click(function(){
		$('#add-actor-div').slideToggle('slow')
	})

	$('#new-actor').click(function(){
		$('#new-actor-div').slideToggle('slow')
	})

	$('#add-director').click(function(){
		$('#add-director-div').slideToggle('slow')
	})

	$('#new-director').click(function(){
		$('#new-director-div').slideToggle('slow')
	})	
})



